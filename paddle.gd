extends CharacterBody2D

class_name Paddle

@export var speed: float = 300.0
@export var acceleration: float = 20.0

func on_ball_collision(_ball: Ball) -> void:
    # This function is called when the ball collides with the paddle
    # You can implement any specific behavior here if needed
    print("Ball collided with paddle!")
    pass