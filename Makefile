##
## Makefile for  in /home/le-rou_c/docs/asm_minilibc
## 
## Made by Lucien Le Roux
## Login   <le-rou_c@epitech.net>
## 
## Started on  Tue Feb 28 09:39:50 2017 Lucien Le Roux
## Last update Tue Feb 28 22:37:04 2017 Lucien Le Roux
##

# Automatic variables:
# https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html

NAME	=	libasm.so

SRC	=	strlen.s	\
		strchr.s	\
		strcmp.s
OBJ	=	$(SRC:.s=.o)

AS	=	nasm -f elf64
LD	=	ld -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2 -shared -g

RM	=	rm -f

all:	$(NAME)

$(NAME):	$(OBJ)
	$(LD) $^ -o $(NAME)

# Object files
strlen.o:	strlen.s
	$(AS) $< -o $@
strchr.o:	strchr.s
	$(AS) $< -o $@
strcmp.o:	strcmp.s
	$(AS) $< -o $@

clean:
	$(RM) $(OBJ)
fclean:	clean
	$(RM) $(NAME)
re:	fclean all
