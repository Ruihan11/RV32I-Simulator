rm -r build
rm dump.txt

mkdir build
cd build
cmake ..
make

cd ../test-release
truncate -s 0 add.out
truncate -s 0 mul-div.out
truncate -s 0 n!.out
truncate -s 0 qsort.out
truncate -s 0 simple-function.out