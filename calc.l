%{
#define YYSTYPE double
#include <stdio.h>
#include <stdlib.h>
#include "calc.tab.h"
%}
%%
[0-9]+(\.[0-9]+)? yylval=atof(yytext); return NUMBER; /* 数字；变量yylval是数字的值 */
[ ]+                  /* 忽略空格 */
\n                      return RET; /* 回车 */
\+                      return ADD; /* 加号 */
-                       return SUB; /* 减号 */
\*                      return MUL; /* 乘号 */
\/                      return DIV; /* 除号 */
\(                      return LB;  /* 左括号 */
\)                      return RB;  /* 右括号 */
%%