function [mat] = format_cell_columns_to_matrix(all_data, cols)

	NUMCOLS = size(cols,2);

	% get cols as cell arrays
	% cell_col1 = all_data(:,col1);
	% cell_col2 = all_data(:,col2);

	%find empty elements in every given column
	empty_binary = zeros(size(all_data,1),1);
	for col = 1:NUMCOLS
		target_col = cols(col);

		empty_binary = empty_binary | cellfun(@isempty, all_data(:, target_col));
	end

	reduced_cell_data = all_data(~empty_binary, cols);

	mat = cell2mat(reduced_cell_data);

	% rows_to_remove = size(find(empty_binary),1);

	% mat = zeros(size(all_data,1)-rows_to_remove, NUMCOLS);

	% remove empty element rows from both columns
	% cells1 = cell_col1(~empty_binary);
	% cells2 = cell_col2(~empty_binary);

	% arr1 = cell2mat(cells1)';
	% arr2 = cell2mat(cells2)';

end