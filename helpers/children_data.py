import sys
import mem_info

timestamp = int(sys.argv[1])

pids = [int(arg) for arg in sys.argv[2:]]
for pid in pids:
    mem_info.get_mem_info(pid, timestamp)