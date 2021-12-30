%% Init 
addpath ../interfaces/matlab/
%% Random qp 
%Generate problem 
n=10;
m = 100;

Mr = randn(n);
H =  Mr'*Mr;
f = randn(n,1);
A = randn(m,n);
b = rand(m,1);

R = chol(H);
M = A/R;
v = R'\f;
d = b+M*v;

% Solve and compare with quadprog solution

sense = zeros(m,1,'int32') ;
[x_daqp,fval_x_daqp, flag, time] =  daqpmex_quadprog(H',f,A',b,sense);
[xref,fval_ref] = quadprog(H,f,A,b);
err=norm(x_daqp-xref)