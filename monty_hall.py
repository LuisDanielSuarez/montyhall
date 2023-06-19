#!/usr/bin/env python3

import random
import copy


def monty(doors, car_door, choice):
    doors_left = copy.deepcopy(doors)
    doors_left.remove(choice)
    if car_door in doors_left:
        doors_left.remove(car_door)
        return doors_left[0]  # random.choice(door_left)  for more than 3 doors
    else:
        return random.choice(doors_left)


def trial(doors, strategy):
    doors = copy.deepcopy(doors)
    car_door = random.choice(doors)
    choice = random.choice(doors)
    goat_door = monty(doors, car_door, choice)
    doors.remove(goat_door)
    if strategy == 'switch':
        doors.remove(choice)
        choice = doors[0]  # random.choice(doors)  for more than 3 doors
    return choice == car_door


# Experimental setup
doors = [1, 2, 3]
obs = 1000000

winnings = {'stay': 0, 'switch': 0}

for strategy in winnings.keys():
    for i in range(obs):
        winnings[strategy] += trial(doors, strategy)

for strategy in winnings.keys():
    print(f'games won with strategy {strategy}: {winnings[strategy]}/{obs}')
    print(f'winnning probability with strategy {strategy}: {winnings[strategy]/obs}')

