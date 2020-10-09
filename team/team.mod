var Ti binary;
var Da binary;
var Bo binary;
var Be binary;
var Ma binary;
var Ba binary;

s.t. Frontend: Da + Ma >= 1;
s.t. Backen: Ti + Da + Be >= 1;
s.t. DB: Da + Bo + Be + Ba >= 1;
s.t. CS: Be + Ti >= 1;
s.t. Agilis: Bo + Ma >= 1;
s.t. DevOps: Be + Ba >= 1;

maximize Capability: Ti * 0 + Da * 8 + Bo * -2 + Be * 4 + Ma * 3 + Ba * -10;
