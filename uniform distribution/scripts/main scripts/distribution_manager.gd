class_name DistributionManager
extends Node

var distribution_strategy : AbstractDistributor
var distribution_type : DistributionEnums.DistributionType
var arg = 0


func _init(start_point, end_point, strategy: AbstractDistributor, distribution_type : DistributionEnums.DistributionType, additional_arg) -> void:
	strategy.start_point = start_point
	strategy.end_point = end_point
	distribution_strategy = strategy
	self.distribution_type = distribution_type
	arg = additional_arg


func get_result() -> DistributionResult:
	return distribution_strategy.distribute(arg, distribution_type)
