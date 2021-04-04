function al = AM_to_AL(am)
    al = cellfun(@(x) find(x), num2cell(am, 2), 'UniformOutput', false);
end

% function out  = convert_MS_to_LS(matrix)
%     n = size(matrix);
%     temp = zeros(n(1),n(2));
%     
%     for i = 1:n(1)
%        counter = 0;
%        for j = 1:n(2)
%            if matrix(i,j) == 1 
%                 counter = counter + 1;
%                 temp(i,counter) = j;
%            end
%        end
%     end
%    out = temp;
% end