cd build
echo ""
# echo "===============test1==============="
# ./Simulator ../test-elf/add.riscv
# echo "===============test2==============="
# ./Simulator ../test-elf/mul-div.riscv 
# echo "===============test3==============="
# ./Simulator ../test-elf/n!.riscv 
# echo "===============test4==============="
# ./Simulator ../test-elf/qsort.riscv 
# echo "===============test5==============="
# ./Simulator ../test-elf/simple-function.riscv 
echo "===============test6==============="
./Simulator ../test-elf/demo.riscv -s
echo "==============testEND=============="
