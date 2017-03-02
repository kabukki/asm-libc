##
## Makefile for  in /home/le-rou_c/docs/asm_minilibc
## 
## Made by Lucien Le Roux
## Login   <le-rou_c@epitech.net>
## 
## Started on  Tue Feb 28 09:39:50 2017 Lucien Le Roux
## Last update Thu Mar  2 16:21:24 2017 Lucien Le Roux
##

# Automatic variables:
# https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html

NAME	=	libasm.so

SRC	=	strlen.s	\
		strchr.s	\
		strcmp.s	\
		strncmp.s	\
		strcasecmp.s	\
		rindex.s	\
		strstr.s	\
		strpbrk.s	\
		strspn.s	\
		strcspn.s	\
		memset.s	\
		memcpy.s	\
		memmove.s	\
		tolower.s	\
		toupper.s

OBJ	=	$(SRC:.s=.o)

AS	=	nasm -f elf64 -g
LD	=	ld -shared

RM	=	rm -f

all:	$(NAME)

$(NAME):	$(OBJ)
	$(LD) $^ -o $(NAME)

# Object files
%.o:	%.s
	$(AS) $< -o $@

clean:
	$(RM) $(OBJ)
fclean:	clean
	$(RM) $(NAME)
re:	fclean all
