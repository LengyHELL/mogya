set Alapanyag;
set Recept;

param Osszes{Alapanyag};
param Ar{Recept};
param Arany{Recept, Alapanyag};

var Eladas{Recept} >= 0;

s.t. Limit{a in Alapanyag}: sum{r in Recept} Eladas[r] * Arany[r, a] <= Osszes[a];

maximize Bevetel: sum{r in Recept} Eladas[r] * Ar[r];

data;

set Alapanyag := bor szoda;
set Recept := kisfroccs nagyfroccs hosszulepes hazmester vicehazmester haziur sportfroccs puskas krudy soherfroccs;

param Osszes :=
  szoda 1500
  bor   1000;

param Ar :=
  kisfroccs     200
  nagyfroccs    330
  hosszulepes   210
  hazmester     470
  vicehazmester 400
  haziur        600
  sportfroccs   250
  puskas        900
  krudy         1500
  soherfroccs   300;

param Arany :   bor szoda :=
  kisfroccs			1		1
  nagyfroccs		2		1
  hosszulepes		1		2
  hazmester			3		2
  vicehazmester	2		3
  haziur				4		1
  sportfroccs		1		4
  puskas				6		3
  krudy					9		1
  soherfroccs		1		9;

end;
