extends CharacterBody2D

@onready var spaceship_sprite: Sprite2D = $Anchor/SpaceshipSprite

const SPEED = 300.0


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("right_click"):
		var mouse = get_global_mouse_position()
		velocity.x = move_toward(mouse.x - global_position.x, 0, 10)
		velocity.y = move_toward(mouse.y - global_position.y, 0, 10)
		look_at(mouse)
	#var direction_x := Input.get_axis("ui_left", "ui_right")
	#if direction_x:
		#velocity.x = direction_x * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
	#var direction_y := Input.get_axis("ui_up", "ui_down")
	#if direction_y:
		#velocity.y = direction_y * SPEED
	#else:
		#velocity.y = move_toward(velocity.y, 0, SPEED)
	#spaceship_sprite.look_at(position + velocity)
	move_and_slide()


func _on_detection_area_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
