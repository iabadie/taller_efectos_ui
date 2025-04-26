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
			texture_rect.texture = BUTTON_SQUARE_FLAT
			texture_rect.set_instance_shader_parameter("enabled", false)
		elif Input.is_action_just_released("e"):
			texture_rect.texture = ICON_SQUARE
			texture_rect.set_instance_shader_parameter("enabled", true)

func appear():
	final_position = appear_marker.global_position
	global_position.x = final_position.x
	global_position.y = final_position.y + 50
	var tween = create_tween().set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_ELASTIC)
	tween.tween_property(self, "global_position:y", final_position.y, 2)
	tween.play()
	visible = true

func disappear():
	var tween = create_tween().set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(self, "global_position:y", final_position.y + 25, 0.2)
	tween.play()
	await tween.finished
	visible = false
