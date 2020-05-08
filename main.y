%{

#include <stdio.h>
#inslude <stdlib.h>
void yyerror (char *c);
int yylex(void);
%}

%token NUM
%token ADICAO MENOS VEZES DIVISAO POTENCIA
%token EPAREN DPAREN
%token EOL

%left ADICAO MENOS
%left VEZES DIVISAO
%right POTENCIA
%right EPAREN DPAREN

%%

INPUT:  ;
INPUT: INPUT LINHA;

LINHA: EOL

LINHA: EXPRESSAO EOL {printf("Resultado: %d\n", $1);}

EXPRESSAO: NUM {$$ = $1;} ;
EXPRESSAO: EXPRESSAO ADICAO EXPRESSAO {$$ = $1 + $3; printf ("%d + %d\n", $1, $3);};
EXPRESSAO: EXPRESSAO MENOS EXPRESSAO {$$ = $1 - $3; printf("%d -%d\n", $1, $3);};
EXPRESSAO: EXPRESSAO VEZES EXPRESSAO {$$ = $1 * $3; printf("%d*%d\n", $1, $3); };
EXPRESSA0: EXPRESSAO DIVISAO EXPRESSAO {$$ = $1 / $3; printf("%d/%d\n", $1, $3); };
EXPRESSAO: EXPRESSAO POTENCIA EXPRESSAO {$$ = pow($1,$3); printf("%d ^ %d\n", $1, $3); };
EXPRESSAO: EPAREN EXPRESSAO DPAREN {$$ = $2; };


%%

void yyerror (char *c) {
}

int main (){
	yyparse();
	return 0;
}
