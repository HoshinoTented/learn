grammar Hoshino;

array
    : '[' value (',' value)* ']'
    | '[' ']'
    ;

value
    : Integer
    | String
    | Identity
    | array
    | call
    ;

call
    : Identity '(' value (',' value)* ')'
    | Identity '(' ')'
    ;

WS : [ \t\n\r] -> skip;

fragment
Int
    : '0' | [1-9] [0-9]*
    ;

Integer
    : '-'? Int
    ;

fragment
Char
    : ~ ["\\\u0000-\u001F]+
    ;

String
    : '"' Char* '"'
    | '"' '"'
    ;

Identity
    : ~ [()[\]{},:=\\" ]+
    ;
