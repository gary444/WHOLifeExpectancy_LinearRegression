function [Xout, means,stddev] = mean_normalise_and_feature_scale(X)

	means = mean(X);
	stddev = std(X);

	num_examples = size(X,1);

	% shift and scale
	Xout = (X - repmat(means,num_examples,1));
	Xout = Xout ./ repmat(stddev,num_examples,1);

end