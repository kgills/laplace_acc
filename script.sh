#!/bin/bash
#SBATCH -p GPU
#SBATCH --gre=gpu:p100:2
#SBATCH -t 05:00:00
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=kgills@gmail.com

ITERS=$(seq 1 10)
FILE_NAME0="p100_16384"
FILE_NAME1="p100_8192"
FILE_NAME2="p100_4096"
FILE_NAME3="p100_2048"
FILE_NAME4="p100_1024"
FILE_NAME5="p100_32768"

# touch "${FILE_NAME0}.txt"
# touch "${FILE_NAME1}.txt"
# touch "${FILE_NAME2}.txt"
# touch "${FILE_NAME3}.txt"
# touch "${FILE_NAME4}.txt"
touch "${FILE_NAME5}.txt"
# echo "iterations, matrix_dim, etime, flops, cores">>"${FILE_NAME0}.txt"
# echo "iterations, matrix_dim, etime, flops, cores">>"${FILE_NAME1}.txt"
# echo "iterations, matrix_dim, etime, flops, cores">>"${FILE_NAME2}.txt"
# echo "iterations, matrix_dim, etime, flops, cores">>"${FILE_NAME3}.txt"
# echo "iterations, matrix_dim, etime, flops, cores">>"${FILE_NAME4}.txt"
echo "iterations, matrix_dim, etime, flops, cores">>"${FILE_NAME5}.txt"

for ITER in ${ITERS}
do
	# ./laplace_16384.out>>"${FILE_NAME0}.txt"
	# ./laplace_8192.out>>"${FILE_NAME1}.txt"
	# ./laplace_4096.out>>"${FILE_NAME2}.txt"
	# ./laplace_2048.out>>"${FILE_NAME3}.txt"
	# ./laplace_1024.out>>"${FILE_NAME4}.txt"
	./laplace_32768.out>>"${FILE_NAME5}.txt"
done

