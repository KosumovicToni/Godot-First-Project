extends KinematicBody2D

onready var _animated_sprite = $AnimatedSprite
export (int) var speed = 2500

onready var target = position
var velocity = Vector2()

func _get_animation(target):
	print(position.x - target.x)
	print(position.y - target.y)
	if (position.x - target.x) < -50 and (position.y - target.y)  < 150:
		_animated_sprite.flip_h = false
		_animated_sprite.play('right')
	elif (position.x - target.x) < 100 and (position.y - target.y) < -50 :
		_animated_sprite.play('down')
	elif (position.x - target.x) > 0 and (position.y - target.y) < 150 :
		_animated_sprite.flip_h = true
		_animated_sprite.play('right')
	else: 	_animated_sprite.play('up')
func _input(event):
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()
		_get_animation(target)

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 5:
		velocity = move_and_slide(velocity * delta)
	else:
		_animated_sprite.stop()
