function success = deleteEmployee(idx)
%DELETEEMPLOYEE 此处显示有关此函数的摘要
%   此处显示详细说明
    try
        data = load('employeesData.mat').data;
        lastName = data(idx, 1);
        data(idx, :) = [];
        save employeesData data;
        disp("Successfully deleted " + string(lastName));
    catch ME
        warning("Unable to find this employee or invalid index.");
        success = false;
        return;
    end
    success = true;
end

