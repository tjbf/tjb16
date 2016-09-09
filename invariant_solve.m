function [theta0,S]=invariant_solve(A,E,w_c,w_)
%����S������ ���伯��S��theta0���ɿɷ�˹���Ͳ��ǲ��伯��Ҳ����˵���伯�Ĵ�С��Sһ���������Ĳ�һ��
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
