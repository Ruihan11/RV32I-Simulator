cd ../test-release


rm *.riscv 2>/dev/null
rm *.s 2>/dev/null
truncate -s 0 add.out
truncate -s 0 mul-div.out
truncate -s 0 n!.out
truncate -s 0 qsort.out
truncate -s 0 simple-function.out

riscv32-unknown-elf-gcc -march=rv32i -o add.riscv add.c lib.c
riscv32-unknown-elf-gcc -march=rv32i -o ../test-release/mul-div.riscv mul-div.c lib.c
riscv32-unknown-elf-gcc -march=rv32i -o ../test-release/n!.riscv n!.c lib.c
riscv32-unknown-elf-gcc -march=rv32i -o ../test-release/qsort.riscv qsort.c lib.c
riscv32-unknown-elf-gcc -march=rv32i -o ../test-release/simple-function.riscv simple-function.c lib.c
# riscv32-unknown-elf-gcc -march=rv32i -o ../test-release/input.riscv input.c lib.c

riscv32-unknown-elf-objdump -D add.riscv > add.s
riscv32-unknown-elf-objdump -D mul-div.riscv > mul-div.s
riscv32-unknown-elf-objdump -D n!.riscv > n!.s
riscv32-unknown-elf-objdump -D qsort.riscv > qsort.s
riscv32-unknown-elf-objdump -D simple-function.riscv > simple-function.s
# riscv32-unknown-elf-objdump -D input.riscv > input.s



echo "----------------DONE Compiling----------------"