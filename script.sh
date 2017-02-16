#!/bin/bash
#SBATCH -p GPU
#SBATCH --gres=gpu:k80:4
#SBATCH -t 05:00:00
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=kgills@gmail.com
# ./laplace.out

ITERS=$(seq 1 50)
FILE_NAME="k80_16384"
CORE="4"

touch "${FILE_NAME}_${CORE}.txt"
echo "iterations, matrix_dim, etime, flops, cores">>"${FILE_NAME}_${CORE}.txt"

for ITER in ${ITERS}
do
	./laplace_16384.out>>"${FILE_NAME}_${CORE}.txt"
done

