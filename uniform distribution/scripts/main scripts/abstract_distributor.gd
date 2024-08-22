class_name AbstractDistributor
extends Object

static var start_point
static var end_point


static func _by_object_count(count: int) -> DistributionResult:
	_no_implementation()
	return null


static func _by_paddings(padding: float) -> DistributionResult:
	_no_implementation()
	return null


static func _by_fill_to_max(object_size) -> DistributionResult:
	_no_implementation()
	return null


# Distribution by a straight line. It's designed to hold a user defined amount of objects
# The most basic distribution that used in other kinds of algorhythms
static func _private_by_float(obj_count: int) -> DistributionResult:
	var result = DistributionResult.new()
	var relative_line_length = _private_calc_area_size(start_point, end_point)
	var pos_bias = relative_line_length / (obj_count - 1)
	var current_value = start_point
	if obj_count <= 0:
		result.is_valid = false
	if result.is_valid:
		for i in obj_count:
			result.values.append(current_value)
			current_value += pos_bias
		return result
	return result


# A relative distance between start and end positions
static func _private_calc_area_size(start, end) -> Variant:
	return end - start


static func _no_implementation():
	print_debug("NOT IMPLEMENTED")
