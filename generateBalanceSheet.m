function success = generateBalanceSheet()
try
    inv = load("inventoriesData.mat").data;
    data = load("balanceSheetData.mat").data;
    period = load("paymentPeriodData.mat").data;
    if (data.period < period)
        cash = data.receivable + data.cash - data.total_current_liability;
        data.account_payable = 0;
        [row, ~] = size(inv);
        total = 0;
        for i = 1:row
            value = str2double(inv{i, 4});
            total = total + value;
        end
        inventory = total;
        
        building = 150000;
        equipment = 50000;
        furniture = 10000;
        total_fixed_assets = building + equipment + furniture;
    
        po_Payable = data.po_payable;
        account_payable = data.account_payable;
        receivable = data.receivable;
        total_current_liabilities = po_Payable + account_payable;
        total_current_assets = cash + receivable + inventory;
        total_assets = total_current_assets + total_fixed_assets;
        mortgage = 50000;
        total_long_term_debt = mortgage;
        
        total_liabilities = total_current_liabilities + total_long_term_debt;
        net_worth = total_assets - total_liabilities;
    
        tlnw = total_liabilities + net_worth;
    
        
        data.cash = cash;
        data.receivable = receivable;
        data.inventory = inventory;
        data.total_current_assets = total_current_assets;
        data.building = building;
        data.equipment = equipment;
        data.furniture = furniture;
        data.total_fixed_assets = total_fixed_assets;
        data.total_assets = total_assets;
        data.po_payable = po_Payable;
        data.account_payable = account_payable;
        data.total_current_liability = total_current_liabilities;
        data.mortgage = mortgage;
        data.total_long_term_debt = total_long_term_debt;
        data.total_liabilities = total_liabilities;
        data.net_worth = net_worth;
        data.tlnw = tlnw;
        data.period = period;
        save balanceSheetData.mat data
    else
        data.cash = data.cash;
        data.receivable = data.receivable;
        data.inventory = data.inventory;
        data.total_current_assets = data.cash + data.receivable + data.inventory;
        data.building = data.building;
        data.equipment = data.equipment;
        data.furniture = data.furniture;
        data.total_fixed_assets = data.building + data.equipment + data.furniture;
        data.total_assets = data.total_current_assets + data.total_fixed_assets;
        data.po_payable = data.po_payable;
        data.account_payable = data.account_payable;
        data.total_current_liability = data.po_payable + data.account_payable;
        data.mortgage = data.mortgage;
        data.total_long_term_debt = data.mortgage;
        data.total_liabilities = data.total_current_liability + data.total_long_term_debt;
        data.net_worth = data.total_assets - data.total_liabilities;
        data.tlnw = data.net_worth + data.total_liabilities;
        data.period = data.period;
        save balanceSheetData.mat data
    end

catch ME
    warning("Failed to generate balance sheet!");
    disp(ME.message);
    success = false;
    return;
end
success = true;
end