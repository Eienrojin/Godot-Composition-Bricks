extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var result = DistributionManager.new(0.0, 0.0, DistributorByLineStrategy.new(), DistributionEnums.DistributionType.BY_OBJECT_COUNT, 5).get_result()
