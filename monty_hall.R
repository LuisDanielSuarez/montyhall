monty <- function(doors, car_door, choice) {
    doors_left <- doors[doors != choice]
    if(car_door %in% doors) {
        doors_left <- sample(doors_left[doors_left != car_door], 1)[[1]]
    } else {
        doors_left <- sample(doors_left, 1)[[1]]
        
    }
    invisible(doors_left)        
}


trial <- function(doors, strategy) {
    car_door <- sample(doors, 1)[[1]]
    choice <- sample(doors, 1)[[1]]
    goat_door <- monty(doors, car_door, choice)
    doors_left <- doors[doors != goat_door]
    if(strategy == 'switch') {
        choice <- doors_left[doors_left != choice][[1]]  # Could be modified to pick a random door
    }
    choice == car_door
}


# Experimental setup
doors <- list(1, 2, 3)
obs <- 1000000

winnings <- c(0, 0)
names(winnings) <- c('stay', 'switch')

for(strategy in names(winnings)) {
    for(i in 1:obs) {
        winnings[strategy] <- winnings[strategy] + trial(doors, strategy)
    }
}

for(strategy in names(winnings)) {
    print(sprintf('games won with strategy %s: %d / %d', strategy, winnings[strategy], obs))
}
for(strategy in names(winnings)) {
    print(sprintf('winning probabiliy with strategy %s: %f', strategy, winnings[strategy] / obs))
}

