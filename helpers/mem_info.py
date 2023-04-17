import psutil

def get_mem_info(pid: int, timestamp: int, parent: bool = False):
    try:
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

        if parent:
            pid = "parent"

        out = f'{pid},{timestamp},{rss},{pss},{uss},{shared},{shared_file}'
        print(out)
    except: 
        return None # If the process doesn't exist anymore, skip it
