CC = g++
CFLAGS = -std=c++11 -Wall -pthread
LIBS = -lSDL2_image -lSDL2_ttf -lSDL2 -lpthread -lSDL2_mixer

# Les fichiers source
SRC = $(wildcard src/*.cpp)

# Les fichiers objets
OBJ = $(SRC:.cpp=.o)

# Le nom de l'exécutable
EXEC = main

all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) $(OBJ) $(CFLAGS) $(LIBS) -o $(EXEC)

%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f *.o $(EXEC)

run_valgrind:
	valgrind --leak-check=full --show-reachable=yes ./$(EXEC)

run_valgrind2:
	valgrind --gen-suppressions=all --suppressions=linux_sdl_gl.sup --leak-check=full --show-leak-kinds=all ./$(EXEC)