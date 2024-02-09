import argparse
import sys
def sys_args():
    parser = argparse.ArgumentParser()
    
    parser.add_argument("file")
    parser.add_argument("--AVX2")
    parser.add_argument("--outputfile")
    return parser

def main():
   args = sys_args() 

   print(args.file)
