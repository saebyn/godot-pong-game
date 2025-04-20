extends CharacterBody2D

class_name Paddle

@export var speed: float = 300.0

func on_ball_collision(ball: Ball) -> void:
    # Influence the ball's velocity based on the paddle's speed
    # in the direction of the paddle's movement
    var paddle_velocity_influence := Vector2(0, velocity.y)
    var current_speed := ball.velocity.length()
    ball.velocity += paddle_velocity_influence
    ball.velocity = ball.velocity.normalized() * current_speed
