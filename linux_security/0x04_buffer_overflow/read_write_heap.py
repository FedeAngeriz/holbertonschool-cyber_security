#!/usr/bin/python3

"""
Script Heat edit
"""

import sys


def main():
    """Main function"""
    if len(sys.argv) != 4:
        print("Uso: pid text_search text_replace")
        sys.exit(1)

    pid = sys.argv[1]
    text_search = sys.argv[2]
    text_replace = sys.argv[3]
    if len(text_search) != len(text_replace):
        print("text_search y text_replace deben tener la misma longitud")
        sys.exit(1)

    maps_file = f"/proc/{pid}/maps"
    mem_path = f"/proc/{pid}/mem"

    heap_start = None
    heap_end = None

    with open(maps_file, "r") as maps:
        for line in maps:
            if "[heap]" in line:
                parts = line.split()
                start, end = parts[0].split("-")
                heap_start = int(start, 16)
                heap_end = int(end, 16)
                break

    if heap_start is None:
        print(f"No se encontró la región heap para el proceso {pid}")
        sys.exit(1)

    with open(mem_path, "r+b", 0) as mem:
        mem.seek(heap_start)
        heap_data = mem.read(heap_end - heap_start)

        index = heap_data.find(text_search.encode())
        if index == -1:
            print(f"No se encontró en el heap del proceso")
            sys.exit(0)

        print(f"Encontrado en el heap del proceso")

        mem.seek(heap_start + index)
        mem.write(text_replace.encode())
        print(f"Reemplazado en el heap del proceso")


if __name__ == "__main__":
    main()
