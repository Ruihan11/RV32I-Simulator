cd build
echo ""
./Simulator ../test-elf/add.riscv
./Simulator ../test-elf/mul-div.riscv 
./Simulator ../test-elf/n!.riscv 
./Simulator ../test-elf/qsort.riscv 
./Simulator ../test-elf/simple-function.riscv 
# ./Simulator ../test-elf/demo.riscv
echo "==============testEND=============="
