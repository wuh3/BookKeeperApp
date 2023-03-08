close all
clc
clear all

parts = ["Tires", "Mixer", "Body Casting", "Cab Casting", "Windshield", "Axles", "Rims", "Screw", "Box", "Labor", "Master Pack"];
number_required = [8, 1, 1, 1, 1, 4, 8, 50, 1, 5, 1];
data = cell(length(parts), 5);
COG = 0;
for i = 1:length(parts)
    name = parts(i);
    price = rand / 10 + 0.01;
    quantity = randi(1e6);
    COG = COG + number_required(i) * price;
    units(i) = idivide(int64(quantity), int64(number_required(i)));
    value = price * quantity;
    reorder = 'x';
    row = [name, round(price, 2), quantity, round(value, 2), reorder];
    for j = 1:5      
        data{i, j} = row{j};
    end
end

%% Calculate COGS
total_COG = COG * min(units);

save inventoriesData.mat data
data = [COG min(units) total_COG];
save cogData data