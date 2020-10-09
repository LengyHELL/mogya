param nDays;

set Cars;
set Days := 1..nDays;

param initialMoney;
param garages;
param price{Cars, Days};

var buyAndSell{Cars, Days} integer;
var money{{0} union Days} >= 0;
var loan{{0} union Days} >= 0;

s.t. no_extra_sell{d in Days, c in Cars}: sum{dd in 1..d} buyAndSell[c, dd] >= 0;

s.t. no_extra_buy{d in Days}: sum{dd in 1..d, c in Cars} buyAndSell[c, dd] <= garages;

s.t. money_constraint{d in Days}:
  money[d] = money[d - 1] - sum{c in Cars} price[c, d] * buyAndSell[c, d];

s.t. loan_constraint{d in Days}:
  loan[d] = loan[d - 1] -

s.t. starting_money: money[0] = initialMoney;

maximize income: money[nDays];


data;

set Cars := subaru audi volkswagen chevrolet honda;

param nDays := 5;
param initialMoney := 100;
param garages := 5000000000;

param price : 1   2   3   4   5 :=
  subaru      23  25  21  23  24
  audi        15  16  17  18  19
  volkswagen  42  13  34  25  19
  chevrolet   4   5   9   66  48
  honda       12  21  12  21  12;
