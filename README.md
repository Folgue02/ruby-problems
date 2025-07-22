# Problem solutions in Ruby

## 1. Introduction

This repository contains the solutions *(some are WIP)* for LeetCode and AOC problems, each in their correspondent directory.

## 2. Requirements

- Ruby
- The [gli](https://davetron5000.github.io/gli/) gem installed in your system.
## 3. How to use

The `program_helper` is not part of the code for the problem solutions, its a script that lets you instantiate the file structure and run tests, among other common operations.

### 3.1 To instantiate a new problem

```sh
./problem_helper.rb create leet 101 
```

### 3.2 To run all test files from a problem

```sh
./problem_helper.rb test leet 101
```

For more info run `./problem_helper -h`.