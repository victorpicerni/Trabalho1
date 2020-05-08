%{
#include <stdlib.h>
void yyerror (char *);

#include "y.tab.h"

%}

DIGITO [0-9]
NUMERO {DIGITO}+
EXPOENTE [^]{NUMERO}
REAL {NUMERO}("."{NUMERO})?{EXPOENTE}?

%%

{NUMERO} {yylval = atoi(yytext);
		return NUM;
	   }

[+] return ADD;
[-] return SUB;
[*] return MUL;
[/] return DIV;
[^] return POT;
[(] return EPAREN;
[)] return DPAREN;
\n return EOL;


%%

int yywrap () {
	return 1;
}
