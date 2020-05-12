clear ; close all; clc

pkg load io;


cols_to_remove = 3;

%load data
all_data = csv2cell("data/Life Expectancy Data.csv");

% columns to use (initial indices)
% 5 adult mortality (y value)
% 7 alcohol
% 9 hepatitis B
% 11 BMI
% 13 Polio
% 14 total expenditure
% 15 diptheria
% 16 hiv/aids
% 17 GDP
% 18 population
% 20 thinness 5-9
% 21 income composition of resources
% 22 schooling

required_data_cols = [5 7 9 11 13 14 15 16 17 18 20 21 22];
% required_data_cols = [5 16]; % single variable test
% required_data_cols = [5 7 9 11 13 14 15];

% get category names
categories = all_data(1,required_data_cols)

% reduce input data according to required columns, remove header
all_data = all_data(2:end,required_data_cols);

% visualisation
%visualise_all_attributes(data_cell_matrix, categories, x_attr, subplot_rows, subplot_cols)
% visualise_all_attributes(all_data, categories, 1, 3, 5);

% format all data into matrix
data_mat = format_cell_columns_to_matrix(all_data, 1:numel(required_data_cols));

size(data_mat)

% allocate data randomly to training, test, and cross val sets: with ratio of 60:20:20
total_examples = size(data_mat,1);
idxs = randperm(total_examples);

X = data_mat(idxs(1:floor(total_examples*0.6)), : );
Xval = data_mat(idxs( floor(total_examples*0.6)+1 : floor(total_examples*0.8)) , : );
Xtest = data_mat(idxs( floor(total_examples*0.8)+1 : end ) , :);

% separate y data
y = X(:,1);
yval = Xval(:,1);
ytest = Xtest(:,1);

% remove y data from feature list
X = X(:,2:end);
Xval = Xval(:,2:end);
Xtest = Xtest(:,2:end);

% feature normalise data
[X, means, stddev] = mean_normalise_and_feature_scale(X);

% checks that cost shows convex shape with one variable, identifies optimal cost visually
% visualise_cost_function_change(X,y);


% run the regression on the training set
theta = linear_regression(X,y);



% print results from some of the test set
Xtest_scaled = (Xtest - repmat(means,size(Xtest,1),1)) ./ repmat(stddev,size(Xtest,1),1);
Xtest_scaled = [ ones(size(Xtest,1),1) Xtest_scaled];
predictions = Xtest_scaled * theta;

printf('Predictions, Actual')
compare = [predictions ytest];
compare(1:20,:)

%% TODO learning curves



return



