%%% n - ilość wierzchołków podana jako argument

function g = create_eulerian_graph(n)
        clc;
        
        if str2double(n) < 3
            disp('Enter a number greater than 2');
        else
            while 1
                %%% warunkiem koniecznym i wystarczającym na to by spójny 
                %%% graf nieskierowany był eulerowski jest parzystość 
                %%% stopni wszystkich wierzchołków
                
                %%% losowa sekwencja liczb naturalnych parzystych
                %%% z przedziału <2,8> (nie z przedziału 
                %%% <0, 8> aby była jedna spójna składowa)
                seq = randi(8, 1, n);
                for i = 1:n
                    if mod(seq(i),2) == 1
                        seq(i) = seq(i) + 1;
                    end
                end

                %%% sekwencja musi być ciągiem graficznym - sprawdzenie
                if is_degree_seq(seq)

                    %%% ciąg graficzny grafu
                    DS_print(seq);

                    al = DS_to_AL(seq);
                    am = AL_to_AM(al);

                    g = graph(am);           

                    %%% gdy znaleziono graf eulerowski, zakończ
                    %%% szukanie - wyjście z pętli
                    break;
                end
            end
        end
        
end