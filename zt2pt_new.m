function pt=zt2pt_new(Z)
[n,p]=size(Z.g_m);
co=combntns(1:p,n-1);%��col��generators������ȡ��row-1��generators�������������һ������ÿ�д���һ��ȡ��
[co_row_num,~]=size(co);%ȡ�����ܵ���ϵĸ���
G=cell(1,co_row_num);
for i=1:co_row_num
    G{1,i}=[];
    for j=1:n-1
       G{1,i}=[G{1,i} Z.g_m(:,co(i,j))];
    end
    if norm(G{1,i},2)<=1e-9
        [row_temp,col_temp]=size(G{1,i});
        C(i,:)=(nX(zeros(row_temp,col_temp)));
    else
    C(i,:)=(nX(G{1,i})).'/norm(G{1,i},2);
    end
    d_add(i,1)=C(i,:)*Z.c+sum(abs(C(i,:)*Z.g_m));
    d_minus(i,1)=-C(i,:)*Z.c+sum(abs(C(i,:)*Z.g_m));
end
A=[C;-C];b=[d_add;d_minus];
pt=Polyhedron('A',A,'b',b);
end

function r=nX(H)
[n,~]=size(H);
Hi=cell(1,n);
r=[];
for i=1:n
    H_temp=H;
    H(i,:)=[];
    Hi{1,i}=H;
    H=H_temp;
    r=[r;(-1)^(i+1)*det(Hi{1,i})];
end
end


