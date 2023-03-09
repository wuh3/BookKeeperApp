function success = generateCogs()
try
    data = load('inventoriesData.mat').data;
    number_required = [8, 1, 1, 1, 1, 4, 8, 50, 1, 5, 1];
    cog = 0;
    for i = 1 : length(number_required)
        price = str2double(data{i, 2});
        quant = str2double(data{i, 3});
        cog = cog + number_required(i) * price;
        units(i) = idivide(quant, int32(number_required(i)));
    end
    units_built = double(min(units));
    total_cog = cog * units_built;
    disp(cog)
    disp(units_built)
    disp(total_cog)
    data = [cog, units_built, total_cog];
    save cogData.mat data
    
catch ME
    warning("Failed to generate cogs data.");
    disp(ME.message);
    success = false;
    return;
end
success = true;
end