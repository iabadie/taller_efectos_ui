extends Control

signal pressed

@onready var label: Label = $TextureButton/Label

@export var title: String = "Start"

var tween: Tween = null

func _ready() -> void:
	label.text = title


func _on_texture_button_mouse_entered() -> void:
	if tween != null and tween.is_running():
		tween.stop()
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.3)
	tween.play()


func _on_texture_button_mouse_exited() -> void:
	if tween != null and tween.is_running():
		tween.stop()
	var tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(self, "scale", Vector2.ONE, 0.3)
	tween.play()


func _on_texture_button_pressed() -> void:
	pressed.emit()
