var xKF >= 0;
var xNF >= 0;
var xHL >= 0;
var xHM >= 0;
var xVH >= 0;
var xHU >= 0;
var xSP >= 0;
var xPF >= 0;
var xKR >= 0;
var xSF >= 0;

s.t. noMoreWine: 1 * xKF + 2 * xNF + 1 * xHL + 3 * xHM + 2 * xVH + 4 * xHU + 1 * xSP + 6 * xPF + 9 * xKR + 1 * xSF <= 1000;

s.t. noMoreSoda: 1 * xKF + 1 * xNF + 2 * xHL + 2 * xHM + 3 * xVH + 1 * xHU + 4 * xSP + 3 * xPF + 1 * xKR + 9 * xSF <= 1500;

maximize income: 200 * xKF + 330 * xNF + 210 * xHL + 470 * xHM + 400 * xVH + 600 * xHU + 250 * xSP + 900 * xPF + 1500 * xKR + 300 * xSF;
