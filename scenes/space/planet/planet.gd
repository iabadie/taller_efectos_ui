extends Node2D

@export var texture: Texture

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var planet_sprite: Sprite2D = $PlanetSprite
@onready var background_feedback: Sprite2D = $BackgroundFeedback
@onready var action_button_popup: Node2D = $ActionButtonPopup
@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D

var real_position: Vector2

var count = 0

func _ready() -> void:
	if texture:
		planet_sprite.texture = texture
		background_feedback.texture = texture
	start_rotation()
	action_button_popup.pressed.connect(add_to_counter)
	real_position = position

func start_rotation():
	planet_sprite.rotation_degrees = 0
	var tween = create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(planet_sprite, "rotation_degrees", 360, 6)
	tween.play()
	await tween.finished
	start_rotation()

func play_animation():
	animation_player.play("beat")

func stop_animation():
	animation_player.stop()
	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	play_animation()
	action_button_popup.appear()


func _on_area_2d_body_exited(body: Node2D) -> void:
	stop_animation()
	action_button_popup.disappear()

func add_to_counter():
	count += 1
	if count == 4:
		explode()

func explode():
	$Area2D/CollisionShape2D.disabled = true
	action_button_popup.queue_free()
	modulate = Color.GRAY
	$Timer.start()
	cpu_particles_2d.emitting = true
	count = 0


func random_pos():
	position = real_position + Vector2(randi() % 10 - 5, randi() % 10 - 5)


func _on_timer_timeout() -> void:
	random_pos()
	count += 1
	if count == 50:
		$Timer.stop()
		queue_free()
