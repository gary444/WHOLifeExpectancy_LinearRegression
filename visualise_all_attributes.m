
% given a cell matrix loaded from a CSV file, this function visualises all the attributes on a scatter plot
% WRT to a fixed attribute x_attr
% assumes that all cell values in data_cell_matrix are numeric
% removes examples from each plot on a per plot basis


function visualise_all_attributes(data_cell_matrix, categories, x_attr, subplot_rows, subplot_cols)

	numplots = subplot_cols * subplot_rows;
	num_attributes = size(data_cell_matrix,2);

	hold on;

	% for each required dataset, create a subplot
	for plot_id = 1:numplots+1

		if plot_id > num_attributes
			return
		end

		if plot_id ~= x_attr

			mat = format_cell_columns_to_matrix(data_cell_matrix, [x_attr plot_id]);


			pos_id = plot_id;
			if plot_id > x_attr
				pos_id -= 1;
			end

			subplot(subplot_rows,subplot_cols, pos_id);
			plot (mat(:,1), mat(:,2), 'rx');
			xlabel(categories(x_attr))
			ylabel(categories(plot_id))


		end

	end

end