---
layout: page
title: Julia 
permalink: /start/julia
nav: 3 
parent: Interfaces 
grand_parent: Getting started 
math: mathjax3
---


## Setting up the problem
In Julia we define the problem as 
```julia
# Define the problem
H = [1 0; 0 1]; 
f = [1;1]; 
A = [1 1; 1 -1];
bupper = [1; 2; 3; 4];
blower = [-1; -2; -3; -4];
sense = zeros(Cint,4);
```
`sense` determines the type of the constraints (more details are given [here](/parameters/#constraint-classification)).

Note: When $$b_u$$ and $$b_l$$ has more elements than the number of rows in $$A$$, the first elements in $$b_u$$ and $$b_l$$ are interpreted as simple bounds. 

## Calling DAQP
There are two ways of calling DAQP in Julia. The first way is through a quadprog call: 
```matlab
x,fval,exitflag,info = DAQP.quadprog(H,f,A,bupper,blower,sense);
```
This will solve the problem with default settings. A more flexible interface is also offered, where we first setup the problem and then solve it 
```matlab
d = DAQP.Model();
DAQP.setup(d;H,f,A,bupper,blower,sense);
[x,fval,exitflag,info] = DAQP.solve(d;H,f,A,bupper,blower,sense);
```
This allows us to reuse internal matrix factorization if we want to solve a perturbed problem. 

## Changing settings
If we, for example, want to change the maximum number of iterations to 2000 we can do so by
```matlab
DAQP.settings(d; Dict(:iter_limit =>2000))
```

A full list of available settings are provided [here]().