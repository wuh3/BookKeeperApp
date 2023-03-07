function success = insertCustomer(cellArr)
%INSERTEMPLOYEE 此处显示有关此函数的摘要
%   此处显示详细说明
    try 
        data = load("customersData.mat").data;
        data(end + 1, :) = cellArr;
        save customersData data;
        
    catch ME
        warning('Insert customer failed.');
        disp(ME.identifier)
        success = false;
        return;
    end
    success = true;
end

