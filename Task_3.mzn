int: numTasks = 30;
int: numNodes = 20;
set of int: TASKS = 1..numTasks;
set of int: NODES = 1..numNodes;
array[TASKS] of set of NODES: compatible;
array[TASKS] of var NODES: assigned;
constraint forall(t in TASKS)(
  assigned[t] in compatible[t]
);  
constraint forall(n in NODES)(
  count([assigned[t] | t in TASKS], n) <= 5
);
array[NODES] of var bool: used;
constraint forall(n in NODES)(
  used[n] <-> exists(t in TASKS)(assigned[t] == n)
);
var int: numUsed = sum(n in NODES)(bool2int(used[n]));
solve minimize numUsed;
output [
  "Minimum nodes used: ", show(numUsed), "\n",
  "Assignments:\n",
  concat([ "Task \(t): Node \(assigned[t])\n" | t in TASKS ])
];
