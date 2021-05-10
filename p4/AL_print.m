function AL_print(al)
    fprintf('\nAdjacency list:\n');
    for i = 1:size(al)
        fprintf('%d. ', i);
        fprintf('%d ', al{i});
        fprintf('\n');
    end
    fprintf('\n');
end