var F1 binary;
var F2 binary;
var F3 binary;
var F4 binary;

s.t. B1: F1 + F3 >= 1;
s.t. B2: F2 + F3 >= 1;
s.t. B3: F1 + F3 + F4 >= 1;
s.t. B4: F2 >= 1;
s.t. B5: F3 + F4 >= 1;

minimize Participation: F1 + F2 + F3 + F4;
