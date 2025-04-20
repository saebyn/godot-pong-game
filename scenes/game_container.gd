extends Node2D

@onready var scoreboard = $Scoreboard
@onready var ball = $Ball

func _on_restart() -> void:
  # Reset the game state
  scoreboard.reset_scores()
  ball.reset_ball()
  
  # Unpause the game
  get_tree().paused = false