import subprocess



def hex_to_binary(hex_num):
    return bin(int(hex_num, 16))[2:]

def convert_file(input_file, output_file):
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        for line in infile:
            hex_numbers = line.strip().split('_')
            binary_nsumbers = [hex_to_binary(hex_num) for hex_num in hex_numbers]
            outfile.write('_'.join(binary_numbers) + '\n')






# Usage
input_file = 'test(hex).txt'
output_file = 'test(dec).txt'
run_file = 'test(dec).txt'
convert_file(input_file, output_file)


