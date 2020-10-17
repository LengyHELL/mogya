set Actors;
set Scenes;

param available{Scenes, Actors};
param charge{Actors};
param duration{Scenes};

param n_days;
param work_hours;

set Days := 1..n_days;

var schedule{Days, Scenes} binary;

var done{Scenes} >= 0;

s.t. no_overworking{d in Days}: sum{s in Scenes}schedule[d, s] * duration[s] <= work_hours * 60;

s.t. checking_done_scenes{s in Scenes}: done[s] = sum{d in Days}schedule[d, s];

s.t. need_all_scenes{s in Scenes}: done[s] >= 1;

minimize Cost: sum{d in Days, s in Scenes} schedule[d, s] * sum{a in Actors}(available[s,a] * charge[a]);

solve;

for {d in Days : sum{s in Scenes}schedule[d, s] >= 1} {
  printf "day: %d | scenes done: ", d;
  for {s in Scenes : schedule[d, s] >= 1} {
    printf "%s ", s;
  }
  printf "| worked hours: %d\n", (sum{s in Scenes}schedule[d, s] * duration[s]) / 60;
}

data;

set Actors := A1 A2 A3 A4 A5 A6;
set Scenes := S1 S2 S3 S4 S5;

param n_days := 20;

param work_hours := 8;

param available :
      A1  A2  A3  A4  A5  A6 :=
  S1  1   0   0   0   1   1
  S2  0   1   0   0   1   0
  S3  1   0   0   1   0   1
  S4  0   1   1   1   1   1
  S5  1   0   1   1   0   0;

param charge :=
  A1  80
  A2  130
  A3  120
  A4  220
  A5  230
  A6  250;

param duration :=
  S1  104
  S2  123
  S3  94
  S4  183
  S5  52;
