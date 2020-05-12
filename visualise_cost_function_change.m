function visualise_cost_function_change(X,y)

	if size(X,2) > 1
		fprintf('will only visualise cost for 1 parameter\n');
		return
	end

	X = [ ones(size(X,1),1) X];
	
	costs = [];

	% change this range for different theta values
	theta1_vals = -1:1:100;

	for theta1_val = theta1_vals
		theta = [0; theta1_val];

		[J,grad] = linear_regression_cost(X,y,theta);
		costs = [costs J];
	end

	plot (theta1_vals, costs);

end