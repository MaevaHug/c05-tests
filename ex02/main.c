/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mahug <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/04 06:53:39 by mahug             #+#    #+#             */
/*   Updated: 2025/02/04 06:53:41 by mahug            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>

int	ft_iterative_power(int nb, int power);

int	main(int argc, char **argv)
{
	int	nb;
	int	power;
	int	result;

	if (argc != 3)
	{
		printf("Usage: %s <number> <power>\n", argv[0]);
		return (0);
	}
	nb = atoi(argv[1]);
	power = atoi(argv[2]);
	result = ft_iterative_power(nb, power);
	printf("%d\n", result);
	return (0);
}
