# YACC Calculator
A calculator which is written using Lex/Yacc. It supports basic arithmetic operations(addition, subtraction, multiplication and division).

# How to compile it
## Prerequisities
* lex (Flex)
* yacc (Bison)

If you don't have them, please install `flex` and `bison` by using apt-get(for Ubuntu/Debian) or yum(For CentOS/Fedora).

## Compile
```bash
lex calc.l
yacc calc.y
gcc lex.yy.c y.tab.c -o calc
```

# How to use it
```bash
./calc
```
Now you can input your expressions. One expression per line. For example:
```
1+1↙
2.000000
5*(2+3/2)↙
17.500000
(-1)*((1+3+5+7+9)/(2+4+6+8+10))↙
-0.833333
```
Press Ctrl-D to exit.

# Grammer
![](https://latex.codecogs.com/gif.latex?E%5Crightarrow%20E&plus;T%7CE-T%7CT)

![](https://latex.codecogs.com/gif.latex?T%5Crightarrow%20T*F%7CT/F%7CF)

![](https://latex.codecogs.com/gif.latex?F%5Crightarrow%20%28E%29%7Cnum%7C-F)

# License
[MIT License](./LICENSE)