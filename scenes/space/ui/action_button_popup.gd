extends Node2D

signal pressed

const BUTTON_SQUARE_FLAT = preload("res://assets/ui/button_square_flat.png")
const ICON_SQUARE = preload("res://assets/ui/icon_square.png")
@export var appear_marker: Marker2D
var final_position: Vector2
@onready var texture_rect: TextureRect = $TextureRect

var is_pressed = false

func _ready() -> void:
	visible = false

func _input(event: InputEvent) -> void:
	if visible:
		if Input.is_action_just_pressed("e"):
			pressed.emit()
			get_tree().call_group("ui", "_group_add_count")

func appear():
	global_position.y = appear_marker.global_position.y
	global_position.x = appear_marker.global_position.x
	visible = true

func disappear():
	visible = false
