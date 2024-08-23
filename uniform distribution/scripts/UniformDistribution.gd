extends Node2D

@onready var objects_manager = $ObjectsManager
@onready var start_marker = $StartMarker
@onready var end_marker = $EndMarker
@export var count_obj_x = pow(2, 10)
@export var count_obj_y = 0
const TEST_OBJECT = preload("res://uniform distribution/scenes/test_object.tscn")
var obj_size : Vector2
var object_array = []
var objects_manager_children

func _ready() -> void:
	start_marker.on_pickup.connect(Callable(self, "_start_marker_pick_status_changed"))
	end_marker.on_pickup.connect(Callable(self, "_end_marker_pick_status_changed"))
	var obj = TEST_OBJECT.instantiate()
	obj_size = obj.texture.get_size() * obj.scale
	
	for i in count_obj_x:
		object_array.append(TEST_OBJECT.instantiate())
		objects_manager.add_child(object_array[i])
	
	objects_manager_children = objects_manager.get_children()
	refresh()


func refresh():
	#var distribution_result = DistributionManager.new(start, end).ByMethod(LineStrategy.ByPaddings)
	var coordinates = DistributionManager.new(start_marker.global_position, end_marker.global_position, DistributorByInclinedLineStrategy.new(), DistributionEnums.DistributionType.BY_OBJECT_COUNT, count_obj_x).get_result()
	
	for i in coordinates.values.size():
		objects_manager_children[i].global_position = Vector2(coordinates.values[i].x, coordinates.values[i].y) 


func _on_x_count_slider_value_changed(value):
	#count_obj_x = value
	refresh()


func _on_y_count_slider_value_changed(value):
	#count_obj_y = value
	refresh()


func _start_marker_pick_status_changed(is_picked):
	if is_picked:
		refresh()


func _end_marker_pick_status_changed(is_picked):
	if is_picked:
		refresh()
