extends Node
class_name DistributionResult

var values : Array = []
var is_valid : bool = true


func is_equal_type(value) -> bool:
	if not is_valid or typeof(values.front()) != typeof(value):
		return false
	return true
