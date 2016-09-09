function z=zono_hull(zono)
temp=sum(abs(zono.g_m),2);
z=zonotope(zono.c,diag(temp));
end