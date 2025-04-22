extends Control


@onready var start_screen: Control = $StartScreen
@onready var pause_screen: Control = $PauseScreen
@onready var background: ColorRect = $Background

signal restart_game
signal start_game
signal return_main_menu
signal exit_game

@onready var keybindings_scene: PackedScene = preload("keybindings/keybindings.tscn")
@onready var mixer_scene: PackedScene = preload("mixer/mixer.tscn")
@onready var credits_scene: PackedScene = preload("credits.tscn")

func _ready() -> void:
  # Make control node occupy the whole screen
  size = get_viewport().size
  position = Vector2.ZERO
  get_tree().paused = true


func pause() -> void:
  # Pause the game
  get_tree().paused = true
  # Show the pause menu
  pause_screen.show()
  # Hide the start screen
  start_screen.hide()
  # Hide the background
  background.hide()

  show()

func unpause() -> void:
  # Unpause the game
  get_tree().paused = false
  
  pause_screen.hide()
  
  hide()

func _on_return_main_menu_button_pressed() -> void:
  # Pause the game
  get_tree().paused = true
  # Show the start screen
  background.show()
  start_screen.show()
  # Hide the pause menu
  pause_screen.hide()
  return_main_menu.emit()


func _on_exit_button_pressed() -> void:
  # Pause the game
  get_tree().paused = true
  # Show the start screen
  start_screen.show()
  # Hide the pause menu
  pause_screen.hide()
  exit_game.emit()

func _on_start_button_pressed() -> void:
  # Unpause the game
  get_tree().paused = false

  # Hide the game menu
  hide()

  start_game.emit()

func _on_restart_button_pressed() -> void:
  restart_game.emit()
  # Hide the pause menu
  pause_screen.hide()
  # Hide the start screen
  hide()


func _on_keybindings_button_pressed() -> void:
  var keybindings = keybindings_scene.instantiate()
  get_tree().get_root().add_child(keybindings)

func _on_credits_button_pressed() -> void:
  get_tree().change_scene_to_packed(credits_scene)

func _on_mixer_button_pressed() -> void:
  var mixer = mixer_scene.instantiate()
  get_tree().get_root().add_child(mixer)
