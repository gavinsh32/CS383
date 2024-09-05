extends Area2D

signal enemy_hit 

@export var domain = 300	# total horizontal area to move around in
@export var speed = 1		# horizontal speed

var moving_left			# horizontal direction
var left_boundry	# Both of these represent the horizontal boundires as
var right_boundry	# Vector2D which the enemy can move within

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# starting direction
	moving_left = false
	
	# defines left and right boundries
	left_boundry = Vector2(position.x-(domain/2),position.y)
	right_boundry = Vector2(position.x+(domain/2),position.y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# if passes our boundry, flip
	if position.x < left_boundry.x: 	moving_left = false
	elif position.x > right_boundry.x: 	moving_left = true
	
	# flip sprite horizontally
	$AnimatedSprite2D.flip_h = moving_left
	
	# go to left if left, and right if right
	position.x -= speed if moving_left else speed * -1	# shorthand ternary
	
	# clamp position to boundries
	position.clamp(left_boundry, right_boundry)

func _on_area_entered(area: Area2D) -> void:
	hide()
	enemy_hit.emit()	# disable collider safely as not to detect the same collision
	$CollisionShape2D.set_deferred("disabled", true)
