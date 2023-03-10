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
    parts = ["Tires", "Mixer", "Body Casting", "Cab Casting", "Windshield", "Axles", "Rims", "Screw", "Box", "Labor", "Master Pack"];
    suppliers = ["Tires R Us", "Mr. Mixer", "Casting Man", "Acme Plastics", "Micro Axles", "All Rims", "Screw It", "Many Boxes", "None", "Master Packing"];
    name = parts(idx);
    supplier = suppliers(idx);
    date = datetime('now');
    date.Format = 'MM-dd-yyyy';
    data = load("poHistoriesData.mat").data;
    [row, col] = size(data);
    po_num = row + 1;
    out = [po_num, string(date), supplier, name, quantity, price, value];
    for i = 1 : col
        data{row + 1, i} = out{i};
    end
    save poHistoriesData.mat data

    data = load("balanceSheetData.mat").data;
    data.po_payable = data.po_payable + value;
    save balanceSheetData.mat data

catch ME
    warning("Purchasing Parts Failed!");
    success = false;
    return;
end
success = true;
end

