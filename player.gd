extends Paddle


func _physics_process(_delta: float) -> void:
  # Get the input direction and handle the movement/deceleration.
  # As good practice, you should replace UI actions with custom gameplay actions.
  var direction := Input.get_axis("move_up", "move_down")
  if direction:
    velocity.y = direction * speed
  else:
    velocity.y = move_toward(velocity.y, 0, speed)

  move_and_slide()
