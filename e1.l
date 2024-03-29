/* UFBA
 * Template para programa flex.
 * Autora: Christina von Flach
 */

%option noyywrap nodefault yylineno

%{
#include "e1.tab.h"

void yyerror(char *s);
%}

%%

"//".*                { return COMMENT;   }

const                 { return CONST; }
int                   { return INT; }
return                { return RETURN; }
void                  { return VOID; }

[0-9]+                { return NUM; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }

"+"                   { return PLUS; }
"-"                   { return MINUS; }
"*"                   { return MULT; }
"/"                   { return DIV; }      
"="                   { return EQUAL; }
";"                   { return SEMICOLON;}
"("                   { return LEFTPARENTHESIS; }          
")"                   { return RIGHTPARENTHESIS; }      
"_"                   { return UNDER; }

[ \n\t]+              { return BLANK; }

.                     { yyerror("Invalid Caracter"); return ERROR; }



%%

/* Programa para simples conferência (ad-hoc) da saída yylex() */

int main(int argc, char **argv) {
    int token;
    const int N = 15; // número de classes de tokens: olhar programa .y

    // nomes das classes de token (só serve para mostrar e ajudar a conferir) 
    // array token_name precisa ser ajustado ao incluir outros token codes
    
char *token_name[18] = {"COMMENT","CONST", "INT", "ID", "RETURN", "VOID",  "MINUS", "NUM", "PLUS", "SEMICOLON", "MULT", "DIV", "EQUAL", "LEFTPARENTHESIS", "RIGHTPARENTHESIS", "UNDER", "BLANK", "ERROR"};

    while ((token = yylex())) {
       fprintf(stdout,"token code: %d", token);
       fprintf(stdout,", token class: %s", token_name[token-258]);
       fprintf(stdout,", lexeme: %s\n", yytext);
    }
}


