function success = insertEmployee(cellArr)
%INSERTEMPLOYEE 此处显示有关此函数的摘要
%   此处显示详细说明
    try 
        data = load("employeesData.mat").data;
        data(end + 1, :) = cellArr;
        save employeesData data;

        %% Open up a payroll slot
        collection = load('payrollEventsData.mat').collection;
        collection(end+1).data = cell(0, 8);
        save payrollEventsData.mat collection
    catch ME
        warning('Insert employee failed.');
        disp(ME.message)
        success = false;
        return;
    end
    success = true;
end

