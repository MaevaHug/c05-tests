/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mahug <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/04 06:52:47 by mahug             #+#    #+#             */
/*   Updated: 2025/02/04 06:52:51 by mahug            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>

int	ft_iterative_factorial(int nb);

int	main(int argc, char **argv)
{
	int	nb;
	int	result;

	if (argc != 2)
	{
		printf("Usage: %s <number>\n", argv[0]);
		return (0);
	}
	nb = atoi(argv[1]);
	result = ft_iterative_factorial(nb);
	printf("%d\n", result);
	return (0);
}
