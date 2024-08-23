class_name DistributorByLineStrategy
extends AbstractDistributor


func _by_object_count(count: int) -> DistributionResult:
	return _private_by_float(count)


func _by_paddings(padding: float) -> DistributionResult:
	var obj_count = ceil(_private_calc_area_size(start_point, end_point) / padding)
	return _private_by_float(obj_count)


func _by_fill_to_max(object_size: float) -> DistributionResult:
	var obj_count = ceil(_private_calc_area_size(start_point, end_point) / object_size)
	return _private_by_float(obj_count)
