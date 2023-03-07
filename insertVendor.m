function success = insertVendor(cellArr)
%INSERTEMPLOYEE 此处显示有关此函数的摘要
%   此处显示详细说明
    try 
        data = load("vendorsData.mat").data;
        data(end + 1, :) = cellArr;
        save vendorsData data;
        
    catch ME
        warning('Insert vendor failed.');
        disp(ME.identifier)
        success = false;
        return;
    end
    success = true;
end

