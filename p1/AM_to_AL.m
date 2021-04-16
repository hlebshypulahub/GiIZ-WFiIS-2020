function al = AM_to_AL(am)
    al = cellfun(@(x) find(x), num2cell(am, 2), 'UniformOutput', false);
end