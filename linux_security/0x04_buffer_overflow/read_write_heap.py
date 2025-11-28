#!/usr/bin/python3
import sys

def main():

    if len(sys.argv) != 4:
        print("Uso: text_search, pide, text_replace")
        sys.exit(1)
    
    pid = sys.argv[1]
    text_search = sys.argv[2]
    text_replace = sys.argv[3]
    if len(text_search) != len(text_replace):
        print("text_search y text_replace deben tener la misma longitud")
        sys.exit(1)
    
    with open(f"/proc/{pid}/maps", "r") as maps_file:
        for line in maps_file:
            if "[heap]" in line:
                heap_info = line.split(" ")
                heap_address = heap_info[0]
                break
    
    heap_start, heap_end = [int(x, 16) for x in heap_address.split("-")]
    heap_size = heap_end - heap_start

    with open(f"/proc/{pid}/mem", "r+b", 0) as mem_file:
        mem_file.seek(heap_start)
        heap_data = mem_file.read(heap_size)

        index = heap_data.find(text_search.encode())
        if index == -1:
            print(f"No se encontró '{text_search}' en el heap del proceso {pid}")
            sys.exit(1)
        
        print(f"Encontrado '{text_search}' en el heap del proceso {pid} en la posición {hex(heap_start + index)}")

        mem_file.seek(heap_start + index)
        mem_file.write(text_replace.encode())
        print(f"Reemplazado '{text_search}' por '{text_replace}' en el heap del proceso {pid}")

if __name__ == "__main__":
    main()