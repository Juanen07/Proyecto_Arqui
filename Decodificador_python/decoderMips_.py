import re

opcodes_funct = {
    "add": "100000",
    "mul": "000010",
    "sub": "100010",
    "div": "011010", 
    "or" : "100101",
    "and": "100100",
    "slt": "101010",
    "nop" : "000000"
    }

def decoder_R(instruction):

    bins = [format(int(num), '05b') for num in re.findall(r'-?\d+\.?\d*', instruction)]
    op_list = find_in_str(opcodes_funct.keys(), instruction)

    if op_list != []:
        funct = opcodes_funct.get(op_list[0], None)
    else:
        funct = None
    
    return f'000000{bins[1]}{bins[2]}{bins[0]}00000{funct}'
    
def find_in_str(word_list, string):
    
    string = string.lower()
    found_words = []

    for word in word_list:
        word = word.lower()

        if word in string.lower():
            found_words.append(word)

    return found_words

#aux var
chunk_size = 8

print(
'''
                  [DECODIFICADOR MIPS -> BINARY]
''')
file_address = input('[Ingresar ruta de archivo]: ')

with open(file_address, "r") as infile:
    instructions = infile.readlines()

with open("output.txt", "w") as outfile:
    for instruction in instructions:
        decoded_instruction = decoder_R(instruction.strip())
        for i in range(0, len(decoded_instruction), chunk_size):
           chunk_bin = decoded_instruction[i:i + chunk_size]
           outfile.write(f"{chunk_bin}\n")

input('[Mensaje sistema]: Archivo decodificado correctamente :D!')
