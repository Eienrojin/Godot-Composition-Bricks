class_name Distribution
extends Node

# Distribution by a straight line. It's designed to hold a user defined amount of objects
static func by_line(start: float, end: float, obj_count: int) -> DistributionResult:
	var result = DistributionResult.new()
	var relative_line_length = calc_area_size(start, end)
	var pos_bias = relative_line_length / (obj_count - 1)
	var current_value = start
	
	if obj_count <= 0:
		result.is_valid = false
	
	if result.is_valid:
		for i in obj_count:
			result.values.append(current_value)
			current_value += pos_bias
		return result
	
	return result

# Distribution by a straight plane. It's designed to hold a user defined amount of objects
static func by_plane(start: Vector2, end: Vector2, obj_count_x: int, obj_count_y: int) -> DistributionResult:
	var x_result_line = by_line(start.x, end.x, obj_count_x)
	var y_result_line = by_line(start.y, end.y, obj_count_y)
	var full_result = DistributionResult.new()
	
	if x_result_line.is_valid == false && y_result_line.is_valid == false:
		full_result.is_valid = false
		return full_result
	if obj_count_x <= 0 || obj_count_y <= 0:
		full_result.is_valid = false
		return full_result
	
	for i in obj_count_x:
		for j in obj_count_y:
			full_result.values.append(Vector2(x_result_line.values[i], y_result_line.values[j]))
	
	return full_result

# Completely fills the line with elements without intersection. Automatically determines the number of elements
static func fill_line_by_padding(start: float, end: float, obj_size: float = 0.0) -> DistributionResult:
	var obj_count = ceil(calc_area_size(start, end) / obj_size)
	return by_line(start, end, obj_count)


# Completely fills the plane with elements without intersection. Automatically determines the number of elements
static func fill_plane_by_padding(start: Vector2, end: Vector2, obj_size: Vector2 = Vector2.ZERO):
	var obj_count_x = ceil(calc_area_size(start.x, end.x) / obj_size.x)
	var obj_count_y = ceil(calc_area_size(start.y, end.y) / obj_size.y)
	return by_plane(start, end, obj_count_x, obj_count_y)

# A relative distance between start and end positions
static func calc_area_size(start, end) -> Variant:
	var area_size = end - start
	return area_size

# ##############################____WORK IN PROGRESS____############################################
#static func calculate_padding(size):
#	pass

#static func by_padding(distr_method : Callable, padding):
#	pass

# Need new type of distributions:
#	by custom padding between elements (for line and plane)
#	... and an inclined version 
#	by an inclined line
# 	by an inclined plane
