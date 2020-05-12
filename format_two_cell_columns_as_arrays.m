function [arr1, arr2] = format_two_cell_columns_as_arrays(all_data, col1, col2)

	% get cols as cell arrays
	cell_col1 = all_data(:,col1);
	cell_col2 = all_data(:,col2);

	%find empty elements
	empty_binary = cellfun(@isempty, cell_col1);
	empty_binary = empty_binary | cellfun(@isempty, cell_col2);

	% remove empty element rows from both columns
	cells1 = cell_col1(~empty_binary);
	cells2 = cell_col2(~empty_binary);

	arr1 = cell2mat(cells1)';
	arr2 = cell2mat(cells2)';

end