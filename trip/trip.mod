set Stations;

param start_fuel;
param max_fuel;
param total_distance;
param fuel_consumption;
param spare_fuel;

param distance{Stations};
param fuel_price{Stations};

var fill{Stations} >= 0;

s.t. enough_fuel{s in Stations}: (start_fuel + sum{ss in Stations : distance[ss] < distance[s]} fill[ss]) * (100 / fuel_consumption) >= distance[s] + (spare_fuel * (100 / fuel_consumption));

s.t. fuel_needed: (start_fuel + sum{s in Stations} fill[s]) * (100 / fuel_consumption) >= total_distance;

s.t. no_overfill{s in Stations}: start_fuel + (sum{ss in Stations : distance[ss] <= distance[s]} fill[ss]) - (distance[s] * (fuel_consumption / 100)) <= max_fuel;

minimize Fuel_cost: sum{s in Stations} fill[s] * fuel_price[s];

solve;

for {s in Stations} {
  printf "%-15s %5dl - %5dFt\n", s, fill[s], fuel_price[s];
}

end;
