extends Node2D

@export var texture: Texture

@onready var planet_sprite: Sprite2D = $PlanetSprite
@onready var action_button_popup: Node2D = $ActionButtonPopup

var real_position: Vector2

var count = 0

func _ready() -> void:
	if texture:
		planet_sprite.texture = texture
	action_button_popup.pressed.connect(add_to_counter)
	real_position = position

func play_animation():
	pass

func stop_animation():
	pass
	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	action_button_popup.appear()


func _on_area_2d_body_exited(body: Node2D) -> void:
	action_button_popup.disappear()

func add_to_counter():
	count += 1
	if count == 4:
		queue_free()
