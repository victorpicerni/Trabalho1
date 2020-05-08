%{

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
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

LINHA: EOL;

LINHA: EXPRESSAO EOL {printf("Resultado: %d\n", $1);};

EXPRESSAO:  
	NUM {$$ = $1;} 
	| EXPRESSAO ADICAO EXPRESSAO {$$ = $1 + $3; printf ("%d + %d\n", $1, $3);}
	| EXPRESSAO MENOS EXPRESSAO {$$ = $1 - $3; printf("%d -%d\n", $1, $3);}
	| EXPRESSAO VEZES EXPRESSAO {$$ = $1 * $3; printf("%d*%d\n", $1, $3); }
	| EXPRESSAO DIVISAO EXPRESSAO {$$ = $1 / $3; printf("%d/%d\n", $1, $3); }
	| EXPRESSAO POTENCIA EXPRESSAO {int i = 1;
				while (i < $3){
				$$ = $$*$1;
				i++;  
				};
				printf("%d ^ %d\n", $1, $3); }
	| EPAREN EXPRESSAO DPAREN {$$ = $2; }


%%

void yyerror (char *c) {
}

int main (){
	yyparse();
	return 0;
}
