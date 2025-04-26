extends Control

@export var scene: PackedScene


func _on_start_control_pressed() -> void:
	get_tree().change_scene_to_packed(scene)

func _on_socials_control_pressed() -> void:
	OS.shell_open("https://www.instagram.com/racoonlabs/")

func _on_exit_control_pressed() -> void:
	get_tree().quit()
