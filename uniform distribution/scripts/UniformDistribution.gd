extends Node2D

@onready var objects_manager = $ObjectsManager
@onready var start_marker = $StartMarker
@onready var end_marker = $EndMarker
@export var count_obj_x = 0
@export var count_obj_y = 0
var obj_size : Vector2
const TEST_OBJECT = preload("res://uniform distribution/scenes/test_object.tscn")

func _ready() -> void:
	start_marker.on_pickup.connect(Callable(self, "_start_marker_pick_status_changed"))
	end_marker.on_pickup.connect(Callable(self, "_end_marker_pick_status_changed"))
	var obj = TEST_OBJECT.instantiate()
	obj_size = obj.texture.get_size() * obj.scale


func refresh():
	var children = objects_manager.get_children()
	for c in children:
		objects_manager.remove_child(c)
	var coordinates = Distribution.by_vector2(start_marker.global_position, end_marker.global_position, 32, 32)
	for i in coordinates.values.size():
		var new_object = TEST_OBJECT.instantiate()
		new_object.global_position = coordinates.values[i] 
		objects_manager.add_child(new_object)


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
