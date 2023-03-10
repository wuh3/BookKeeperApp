close all
clc
clear all

parts = ["Tires", "Mixer", "Body Casting", "Cab Casting", "Windshield", "Axles", "Rims", "Screw", "Box", "Labor", "Master Pack"];
data = cell(length(parts), 5);
for i = 1:length(parts)
    name = parts(i);
    price = rand / 10 + 0.01;
    quantity = randi(1e6);
    value = price * quantity;
    reorder = 'x';
    row = [name, round(price, 2), quantity, round(value, 2), reorder];
    for j = 1:5      
        data{i, j} = row{j};
    end
end
save inventoriesData.mat data

%% Calculate COGS

generateCogs();