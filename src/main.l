%{

#include <stdio.h>
#include <string.h>

int acc[3] = {0, 0, 0}; // email, unicamp, fee
%}

CHAR [a-z0-9\.\-\+]
WORD {CHAR}+

DOMAIN {WORD}
FEE_DOMAIN ({WORD}[.])?fee[.]unicamp[.]br
UNICAMP_DOMAIN ({WORD}[.])?unicamp[.]br

EMAIL {WORD}[@]{DOMAIN}
FEE_EMAIL {WORD}[@]{FEE_DOMAIN}
UNICAMP_EMAIL {WORD}[@]{UNICAMP_DOMAIN}

%%

{FEE_EMAIL} {acc[0]++; acc[1]++; acc[2]++;}
{UNICAMP_EMAIL} {acc[0]++; acc[1]++;}
{EMAIL} {acc[0]++;}

[[:space:]]+ ;
[[:^space:]]+ ;
[.\n]* ;

%%

int main() {
  yylex();
  printf("%d %d %d\n", acc[0], acc[1], acc[2]);
  return 0;
}
