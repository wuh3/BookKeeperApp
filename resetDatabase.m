function success = resetDatabase()
    %% reset Income statement
    try
        data = load("incomeStatementData.mat").data;
        data.sales = 0;
        data.COG = 0;
        data.annual_expenses = 0;
        data.gross_profit = 0;
        data.payroll = 0;
        data.payroll_withholding = 0;
        data.bills = 0;
        data.annual_expenses = 0;
        data.total_expenses = 0;
        data.operating_income = 0;
        data.income_tax = 0;
        data.net_income = 0;
        save incomeStatementData.mat data
    catch ME
        warning("Failed to reset income statement data!");
        disp(ME.message);
        success = false;
        return;
    end
    
    %% reset balance sheet
    try
        data = load("balanceSheetData.mat").data;
        data.cash = 100000;
        data.receivable = 0;
        data.po_payable = 0;
        data.account_payable = 0;
        save balanceSheetData.mat data
    catch ME
        warning("Failed to reset balance sheet data!");
        disp(ME.message);
        success = false;
        return;
    end

    %% reset payroll events history
    try
        collection = load("payrollEventsData.mat").collection;
        [~, col] = size(collection);
        for i = 1 : col
            collection(i).data = cell(0, 8);
        end
        save payrollEventsData.mat collection
    catch ME
        warning("Failed to reset payroll event data!");
        disp(ME.message);
        success = false;
        return;
    end

    %% reset po history
    try
        data = load("poHistoriesData.mat").data;
        for i = 1 : col
            data = cell(0, 7);
        end
        save poHistoriesData.mat data
    catch ME
        warning("Failed to reset PO History data!");
        disp(ME.message);
        success = false;
        return;
    end

    success = true;
end