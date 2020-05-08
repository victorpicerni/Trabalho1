%{

#include <stdio.h>
#inslude <stdlib.h>
void yyerror (char *c);
int yylex(void);
%}

%token

%%

%%

void yyerror (char *c) {
}

int main (){
	yyparse();
	return 0;
}
