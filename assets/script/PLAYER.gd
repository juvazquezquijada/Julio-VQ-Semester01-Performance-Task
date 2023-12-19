extends Area2D

@export var speed = 5
# Called when the node enters the scene tree for the first time.
@onready var sprite = $Sprite2D
# Called every frame. 'delta' is the elapsed time since the previous frame.
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
