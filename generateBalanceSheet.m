function success = generateBalanceSheet()
try
    is = load("incomeStatementData.mat").data;
    cash = double(is.sales);
    receivable = 0;
    inv = load("inventoriesData.mat").data;
    [row, ~] = size(inv);
    total = 0;
    for i = 1:row
        value = str2double(inv{i, 4});
        total = total + value;
    end
    inventory = total;
    total_current_assets = cash + receivable + inventory;
    
    building = 150000;
    equipment = 50000;
    furniture = 10000;
    total_fixed_assets = building + equipment + furniture;

    total_assets = total_current_assets + total_fixed_assets;
    
    poHist = load('poHistoriesData.mat').data;
    [row, ~] = size(poHist);
    total = 0;
    for i = 1:row
        value = poHist{i, 7};
        total = total + value;
    end
    po_Payable = total;
    account_payable = is.payroll - is.payroll_withholding;
    
    total_current_liabilities = po_Payable + account_payable;
    
    mortgage = 50000;
    total_long_term_debt = mortgage;
    
    total_liabilities = total_current_liabilities + total_long_term_debt;
    net_worth = total_assets - total_liabilities;

    tlnw = total_liabilities + net_worth;

    data = load("balanceSheetData.mat").data;
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
    save balanceSheetData.mat data
catch ME
    warning("Failed to generate balance sheet!");
    disp(ME.message);
    success = false;
    return;
end
success = true;
end