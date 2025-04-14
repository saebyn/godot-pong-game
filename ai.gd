extends Paddle


const CLOSE_ENOUGH = 5.0

var target: Vector2

func _ready() -> void:
  target = Vector2(0, get_viewport().size.y / 2)


func on_bounce(ball_position: Vector2, ball_velocity: Vector2) -> void:
  # This function is called when the ball bounces off the paddle
  # if the velocity x component is moving to the right,
  # then move the paddle towards where the ball will be when
  # it's x position is matches the paddle's x position
  if ball_velocity.x > 0:
    print("Ball is moving to the right")
    target.x = position.x
    target.y = ball_position.y + ball_velocity.y * (position.x - ball_position.x) / ball_velocity.x
  else:
    print("Ball is moving to the left")
    target = position


func _physics_process(_delta: float) -> void:
  var distance = abs(target.y - position.y)

  # If the ball is close enough, don't move
  if distance < CLOSE_ENOUGH:
    velocity.y = move_toward(velocity.y, 0, speed)
  else:
    var direction = 0
    if target.y < position.y:
      direction = -1
    elif target.y > position.y:
      direction = 1

    velocity.y = direction * speed

  move_and_slide()
