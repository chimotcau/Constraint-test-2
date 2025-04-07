int: N = 105;     
int: n = 5;        
int: m = 2;        
array[1..N] of var 0..1: chip;  % 0 = white, 1 = black
var int: num_white = sum(i in 1..N)(1 - chip[i]);
solve maximize num_white;
constraint
  forall(i in 1..N - (n + m - 2)) (
    sum(j in i..i + n + m - 2)(1 - chip[j]) <= n - 1
  );
