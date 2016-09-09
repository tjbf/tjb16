function result=isinset(vector,zonotope)
[m,n]=size(vector);
result=1;
for i=1:m
    bool=(vector(i)>=zonotope.c(i)-zonotope.g_m(i,i))&(vector(i)<=zonotope.c(i)+zonotope.g_m(i,i));
    result=result&bool;
    if result==0
        break;
    end
end
end