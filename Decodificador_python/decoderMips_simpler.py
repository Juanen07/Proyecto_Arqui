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
    funct = opcodes_funct.get([op for op in opcodes_funct.keys() if op in instruction.lower()][0], None)
    return f'000000{bins[1]}{bins[2]}{bins[0]}00000{funct}' # Mips: d/s/t --> binary: s/t/d

#aux var
chunk_size = 8

print(
'''
                  [DECODIFICADOR MIPS -> BINARY]
''')
file_address = input('[Ingresar ruta de archivo]: ')

with open(file_address, "r") as infile:
    instructions = infile.readlines()

with open("binary.txt", "w") as outfile:
    for instruction in instructions:
        decoded_instruction = decoder_R(instruction.strip())
        for i in range(0, len(decoded_instruction), chunk_size):
           chunk_bin = decoded_instruction[i:i + chunk_size]
           outfile.write(f"{chunk_bin}\n")

input('[Mensaje sistema]: Archivo decodificado correctamente :D!')
