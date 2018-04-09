%{
#define YYSTYPE double
#include <stdio.h>
#include <string.h>

void yyerror(const char* str)
{
    fprintf(stderr, "error:%s\n", str);
}

int yywrap()
{
    return 1;
}

int main(int argc, char* argv[])
{
    //if (argc > 1 && argv[1])
    //    yy_scan_string(argv[1]);
    yyparse();
    return 0;
}
%}

%token NUMBER ADD SUB MUL DIV LB RB RET

%%
S:
    S E RET { printf("%lf\n", $2); /* 打印表达式的值 */ } /* S->S E RET */
    | /* empty */
    ;
E:
    E ADD {printf("+");}  T { $$=$1+$3; } /* E->E+T */
    |
    E SUB T { $$=$1-$3; } /* E->E-T */
    |
    T { $$=$1; } /* E->T */
    ;
T:
    T MUL F { $$=$1*$3; } /* T->T*F */
    |
    T DIV F { $$=$1/$3; } /* T->T/F */
    |
    F { $$=$1; } /* T->F */
    ;
F:
    LB E RB { $$=$2; } /* F->(E) */
    |
    NUMBER { $$=$1; } /* F->number */
    |
    SUB F { $$=-$2; } /* F->-F (负数) */
    ;
%%