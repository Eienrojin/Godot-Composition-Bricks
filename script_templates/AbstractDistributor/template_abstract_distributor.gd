# meta-name: Abstract Distributor Template
# meta-description: Predefined class with virtual (kinda) methods
# meta-default: true
# meta-space-indent: 4
class_name REWRITE_THIS
extends AbstractDistributor


func _by_object_count(count) -> DistributionResult:
	_no_implementation()
	return null


func _by_paddings(padding) -> DistributionResult:
	_no_implementation()
	return null


func _by_fill_to_max(object_size) -> DistributionResult:
	_no_implementation()
	return null
