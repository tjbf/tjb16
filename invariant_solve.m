function [theta0,S]=invariant_solve(A,E,w_c,w_)
%集合S并不是 不变集，S与theta0的闵可夫斯基和才是不变集，也就是说不变集的大小与S一样，但中心不一样
assert(nargin == 3 || nargin == 4,'number ofinput arguments must be 3 or 4');
[row,~]=size(A);
if nargin == 4
theta0=(diag(ones(1,row))-A)^-1*E*w_c;
[V,lamda]=jordan(A);
if (isreal(V^-1))
    b=(diag(ones(1,row))-abs(lamda))^-1*abs(V^-1*E)*w_;
    S = Polyhedron('A', [V^-1;-V^-1], 'b', [b;b]);
else
   x=sdpvar(row, 1);
   constraints=[ abs(V^-1*x)<=(diag(ones(1,row))-abs(lamda))^-1*abs(V^-1*E)*w_];
S = YSet(x, constraints); 
end
else 
    w_c_temp=w_c.c;
    w_=sum(abs(w_c.g_m),2);
    theta0=(diag(ones(1,row))-A)^-1*E*w_c_temp;
[V,lamda]=jordan(A);
if (isreal(V^-1))
    b=(diag(ones(1,row))-abs(lamda))^-1*abs(V^-1*E)*w_;
    S = Polyhedron('A', [V^-1;-V^-1], 'b', [b;b]);
else
   x=sdpvar(row, 1);
   constraints=[ abs(V^-1*x)<=(diag(ones(1,row))-abs(lamda))^-1*abs(V^-1*E)*w_];
S = YSet(x, constraints); 
end
end
end
