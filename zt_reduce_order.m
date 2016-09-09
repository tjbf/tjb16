function result=zt_reduce_order(X,s)%注意次函数要求s>n ，当s=n时 实际上求的是zono_hull
H=X.g_m;
[n,r]=size(H);
if r<=s
    result=X;
else
m_norm=zeros(1,r);
H_jian=zeros(n,r);
for i=1:r
    m_norm(1,i)=norm(H(:,i));
end
[~,index] = sort(m_norm,'descend');
for i=1:r
    H_jian(:,i)=H(:,index(i));
end
H_jian_T=H_jian(:,1:s-n);
temp=abs(H_jian(:,s-n+1:r));
temp=sum(temp,2);
Q=diag(temp);

result=zonotope(X.c,[H_jian_T Q]);
end
end