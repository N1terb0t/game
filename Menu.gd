extends Control




func _on_button_pressed():
	get_tree().change_scene_to_file("res://Maps/main.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Menu/settings.tscn")


func _on__pressed():
	get_tree().change_scene_to_file("res://Prototipe/Choose level.tscn")
