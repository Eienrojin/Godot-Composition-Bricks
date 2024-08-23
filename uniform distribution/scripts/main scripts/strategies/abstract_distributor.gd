#TODO
#1. Rewrite _private_calc_area_size method

class_name AbstractDistributor
extends Object
## An Abstract Distributor Strategy with abstract methods

var start_point
var end_point

## Returns a not valid result with null values array
func not_valid_object() -> DistributionResult:
	var not_valid_object = DistributionResult.new()
	not_valid_object.is_valid = false
	not_valid_object.values = null
	return not_valid_object


func distribute(arg, type: DistributionEnums.DistributionType) -> DistributionResult:
	if arg == null:
		return not_valid_object()
	var result : DistributionResult
	
	match type:
		DistributionEnums.DistributionType.BY_FILL_TO_MAX:
			return _by_fill_to_max(arg) 
		DistributionEnums.DistributionType.BY_OBJECT_COUNT:
			return _by_object_count(arg)
		DistributionEnums.DistributionType.BY_PADDINGS:
			return _by_paddings(arg)
	return not_valid_object()


func _by_object_count(count) -> DistributionResult:
	_no_implementation()
	return null


func _by_paddings(padding) -> DistributionResult:
	_no_implementation()
	return null


func _by_fill_to_max(object_size) -> DistributionResult:
	_no_implementation()
	return null


## Distribution by a straight line. It's designed to hold a user defined amount of objects
## The most basic distribution that used in other kinds of algorhythms
func _private_by_float(obj_count) -> DistributionResult:
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


static func _no_implementation():
	print_debug("NOT IMPLEMENTED")


# A relative distance between start and end positions
static func _private_calc_area_size(start, end) -> Variant:
	var bigger
	var smaller
	
	if typeof(start) == typeof(Vector2.ZERO) or typeof(start) == typeof(Vector3.ZERO):
		bigger = start.max(end)
		smaller = start.min(end)
		
		if start == bigger or end == smaller:
			var temp = start
			start = end
			end = temp
			bigger = start
			smaller = end
	else:
		bigger = max(start, end)
		smaller = min(start, end)
	return bigger - smaller



static func _private_get_biggest_objects_count():
	pass
