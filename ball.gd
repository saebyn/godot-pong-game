extends CharacterBody2D

class_name Ball

const SPEED = 300.0
const ACCELERATION = 20.0

func _ready() -> void:
  reset()

func random_direction():
  # Generate a random angle in radians
  var random_angle: float = 0

  if randi() % 2 == 0:
    random_angle = randf_range(-PI / 4, PI / 4)
  else:
    random_angle = randf_range(3 * PI / 4, 5 * PI / 4)

  var direction = Vector2(cos(random_angle), sin(random_angle))
  return direction

func _physics_process(delta: float) -> void:
  var collision := move_and_collide(velocity * delta)
  
  if collision:
    # Reflect the ball's velocity when it collides with a wall
    velocity = velocity.bounce(collision.get_normal())
    var target := collision.get_collider()

    if target.has_method("on_ball_collision"):
      target.on_ball_collision(self)

    # Increase the speed of the ball after a collision
    # Get the current speed of the ball
    var speed = velocity.length()
    # Increase the speed by ACCELERATION
    speed += ACCELERATION
    # Normalize the velocity vector (to get direction) and multiply by the new speed
    velocity = velocity.normalized() * speed


func reset():
  # Set the initial position of the ball
  position = Vector2(get_viewport().size.x / 2, get_viewport().size.y / 2)
  # Set a random direction for the ball
  velocity = random_direction() * SPEED
