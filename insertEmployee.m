function success = insertEmployee(cellArr)
%INSERTEMPLOYEE 此处显示有关此函数的摘要
%   此处显示详细说明
    try 
        data = load("employeesData.mat").data;
        data(end + 1, :) = cellArr;
        save employeesData data;
        
    catch ME
        warning('Insert employee failed.');
        disp(ME.identifier)
        success = false;
        return;
    end
    success = true;
end

