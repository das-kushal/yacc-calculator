%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}
%%
[0-9]+(\.[0-9]+)? yylval=atof(yytext); return NUMBER;
[ ]+                  /* ignore whitespace */
\n                      return RET;
\+                      return ADD;
-                       return SUB;
\*                      return MUL;
\/                      return DIV;
\(                      return LB;
\)                      return RB;
%%