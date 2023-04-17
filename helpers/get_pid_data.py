import psutil
import sys

timestamp = int(sys.argv[1])

def get_mem_info(pid: int): # -> dict[str, int]:
    rss = 0
    pss = 0
    uss = 0
    shared = 0
    shared_file = 0

    for mmap in psutil.Process(pid).memory_maps():
        rss += mmap.rss 
        pss += mmap.pss
        uss += mmap.private_clean + mmap.private_dirty
        shared += mmap.shared_clean + mmap.shared_dirty
        if mmap.path.startswith('/'):  # looks like a file path
            shared_file += mmap.shared_clean + mmap.shared_dirty

    rss = round(rss/1024**2, 3)
    pss = round(pss/1024**2, 3)
    uss = round(uss/1024**2, 3)
    shared = round(shared/1024**2, 3)
    shared_file = round(shared_file/1024**2, 3)

    out = f'{pid},{timestamp},{rss},{pss},{uss},{shared},{shared_file}'
    print(out)

pids = [int(arg) for arg in sys.argv[2:]]
for pid in pids:
    get_mem_info(pid)