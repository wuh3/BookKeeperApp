function success = createInvoice(idx,units)
    %% Create invoice and update inventory
    number_required = [8, 1, 1, 1, 1, 4, 8, 50, 1, 5, 1];
    try
        cogs = load('cogData.mat').data;
        units_avail = cogs(2);
        if (units > units_avail) 
            warning("We don't that many units in stock!");
            success = false;
            return;
    
        end
    
        price = cogs(1) * 2;
        sales = price * units;
        new_quantity = units_avail - units;
        new_total_cog = new_quantity * cogs(1);
        data = [cogs(1), new_quantity, new_total_cog];
        save cogData.mat data
        % Inventory
        data = load('inventoriesData.mat').data;
        [row, col] = size(data);
        for i = 1:row
            price = str2double(data{i, 2});
            quant = str2double(data{i, 3});
            quant = quant - units * number_required(i);
            value = price * quant;
            part = [data{i, 1}, price, quant, value, data{i, 5}, ""];
            for j = 1:col
                data{i, j} = part{j};
            end
        end
        save inventoriesData.mat data
    catch ME
        warning("Failed to create invoice!");
        disp(ME)
        success = false;
        return;
    end

    %% Update income statement
    try 
        data = load('incomeStatementData.mat').data;
        data.sales = data.sales + sales;
        data.COG = data.COG + units * cogs(1);
        save incomeStatementData.mat data
    catch ME
        warning("Fail to update income statement while creating invoice");
        disp(ME)
        success = false;
        return;

    end
    success = true;
end