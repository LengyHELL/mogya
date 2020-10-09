set People;
set Area;

param Score{People};
param Does{People,Area} binary;

var Team{People} binary;

s.t. AllTasks{a in Area}: sum{p in People} Does[p,a] * Team[p] >= 1;

maximize Potential: sum{p in People} Team[p] * Score[p];

data;

set People := Tibor David Botond Bence Mark Balazs;
set Area := Frontend Backend Database CSS Agile DevOps;

param Score :=
  Tibor   0
  David   8
  Botond  -2
  Bence   4
  Mark    3
  Balazs  -10;

param Does :  Frontend  Backend Database  CSS Agile DevOps :=
  Tibor       0         1       0         1   0     0
  David       1         1       0         1   0     0
  Botond      0         0       1         0   1     0
  Bence       0         0       1         1   0     1
  Mark        1         0       0         0   1     0
  Balazs      0         0       1         0   0     1;

end;
