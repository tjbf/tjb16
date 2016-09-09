classdef zonotope %构造类zonotope 
    properties    %相当于定义成员变量
        c
        g_m
    end
    
    methods   %定义成员函数
        function obj=zonotope(center,generator_matrix) %构造函数
            obj.c=center;
            obj.g_m=generator_matrix;
        end
        function add_zonotope=plus(zonotope1,zonotope2) %重载+
            if strcmp(class(zonotope1),'zonotope') %zonotope+zonotope的形式
            temp.c=zonotope1.c+zonotope2.c;
            temp.g_m=[zonotope1.g_m  zonotope2.g_m];
            add_zonotope=zonotope(temp.c,temp.g_m);
            else
            temp.c=zonotope1+zonotope2.c; %vector+zonotope的形式
            temp.g_m=zonotope2.g_m;
            add_zonotope=zonotope(temp.c,temp.g_m);  
            end
        end
        function mz=mtimes(matrix,zonotope3)  %重载*  matrix*zonotope的形式

            temp2.c=matrix*zonotope3.c;
            temp2.g_m=matrix*zonotope3.g_m;
            mz=zonotope(temp2.c,temp2.g_m);

        end
        function minus_zonotope=minus(zonotope4,zonotope5)% 重载减
            if strcmp(class(zonotope4),'zonotope')  % zonotope-zonotope的形式
            temp3.c=zonotope4.c-zonotope5.c;
            temp3.g_m=[zonotope4.g_m  -zonotope5.g_m];
            minus_zonotope=zonotope(temp3.c,temp3.g_m); 
            else
            temp3.c=zonotope4-zonotope5.c; %vector-zonotope的形式
            temp3.g_m=-zonotope5.g_m;
            minus_zonotope=zonotope(temp3.c,temp3.g_m);  
            end            
        end    
    end
    
        
end