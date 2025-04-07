int: min = -1000;
int: max = 1000;

var min..max: x1;
var min..max: y1;
var min..max: z1;
constraint 2 * x1 + y1*y1*y1 == z1*z1 - y1 - 17;
constraint x1*x1 - y1 + 3*z1 == 11;
constraint x1 * y1 == 2*y1 + 5*z1;

var min..max: x2;
var min..max: y2;
var min..max: z2;
constraint 2 * x2 + y2*y2 == z2*z2 - 2*y2*z2 + 5;
constraint x2 * y2 == 2*y2 + 5*z2;
constraint x2 + 5*z2 == -2*y2;
constraint 6 * y2 * z2 == x2 + 10;
solve satisfy;
output [
  "System 1 Solution:\n",
  "x = ", show(x1), ", y = ", show(y1), ", z = ", show(z1), "\n\n",
  "System 2 Solution:\n",
  "x = ", show(x2), ", y = ", show(y2), ", z = ", show(z2), "\n"
];
