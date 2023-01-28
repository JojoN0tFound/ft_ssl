# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jojo <jojo@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/28 10:56:11 by jojo              #+#    #+#              #
#    Updated: 2023/01/28 10:56:13 by jojo             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc
CFLAGS = -Wall -Wextra -Werror -g

PROJECT_NAME = ft_ssl_md5
NAME = ft_ssl

INCLUDE = -I ./inc/

SRC_PATH = ./src
INC_PATH = ./inc
OBJ_PATH = ./obj

###################################################################################################

FLAG =

SRC_NAME =

INC_NAME =

###################################################################################################

OBJ_NAME = $(SRC_NAME:.c=.o)

SRC = $(addprefix $(SRC_PATH)/, $(SRC_NAME))
INC = $(addprefix $(INC_PATH)/, $(INC_NAME))
OBJ = $(addprefix $(OBJ_PATH)/, $(OBJ_NAME))

all: logo $(NAME)

$(NAME): $(OBJ) $(INC)
	@$(CC) $(CFLAGS) -o $@ $(OBJ)
	@echo "\e[38;2;0;255;255m$(PROJECT_NAME)\t\e[1;33mCompilation\t\e[0;32m[OK]\e[0m"
	@echo "\e[38;2;0;255;255m$(PROJECT_NAME)\t\e[38;2;255;0;0m$(NAME)\t\t\e[0;32m[OK]\e[0m"

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.c Makefile
	@mkdir $(dir $(OBJ_PATH)/$*) 2> /dev/null || true
	@echo "\e[38;2;0;255;0m[cc]\e[0m: $< -> $@"
	@printf "\e[1A"
	@$(CC) $(CFLAGS) -c $< -o $@
	@printf "\e[0K"

clean:
	@rm -rf $(OBJ) $(OBJ_PATH)
	@echo "\e[38;2;0;255;255m$(PROJECT_NAME)\t\e[1;33mCleaning obj\t\t\e[0;32m[OK]\e[0m"

fclean: clean
	@rm -rf $(NAME) $(LINK)
	@echo "\e[38;2;0;255;255m$(PROJECT_NAME)\t\e[1;33mCleaning exe\t\t\e[0;32m[OK]\e[0m"

logo:
	@echo ""
	@echo  "\e[38;2;255;128;0m:::::::::: :::::::::::       ::::::::   ::::::::  :::        "
	@echo "\e[38;2;255;105;21m:+:            :+:          :+:    :+: :+:    :+: :+:        "
	@echo  "\e[38;2;255;84;42m+:+            +:+          +:+        +:+        +:+        "
	@echo  "\e[38;2;255;63;63m:#::+::#       +#+          +#++:++#++ +#++:++#++ +#+        "
	@echo  "\e[38;2;255;42;84m+#+            +#+                 +#+        +#+ +#+        "
	@echo "\e[38;2;255;21;105m#+#            #+#          #+#    #+# #+#    #+# #+#        "
	@echo  "\e[38;2;255;0;128m###            ###           ########   ########  ########## "
	@echo "\e[0m    \e[38;2;0;255;191m"

re: fclean all

.PHONY: all test clean fclean re logo
