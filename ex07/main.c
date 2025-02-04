/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mahug <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/04 06:56:46 by mahug             #+#    #+#             */
/*   Updated: 2025/02/04 06:56:48 by mahug            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>

int	ft_find_next_prime(int nb);

int	main(int argc, char **argv)
{
	int	nb;
	int	next_prime;

	if (argc != 2)
	{
		printf("Usage: %s <number>\n", argv[0]);
		return (0);
	}
	nb = atoi(argv[1]);
	next_prime = ft_find_next_prime(nb);
	printf("%d\n", next_prime);
	return (0);
}
