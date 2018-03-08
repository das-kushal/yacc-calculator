%{
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
    if (argc > 1 && argv[1])
        yy_scan_string(argv[1]);
    yyparse();
    return 0;
}
%}

%token NUMBER ADD SUB MUL DIV LB RB RET
%define api.value.type {double}

%%
S:
    E { printf("%lf\n", $1); }
    | /* empty */
    ;
E:
    E ADD T { $$=$1+$3; }
    |
    E SUB T { $$=$1-$3; }
    |
    T { $$=$1; }
    ;
T:
    T MUL F { $$=$1*$3; }
    |
    T DIV F { $$=$1/$3; }
    |
    F { $$=$1; }
    ;
F:
    LB E RB { $$=$2; }
    |
    NUMBER { $$=$1; }
    |
    SUB F { $$=-$2; }
    ;
%%