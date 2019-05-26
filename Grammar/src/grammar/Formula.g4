grammar Formula;

operator
    : '+' | '-' | '*' | '/'
    ;

formula
    : '(' Integer (operator formula)*')'
    | Integer (operator formula)*
    ;

fragment
Digit
    : [0-9]
    ;

Integer
    : '-'? Digit+
    ;

WS
    : [ \n\r\t] -> skip
    ;

