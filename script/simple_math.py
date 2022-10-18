import argparse


def main(args):
    if (args.action == 'increment'): 
        increment(args.number)
        return
    
    print("Unknown action: ", args.action)
    exit(1)

def increment(number):
    print(number + 1)

def parse_args(): 
    parser = argparse.ArgumentParser()
    parser.add_argument("action")
    parser.add_argument("--number", type=int)
    return parser.parse_args()

if __name__ == '__main__':
    args = parse_args() 
    main(args)
