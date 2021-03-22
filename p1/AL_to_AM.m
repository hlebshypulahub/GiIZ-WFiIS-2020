function am  = AL_to_AM(al)
    [n, ~] = size(al);
    am = zeros(n);
    
    for i = 1:n
        [~, m_temp] = size(al{i});
        for j = 1:m_temp
            neighbour = al{i}(j);
            am(i, neighbour) = 1;
            am(neighbour, i) = 1;
            for k = 1:size(al{neighbour})
               if al{neighbour}(k) == i
                   al{neighbour}(k) = [];
               end
            end
       end
    end
end



% function out  = convert_LS_to_MS(list)
%     n = size(list);
%     temp = zeros(n(1),n(1));
%     
%     for i = 1:n(1)
%        for j = 1:n(2)
%            if list(i,j) > 0
%                idx = list(i,j);
%                temp(i,idx) = 1;
%            end
%        end
%     end
%    out = temp;
% end