/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mahug <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/04 06:55:20 by mahug             #+#    #+#             */
/*   Updated: 2025/02/04 06:55:22 by mahug            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>

int	ft_fibonacci(int index);

int	main(int argc, char **argv)
{
	int	index;
	int	result;

	if (argc != 2)
	{
		printf("Usage: %s <index>\n", argv[0]);
		return (0);
	}
	index = atoi(argv[1]);
	result = ft_fibonacci(index);
	printf("%d\n", result);
	return (0);
}
