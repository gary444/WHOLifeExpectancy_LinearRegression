function theta = linear_regression(X,y)



	% add bias term
	X = [ ones(size(X,1),1) X];
	theta = zeros(size(X,2),1);

	initial_theta = ones(size(X,2),1);
	theta = initial_theta;

	% get intial cost
	% X = [1 0; 1 10];
	% y = [200;1200]
	% [cost, grad] = linear_regression_cost(initial_theta, X, y)

	% call optimisation function with linear_regression_cost function
	options = optimset('GradObj', 'on', 'MaxIter', 3000);
	[theta, cost] = fminunc(@(t)(linear_regression_cost(t, X, y)), initial_theta, options)


	% test cost function with manually implemented
	% iterations = 200;
	% alpha = 0.1;
	% theta = gradient_descent(X, y, theta, alpha, iterations)



	% visualisation for single variable regression
	if size(X,2) == 2

		% draw line with 2 x points
		x_line = [1 0;1 10];
		h = x_line * theta

		figure;
		hold on;
		plot(X(:,2),y,'rx');
		plot(x_line(:,2),h);
		hold off;
	end


end