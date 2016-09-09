function zi2=zono_incl2(intval_A,Z,intval_B,u)
assert(nargin == 2 || nargin == 4,'number ofinput arguments must be 2 or 4');
if nargin==4
temp.c=mid(intval_A)*Z.c+mid(intval_B)*u;
J1=zono_incl(0,intval_A*Z.g_m);
temp.g_m=[J1.g_m  1/2*diam(intval_A)*Z.c  1/2*diam(intval_B)*u];
else
temp.c=mid(intval_A)*Z.c;
J1=zono_incl(0,intval_A*Z.g_m);
temp.g_m=[J1.g_m  1/2*diam(intval_A)*Z.c]; 
end
zi2=zonotope(temp.c,temp.g_m);
end
