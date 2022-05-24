# cpp-template
My preferred directory setup for c++ terminal projects (with generic makefile!).

## Structure

- **bin** - output executable

- **obj** - object files built by compiler

- **doc** - any notes or configuration files

- **include** - all project/third-party header files

- **lib** - additional libraries required by the project

- **src** - source files

- **test** - testing source files

## Makefile

`make` - compiles source files into bin

`make dev` - same as `make` but generates a compiler commands file

`make clean` - cleans project directory

`tester` - compiles test and source files into bin

## Dependencies

Requires `g++` (you should have this), `make` (you should have this too), and [`compiledb`](https://github.com/nickdiego/compiledb) for the 
compiler flag generation.
