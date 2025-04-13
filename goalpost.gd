extends Area2D


signal player_scored
signal ai_scored

@export var ball: Ball
@export var is_player: bool = false

func _on_Area2D_body_entered(body: Node) -> void:
  if body.is_in_group("ball"):
    if is_player:
      ai_scored.emit()
    else:
      player_scored.emit()

    ball.score()
