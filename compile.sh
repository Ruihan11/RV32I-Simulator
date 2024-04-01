rm test-elf/*.riscv 2>/dev/null
rm test-elf/*.s 2>/dev/null
cd test-release
riscv32-unknown-elf-gcc -march=rv32i -o ../test-elf/add.riscv add.c lib.c
riscv32-unknown-elf-gcc -march=rv32i -o ../test-elf/mul-div.riscv mul-div.c lib.c
riscv32-unknown-elf-gcc -march=rv32i -o ../test-elf/n!.riscv n!.c lib.c
riscv32-unknown-elf-gcc -march=rv32i -o ../test-elf/qsort.riscv qsort.c lib.c
riscv32-unknown-elf-gcc -march=rv32i -o ../test-elf/simple-function.riscv simple-function.c lib.c
riscv32-unknown-elf-gcc -march=rv32i -o ../test-elf/input.riscv input.c lib.c

cd ../test-elf
riscv32-unknown-elf-objdump -D add.riscv > add.s
riscv32-unknown-elf-objdump -D mul-div.riscv > mul-div.s
riscv32-unknown-elf-objdump -D n!.riscv > n!.s
riscv32-unknown-elf-objdump -D qsort.riscv > qsort.s
riscv32-unknown-elf-objdump -D simple-function.riscv > simple-function.s
riscv32-unknown-elf-objdump -D input.riscv > input.s
echo "----------------DONE Compiling----------------"