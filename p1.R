
# preliminaries -----------------------------------------------------------

# Load packages
library(tidyverse)
library(ambient)
library(scico)
library(here)

# Parameters
art_par <- list(
  seed = 2,
  n_paths = 500,
  n_steps = 80
)


# setting up the canvas ---------------------------------------------------

set.seed(seed = art_par$seed)

state <- tibble(
  x = runif(n = art_par$n_paths, min = 0, max = 2),
  y = runif(n = art_par$n_paths, min = 0, max = 2),
)

# include path_id and step_id in the state
state <- state %>%
  mutate(
    path_id = 1:art_par$n_paths,
    step_id = 1
  )

# keep track of the series of states
art_dat <- state


# create the art in a loop ------------------------------------------------

stop_painting <- FALSE

while(stop_painting == FALSE) {
  # do some painting

  state <- state %>%
    mutate(
      x = x + .1,
      step_id = step_id + 1
    )

  current_step <- last(state$step_id)
  if(current_step >= art_par$n_steps) {
    stop_painting <- TRUE
  }


}
