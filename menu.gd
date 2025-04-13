extends Control

signal restart_game


func _on_exit_button_pressed() -> void:
  get_tree().quit()

func _on_start_button_pressed() -> void:
  get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_restart_button_pressed() -> void:
  restart_game.emit()
  # Unpause the game
  get_tree().paused = false
  # Hide the pause menu
  hide()

func _on_resume_button_pressed() -> void:
  # Resume the game
  get_tree().paused = false
  # Hide the pause menu
  hide()
