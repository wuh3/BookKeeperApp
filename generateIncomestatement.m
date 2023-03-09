function success = generateIncomestatement()
try
    data = load("incomeStatementData.mat").data;
    sales = double(data.sales);
    COG = double(data.COG);
    payroll = 0;
    payroll_withholding = 0;
    payrollHist = load("payrollEventsData.mat").collection;
    [~, num_employees] = size(payrollHist);
    for i = 1 : num_employees
        hist = payrollHist(i).data;
        [row, ~] = size(hist);
        for j = 1 : row
            payroll = payroll + hist{j, 2};
            payroll_withholding = payroll_withholding + hist{j, 4};
        end
    end
    disp(payroll)
    disp(payroll_withholding)
    bills = 1250;
    annual_expenses = 13750;
    gross_profit = sales - COG;
    total_expenses = payroll - payroll_withholding + bills + annual_expenses;
    operating_income = gross_profit - total_expenses;
    income_tax = operating_income * 0.2;
    net_income = operating_income - income_tax;

    data.gross_profit = gross_profit;
    data.payroll = payroll;
    data.payroll_withholding = payroll_withholding;
    data.bills = bills;
    data.annual_expenses = annual_expenses;
    data.total_expenses = total_expenses;
    data.operating_income = operating_income;
    data.income_tax = income_tax;
    data.net_income = net_income;

    save incomeStatementData.mat data

catch ME
    warning("Failed to generate income statement!");
    disp(ME.message);
    success = false;
    return;
end
success = true;
end