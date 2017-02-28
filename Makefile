##
## Makefile for  in /home/le-rou_c/docs/asm_minilibc
## 
## Made by Lucien Le Roux
## Login   <le-rou_c@epitech.net>
## 
## Started on  Tue Feb 28 09:39:50 2017 Lucien Le Roux
## Last update Tue Feb 28 09:43:57 2017 Lucien Le Roux
##

NAME	=	strlen

SRC	=	strlen.s
OBJ	=	$(SRC:.s=.o)

CC	=	nasm -f elf64
LD	=	ld

RM	=	rm -f

all:	$(NAME)


$(NAME):	$(SRC)
	$(CC) $(SRC) -o $(OBJ)
	$(LD) $(OBJ) -o $(NAME)

clean:
	$(RM) $(OBJ)

fclean:	clean
	$(RM) $(NAME)

re:	fclean all
