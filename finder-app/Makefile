.PHONY: all clean


BIN := writer
CC := $(CROSS_COMPILE)gcc
CFLAGS := -Wall -Wextra -g
SRCS := writer.c
OBJECTS := $(patsubst %.c, %.o, $(SRCS))
DEPFILEES := $(patsubst %.c, %.d, $(SRCS))

all: $(BIN)

$(BIN): $(OBJECTS)
	@echo "Linking.."
	${CC} $(OBJECTS) -o $(BIN)

%.o: %.c
	@echo "Creating object.."
	${CC} $(CFLAGS) -c -o $@ $<

clean:
	@echo "Cleaning upp..."
	rm -rvf $(OBJECTS) $(DEPFILEES) $(BIN)

