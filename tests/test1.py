import multiprocessing as mp
from os import getpid
from time import sleep

def task():
    print(f'Hello, I\'m {getpid()} !!')
    sleep(5)
    print(f'{getpid()} says bye !!')

def main():
    procs = [mp.Process(target=task) for _ in range(10)]
    sleep(3)
    for p in procs:
        p.start()
    for p in procs:
        p.join()

if __name__ == '__main__':
    main()