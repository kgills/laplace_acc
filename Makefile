CC=pgcc
C_FLAGS=-acc -O4 -ta=tesla:8.0 -Munroll -mcmodel=medium
# C_FLAGS+=-Minfo=accel 
OUTPUT=laplace_16384.out

all: laplace.c
	$(CC) $(C_FLAGS) $^ -o $(OUTPUT) $(L_FLAGS)

clean:
	@rm -f $(OUTPUT)
	@rm -f slurm*
