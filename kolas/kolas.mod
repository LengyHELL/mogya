var xTS >= 0;
var xTGy >= 0;
var xTAs >= 0;
var xTSz >= 0;
var xKS >= 0;
var xKGy >= 0;
var xKAs >= 0;
var xKSz >= 0;
var xDS >= 0;
var xDGy >= 0;
var xDAs >= 0;
var xDSz >= 0;

s.t. TT_nomore: xTS + xTGy + xTAs + xTSz <= 100;
s.t. KO_nomore: xKS + xKGy + xKAs + xKSz <= 400;
s.t. DSZH_nomore: xDS + xDGy + xDAs + xDSz <= 250;

s.t. S_nomore: xTS + xKS + xDS >= 100;
s.t. Gy_nomore: xTGy + xKGy + xDGy >= 350;
s.t. As_nomore: xTAs + xKAs + xDAs >= 50;
s.t. Sz_nomore: xTSz + xKSz + xDSz >= 250;

minimize Cost: 10 * (xTS * 80 + xTGy * 10 + xTAs * 35 + xTSz * 190 + xKS * 70 + xKGy * 35 + xKAs * 50 + xKSz * 150 + xDS * 120 + xDGy * 55 + xDAs * 80 + xDSz * 200);
