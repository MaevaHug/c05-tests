/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mahug <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/04 06:56:36 by mahug             #+#    #+#             */
/*   Updated: 2025/02/04 06:56:38 by mahug            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>

int	ft_is_prime(int nb);

int	main(int argc, char **argv)
{
	int	nb;
	int	is_prime;

	if (argc != 2)
	{
		printf("Usage: %s <number>\n", argv[0]);
		return (0);
	}
	nb = atoi(argv[1]);
	is_prime = ft_is_prime(nb);
	printf("%d\n", is_prime);
	return (0);
}
