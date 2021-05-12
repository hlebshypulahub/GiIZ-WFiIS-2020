function layers_print(al)
    fprintf('\nLayers of flow network:\n');
    for i = 1:size(al)
        fprintf('%d. ', i);
        fprintf('%d ', al{i});
        fprintf('\n');
    end
    fprintf('\n');
end