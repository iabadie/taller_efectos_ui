extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var label: Label = $Label
var counter: int = 0

func _ready() -> void:
	update_label()

func update_label():
	label.text = str(counter)
	
func play_animation():
	animation_player.play("add")
	
func _group_add_count():
	counter += 1
	play_animation()
	
