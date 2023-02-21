# About

Coherent Chaos is a web-based hexagonal checkers-like board game. 2 players compete to capture each others' pieces while the hexagonal game board shrinks.

# Setup

For web setup, please see `/web`.  
For mobile setup, please see `/mobile`.

## Deploying the Server

- SSH into appropriate server (eg. via PuTTY)
- `screen -r` or `screen` to open or reopen the server screen
- `ctrl + c` to kill the server (if applicable)
- `git clone [this repo]` or `git pull` to pull in the project
- `git checkout [develop or master]` to select the correct branch
- `cd` into `/web/client` and run `npm install`, then run `npm run [build or build-prod]`
- `cd` into `/web` and run `npm install`, then run `npm run start`
- `ctrl + a` then `d` to exit the screen
- You may now disconnect your SSH session

# Note

This repo is duplicated from `ZackHJ/comp4350-project` and is intended as a fork of the project.  
Perhaps I'll come back to this later and develop it further.
