#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from typing import Iterable, Generator, List, Union


def say_hello(name: str) -> str:
    """Say hello to a name."""
    return f"Hello, {name}!"


def stringify_add_one(x: int) -> str:
    """Add one to an integer and return the result as a string."""
    return str(x + 1)


def square_number(x: int | float) -> int | float:
    """Square a number."""
    return x * x


def print_from_iterable(array: Iterable[str]) -> None:
    """Print strings in an iterable array."""
    for element in array:
        print(element, sep="\n")


def multiply_iterable(
    array: Iterable[Union[int, float]], by: Union[int, float]
) -> Generator[Union[int, float], None, None]:
    """Multiply every element in an iterable by a number."""
    for num in array:
        yield num * by


# Type checking assertions
assert float | int == Union[float, int], "Types don't match!"
# assert list == List, "Types don't match!"
