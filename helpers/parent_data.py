import sys
import mem_info

timestamp = int(sys.argv[1])
pid = int(sys.argv[2])

mem_info.get_mem_info(pid, timestamp, True)