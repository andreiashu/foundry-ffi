import argparse
from eth_abi import encode_single

# 

def main(args):
    if (args.action == 'increment'): 
        increment(args.number)
        return
    
    print("Unknown action: ", args.action)
    exit(1)

def increment(number):
    # uncomment the line below to write debugging
    # info to "input_from_forge_test" file
    # append_to_file(number)
    enc = encode_single('uint256', int(number+1))
    ## append 0x for FFI parsing 
    print("0x" + enc.hex())

def append_to_file(what):
    file_object = open('input_from_forge_test.txt', 'a')
    file_object.write(str(what) + "\n")
    file_object.close()

def parse_args(): 
    parser = argparse.ArgumentParser()
    parser.add_argument("action")
    parser.add_argument("--number", type=int)
    return parser.parse_args()

if __name__ == '__main__':
    args = parse_args() 
    main(args)
