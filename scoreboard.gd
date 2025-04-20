extends Node2D

# This script will handle scoring events and updating the scoreboard.
# It will be attached to a Node2D that contains the score labels.
# The script will update the score labels when the ball enters the goal post.
# The script will also handle the reset of the game state when a goal is scored.

@onready var score_sound = $ScoreSound

var player_score: int = 0
var ai_score: int = 0
var player_score_label: Label
var ai_score_label: Label


func on_ai_scored():
  ai_score += 1
  $AIScoreLabel.text = str(ai_score)
  score_sound.play()

func on_player_scored():
  player_score += 1
  $PlayerScoreLabel.text = str(player_score)
  score_sound.play()

func reset_scores():
  player_score = 0
  ai_score = 0
  $PlayerScoreLabel.text = str(player_score)
  $AIScoreLabel.text = str(ai_score)