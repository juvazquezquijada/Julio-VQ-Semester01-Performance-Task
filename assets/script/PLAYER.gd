extends Area2D

@export var speed = 5
# Called when the node enters the scene tree for the first time.
@onready var sprite = $Sprite2D
@onready var bg_music = $"../BackgroundMusic"
@onready var enemy_hit = $"../EnemyHitSound"
@onready var game_over = $"../You died text"
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _onready():
	game_over.hide()


func _process(velocity):
	velocity = Vector2.ZERO
	
	if velocity.length() > 0:
		velocity * speed
	
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		sprite.scale.x = 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		sprite.scale.x = -1
	position += velocity * speed


func _on_body_entered(body):
	hide()
	bg_music.stop()
	enemy_hit.play()
	game_over.show()


func _on_button_pressed():
	get_tree().reload_current_scene()
