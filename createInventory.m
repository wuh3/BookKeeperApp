close all
clc
clear all

% parts = ['Tires', 'Mixer', 'Body Casting', 'Cab Casting', 'Windshield', 'Axles', 'Rims', 'Screw', 'Box', 'Labor', 'Master Pack'];
parts = ["Tires", "Mixer", "Body Casting", "Cab Casting", "Windshield", "Axles", "Rims", "Screw", "Box", "Labor", "Master Pack"];
data = cell(length(parts), 5);
for i = 1:length(parts)
    name = parts(i);
    price = rand / 10 + 0.01;
    quantity = randi(1e7);
    value = price * quantity;
    reorder = 'x';
    row = [name, price, quantity, value, reorder];
    for j = 1:5
       
        data{i, j} = row{j};
    end
%     data(i, :) = {name, price, quantity, value, reorder};
end

save inventoriesData.mat data