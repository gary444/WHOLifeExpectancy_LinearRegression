function theta = gradient_descent(X, y, theta, alpha, iterations)

	J_hist = [];

	for i = 1:iterations
		
		[J, grad] = linear_regression_cost(theta,X,y);
		J_hist = [J_hist J];

		theta = theta - (grad*alpha);

	end

	hold on;
	plot(1:iterations, J_hist);
	hold off;


end
