class_name DistributorByInclinedLineStrategy
extends AbstractDistributor


func _by_object_count(count) -> DistributionResult:
	var x_result_line = _private_by_float(count)
	var full_result = DistributionResult.new()
	
	if x_result_line.is_valid == false:
		full_result.is_valid = false
		return full_result
	if count <= 0:
		full_result.is_valid = false
		return full_result
	
	for x in count:
		full_result.values.append(Vector2(x_result_line.values[x].x, x_result_line.values[x].y))
	
	return full_result


func _by_paddings(padding) -> DistributionResult:
	_no_implementation()
	return null


func _by_fill_to_max(object_size) -> DistributionResult:
	_no_implementation()
	return null
