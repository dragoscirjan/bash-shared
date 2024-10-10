#! /bin/bash

# This script provides utility functions for logging and displaying debug, info, warning, and error messages with colored output.
# The functions use ANSI escape codes to color the text for better visibility.
# The Greek letter lambda (λ) is used as a prefix to distinguish log messages.

# lambda (λ) symbol used as a prefix for all log messages
lambda=λ

log() {
  # Print the informational message in $COLOR color
  if [[ -z "$1"]]; then
    while read line; do
      echo -e "$COLOR$lambda INFO $line\033[0m" >&2
    done
  else
    echo -e "$COLOR$lambda INFO $1\033[0m" >&2
  fi
}

###########################################
# debug()
# Prints a debug message in blue if the DEBUG variable is set.
# Arguments:
#   $1 - The debug message to display.
# Output:
#   A blue debug message is printed to STDERR if debugging is enabled.
###########################################
debug() {
  # Check if the DEBUG variable is non-empty
  [[ -n "$DEBUG" ]] && echo -e "\033[0;34m$lambda DEBUG $1\033[0m" >&2
}

###########################################
# error()
# Prints an error message in red and exits the script with a non-zero status.
# Arguments:
#   $1 - The error message to display.
# Output:
#   A red error message is printed to STDERR, and the script exits with status 1.
###########################################
error() {
  # Print the error message in red and exit
  echo -e "\033[0;31m$lambda ERROR $1\033[0m" >&2
  exit 1 # Exit the script with a status code of 1 (indicating an error)
}

###########################################
# info()
# Prints an informational message in green.
# Arguments:
#   $1 - The info message to display.
# Output:
#   A green info message is printed to STDERR.
###########################################
info() {
  # Print the informational message in green
  if [[ -z "$1"]]; then
    while read line; do
      echo -e "\033[0;32m$lambda INFO $line\033[0m" >&2
    done
  else
    echo -e "\033[0;32m$lambda INFO $1\033[0m" >&2
  fi
}

###########################################
# warn()
# Prints a warning message in yellow.
# Arguments:
#   $1 - The warning message to display.
# Output:
#   A yellow warning message is printed to STDERR.
###########################################
warn() {
  # Print the warning message in yellow
  echo -e "\033[1;33m$lambda WARN $1\033[0m" >&2
}
