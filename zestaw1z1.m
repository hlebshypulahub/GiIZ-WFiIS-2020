clear; clc;

MS = readmatrix('macierz_sasiedztwa.txt');
LS = readmatrix('lista_sasiedztwa.txt');

LS_received = convert_MS_to_LS(MS);
MS_received = convert_LS_to_MS(LS);

 print_LS(LS_received);
 fprintf('-----------------------\n');
 print_MS(MS_received);
 fprintf('-----------------------\n');

function print_LS(ls)
    n = size(ls);
    for i = 1:n(1)
        for j = 1:n(2)
            if ls(i,j) > 0
                fprintf('%d ',ls(i,j));
            end
        end
        fprintf('\n');
    end
end

function print_MS(ms)
    n = size(ms);
    for i = 1:n(1)
        for j = 1:n(2)
            fprintf('%d ',ms(i,j));
        end
        fprintf('\n');
    end
    
end

function out  = convert_MS_to_LS(matrix)
    n = size(matrix);
    temp = zeros(n(1),n(2));
    
    for i = 1:n(1)
       counter = 0;
       for j = 1:n(2)
           if matrix(i,j) == 1 
                counter = counter + 1;
                temp(i,counter) = j;
           end
       end
    end
   out = temp;
end

function out  = convert_LS_to_MS(list)
    n = size(list);
    temp = zeros(n(1),n(1));
    
    for i = 1:n(1)
       for j = 1:n(2)
           if list(i,j) > 0
               idx = list(i,j);
               temp(i,idx) = 1;
           end
       end
    end
   out = temp;
end
