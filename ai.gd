extends Paddle


const CLOSE_ENOUGH = 5.0

func get_ball_position() -> Vector2:
  var ball := $"../Ball"
  return ball.position


func _physics_process(_delta: float) -> void:
  # Determine a direction based on where the ball is relative the ai paddle
  var ball_position := get_ball_position()

  var distance = abs(ball_position.y - position.y)

  # If the ball is close enough, don't move
  if distance < CLOSE_ENOUGH:
    velocity.y = move_toward(velocity.y, 0, speed)
  else:
    var direction = 0
    if ball_position.y < position.y:
      direction = -1
    elif ball_position.y > position.y:
      direction = 1

    velocity.y = direction * speed

  move_and_slide()
