grammar String;

value
    : String
    | Identity
    | Integer
    | call
    ;

call
    : Identity '(' (value (',' value)*)* ')'
    ;

fragment
Int
    : [0-9]
    ;

fragment
Escape
    : '\\' [\\"/nrb]
    ;

fragment
Char
    : ~ ["\\\u0000-\u001F]
    ;

Integer
    : '0' | [1-9] Int*
    ;

Identity
    : [a-zA-Z] [0-9a-zA-Z]*
    ;

String
    : '"' (Escape | Char)* '"'
    ;

WS
    : [ \n\t\r] -> skip
    ;