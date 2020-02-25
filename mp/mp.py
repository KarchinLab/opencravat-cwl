import multiprocessing as mp
import multiprocessing.managers as managers
import time

class MyManager (managers.SyncManager):
    pass

def sayhi():
    with open('out.txt','w') as f:
        f.write(time.ctime())

if __name__ == '__main__':
    manager = mp.Manager()
    manager.start()
    p = mp.Process(target=sayhi)
    p.start()
    p.join()
