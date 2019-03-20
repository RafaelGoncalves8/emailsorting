%{

#include <stdio.h>
#include <string.h>

int acc = {0, 0, 0};
%}

CHAR = [a-z0-9]
WORD = {CHAR}+

USER = [{WORD}[.][-][_][+]]+

DOMAIN = {USER}([.]{WORD})+
FEE_DOMAIN = fee[.]unicamp[.]br
UNICAMP_DOMAIN = ({WORD}[.])*unicamp.br

EMAIL = {USER}[@]{DOMAIN}
FEE_EMAIL = {USER}[@]{FEE_DOMAIN}
UNICAMP_EMAIL = {USER}[@]{UNICAMP_DOMAIN}

%%

.* ;


%%

int main() {
  yylex();
  printf("Nao comecei a resolver o lab ainda!\n");
  return 0;
}
