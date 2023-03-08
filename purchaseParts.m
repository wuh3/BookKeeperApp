function success = purchaseParts(idx, quantity)
try    
    data = load("inventoriesData.mat").data;
    price = str2double(data{idx, 2});
    value = price * quantity;

    %% Calculate resulting values and update inventory
    newQuant = str2double(data{idx, 3}) + quantity;
    newTotal = str2double(data{idx, 4}) + value;
    row = ["", round(newQuant, 2), round(newTotal, 2)];
    data{idx, 3} = row{2};
    data{idx, 4} = row{3};
    data{idx, 5} = 'O';
    save inventoriesData.mat data
    %% Update PO history
    
catch ME
    warning("Purchasing Parts Failed!");
    success = false;
    return;
end
success = true;
end

