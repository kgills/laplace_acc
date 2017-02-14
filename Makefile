CC=gcc
C_FLAGS=-fopenacc -O3 
# C_FLAGS+=-Minfo=accel
OUTPUT=laplace.out
L_FLAGS=-lm

all: laplace.c
	$(CC) $(C_FLAGS) $^ -o $(OUTPUT) $(L_FLAGS)

clean:
	@rm -f $(OUTPUT)
	@rm -f slurm*
