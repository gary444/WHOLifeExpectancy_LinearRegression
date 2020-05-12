clear ; close all; clc

pkg load io;


cols_to_remove = 3;

%load data
all_data = csv2cell("data/Life Expectancy Data.csv");

categories = all_data(1,cols_to_remove+1:end)

% remove header and first 3 columns
all_data = all_data(2:end,cols_to_remove+1:end);

%visualise_all_attributes(data_cell_matrix, categories, x_attr, subplot_rows, subplot_cols)
visualise_all_attributes(all_data, categories, 2, 4, 5);

return



