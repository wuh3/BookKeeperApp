function success = payEmployee(idx, bonus)
%PAYEMPLOYEE 此处显示有关此函数的摘要
%   此处显示详细说明
    federal_perc = 0;
    state_perc = 0;
    social_perc = 0;
    medicare_perc = 0;
    
    try
        employee = load('employeesData.mat').data(idx, :);
        disp(employee{end})
        salary = employee{end} + bonus;
        if salary < 10275
            federal_perc = 0.1 * salary;
        elseif salary < 41775
            federal_perc = 1027.5 + 0.12 * (salary - 10275);
        elseif salary < 89075
            federal_perc = 4807.5 + 0.22 * (salary - 41775);
        elseif salary < 170050
            federal_perc = 15213 + 0.24 * (salary - 89075);
        elseif salary < 215950
            federal_perc = 34647.5 + 0.32 * (salary - 170050);
        elseif salary < 539900
            federal_perc = 48335.5 + 0.35 * (salary - 215950);
        elseif salary > 539900
            federal_perc = 162718 + 0.37 * (salary - 539900);
        end
    
        state_perc = 0.0495 * salary;
        social_perc = 0.062 * salary;
        medicare_perc = 0.0145 * salary;
        take_home = salary - state_perc - federal_perc - social_perc - medicare_perc;
        collection = load('payrollEventsData.mat').collection;
        collection(idx).data(end + 1, :) = {employee{2}, round(employee{end}, 2), bonus, round(federal_perc, 2), round(state_perc, 2), round(social_perc, 2), round(medicare_perc, 2), round(take_home, 2)};
        save payrollEventsData.mat collection

        data = load("balanceSheetData.mat").data;
        data.account_payable = data.account_payable + salary - federal_perc;
        save balanceSheetData.mat data

    catch ME
        warning("Fail to pay employee, check your employee data.");
        disp(ME.message)
        success = false;
        return;
    end
    success = true;
end

