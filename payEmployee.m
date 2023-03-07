function success = payEmployee(idx, bonus)
%PAYEMPLOYEE 此处显示有关此函数的摘要
%   此处显示详细说明
    federal_perc = 0;
    state_perc = 0;
    social_perc = 0;
    medicare_perc = 0;
%     try 
%         employee = load('employeesData.mat').data(idx);
%         salary = employee(end) + bonus;
%         if salary < 10275
%             federal_perc = 0.1 * salary;
%         elseif salary < 41775
%             federal_perc = 1027.5 + 0.12 * (salary - 10275);
%         elseif salary < 89075
%             federal_perc = 4807.5 + 0.22 * (salary - 41775);
%         elseif salary < 170050
%             federal_perc = 15213 + 0.24 * (salary - 89075);
%         elseif salary < 215950
%             federal_perc = 34647.5 + 0.32 * (salary - 170050);
%         elseif salary < 539900
%             federal_perc = 48335.5 + 0.35 * (salary - 215950);
%         elseif salary > 539900
%             federal_perc = 162718 + 0.37 * (salary - 539900);
%         end
% 
%         state_perc = 0.0495 * salary;
%         social_perc = 0.062 * salary;
%         medicare_perc = 0.0145 * salary;
%         take_home = salary - state_perc - federal_perc - social_perc - medicare_perc;
%         data = load('payrollEventsData.mat').data;
%         data(idx, end + 1) = {employee(end), bonus, federal_perc, state_perc, social_perc, medicare_perc, take_home};
%         save payrollEventsData.mat data
%     catch ME
%         warning("Unable to calculate payroll. Check your employee info.")
%         success = false;
%         return;
%     end
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
    collection(idx).data(end + 1, :) = {employee{2}, employee{end}, bonus, federal_perc, state_perc, social_perc, medicare_perc, take_home};
    save payrollEventsData.mat collection
    success = true;
end
