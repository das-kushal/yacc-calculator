# YACC Calculator
A calculator which is written using Lex/Yacc. It supports basic arithmetic operations(addition, subtraction, multiplication and division). :iphone:

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
Use the expression as a command line argument. For example:
```
./calc 1+1
2.000000
```
```
./calc "(-1)*(2+3)"
-5.000000
```

# License
[MIT License](./LICENSE)