extends Control

signal restart_game

@onready var keybindings_scene: PackedScene = preload("res://ui/keybindings/keybindings.tscn")


func _on_return_main_menu_button_pressed() -> void:
  # Unpause the game
  get_tree().paused = false
  get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

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


func _on_keybindings_button_pressed() -> void:
  var keybindings = keybindings_scene.instantiate()
  get_tree().get_root().add_child(keybindings)


func _on_credits_button_pressed() -> void:
  get_tree().change_scene_to_file("res://scenes/credits.tscn")
