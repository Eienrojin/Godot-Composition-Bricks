class_name DistributionManager
extends Node

var distribution_strategy : AbstractDistributor
var distribution_type : DistributionEnums.DistributionType
var arg = 0

func _init(start_point, end_point, strategy: AbstractDistributor, distribution_type, additional_arg = null) -> void:
	strategy.start_point = start_point
	strategy.end_point = end_point
	distribution_strategy = strategy
	self.distribution_type = distribution_type
	arg = additional_arg


func get_result():
	match distribution_type:
		DistributionEnums.DistributionType.BY_FILL_TO_MAX:
			return distribution_strategy._by_fill_to_max(arg) 
		DistributionEnums.DistributionType.BY_OBJECT_COUNT:
			return distribution_strategy._by_object_count(arg)
		DistributionEnums.DistributionType.BY_PADDINGS:
			return distribution_strategy._by_paddings(arg)
