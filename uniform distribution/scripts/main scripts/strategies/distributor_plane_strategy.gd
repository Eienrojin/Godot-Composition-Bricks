class_name DistributorByPlaneStrategy
extends AbstractDistributor


func _by_object_count(count) -> DistributionResult:
	var biggest_line = max(count.x, count.y)
	var x_result_line = _private_by_float(count.x)
	var y_result_line = _private_by_float(count.y)
	var full_result = DistributionResult.new()
	
	if x_result_line.is_valid == false && y_result_line.is_valid == false:
		full_result.is_valid = false
		return full_result
	if count.x <= 0 || count.y <= 0:
		full_result.is_valid = false
		return full_result
	
	for y in count.y:
		for x in count.x:
			full_result.values.append(Vector2(x_result_line.values[x].x, y_result_line.values[y].y))
	
	return full_result


func _by_paddings(padding: Vector2) -> DistributionResult:
	var obj_count_x = ceil(_private_calc_area_size(start_point.x, end_point.x) / padding.x)
	var obj_count_y = ceil(_private_calc_area_size(start_point.y, end_point.y) / padding.y)
	return _by_object_count(Vector2(obj_count_x, obj_count_y))



func _by_fill_to_max(object_size) -> DistributionResult:
	var obj_count_x = ceil(_private_calc_area_size(start_point.x, end_point.x) / object_size.x)
	var obj_count_y = ceil(_private_calc_area_size(start_point.y, end_point.y) / object_size.y)
	return _by_object_count(Vector2(obj_count_x, obj_count_y))
