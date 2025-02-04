/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mahug <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/04 06:57:15 by mahug             #+#    #+#             */
/*   Updated: 2025/02/04 06:57:20 by mahug            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>

int	ft_ten_queens_puzzle(void);

int	main(void)
{
	int	ret;

	ret = ft_ten_queens_puzzle();
	printf("There are %d solutions\n", ret);
	return (0);
}
