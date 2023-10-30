import time
import threading


def func1():
    for i in range(1000000):
        if i % 100000 == 0:
          print("func1")
          time.sleep(1)


def func2():
    for i in range(1000000):
        if i % 100000 == 0:
          print("func2")
          time.sleep(1)


if __name__ == "__main__":
    thread_1 = threading.Thread(target=func1)
    thread_2 = threading.Thread(target=func2)

    thread_1.start()
    thread_2.start()
    