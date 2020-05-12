function [J, grad] = linear_regression_cost(theta,X,y)

	J = 0;
	grad = zeros(size(theta));

	m = size(X,1);

	% evaluate cost function evaluating estimates of y using current theta
	h = X * theta;
	cost = h - y;
	j = cost .^ 2;
	J = sum(j) / m / 2;

	% calculate gradients



	weighted_cost = repmat(cost,1,size(theta,1)) .* X;
	grad = (sum(weighted_cost) / m)';



end