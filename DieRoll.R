#Function to randomly roll 2 die
roll <- function() {
  die <- 1:6
  dice <- sample (die, size = 2, replace = TRUE)
  sum(dice)
}

#Function to simulate rolling two dice, but with default values specified
roll2 <- function(bones = 1:6) {
  dices <- sample(bones, size = 2, replace = TRUE)
  sum(dices)
}

#Evaluating functions
roll()
roll2()
roll2(1:12)

#inspecting functions
roll
roll2