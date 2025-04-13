extends Node2D

@onready var pause_menu = $PauseMenu

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_cancel"):
        # Check if the game is paused
        if is_game_paused():
            # If the game is paused, resume it
            resume_game()
        else:
            # If the game is not paused, pause it
            pause_game()


func is_game_paused() -> bool:
    # Check if the game is paused
    return get_tree().paused


func pause_game() -> void:
    # Pause the game
    get_tree().paused = true
    # Show the pause menu
    pause_menu.show()


func resume_game() -> void:
    # Resume the game
    get_tree().paused = false
    # Hide the pause menu
    pause_menu.hide()