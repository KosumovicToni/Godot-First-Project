extends KinematicBody2D

onready var _animated_sprite = $AnimatedSprite
export (int) var speed = 5500
onready var target = position
var velocity = Vector2()
onready var timer = $Timer	#the attack timer
var _attack_done = true 	#a boolean variable to know if i am attacking
var _direction = 1 # 1 = down, -1 = up ,  2 = left , -2 = right 
signal attacking


func _get_animation(target):	#Based on the distance of the x and y Vecotors the player 'Takes' a position (up,down,right,left)
	if (position.x - target.x) < -50 and (position.y - target.y)  < 350:
		_animated_sprite.flip_h = false
		_animated_sprite.play('right')
		_direction = 2
	elif (position.x - target.x) < 100 and (position.y - target.y) < -50 :
		_animated_sprite.play('down')
		_direction = 1 
	elif (position.x - target.x) > 0 and (position.y - target.y) < 350 :
		_animated_sprite.flip_h = true
		_animated_sprite.play('right')
		_direction = -2
	else: 
		_animated_sprite.play('up')
		_direction = -1
#	print(position.x - target.x)
#	print(position.y - target.y)

	
func _input(event):
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()
		_get_animation(target)
	elif event.is_action_pressed("attack"):
		emit_signal('attacking')
		target = position
		if  _direction == 1:
			_animated_sprite.play('attack_down')
		elif _direction ==  -1: 
			_animated_sprite.play('attack_up')
		elif _direction == 2:	
			_animated_sprite.flip_h = false 
			_animated_sprite.play('attack_right')
		elif _direction == -2: 
			_animated_sprite.flip_h = true
			_animated_sprite.play('attack_right')
		_attack_done = false # i am attacking so the state is false
		timer.start()

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 5:
		velocity = move_and_slide(velocity * delta)
	elif _attack_done:
		if _direction ==  -1 :
			  _animated_sprite.play('idle_up') 
		else :_animated_sprite.play('idle_down')


func _on_Timer_timeout(): #set the state attack done 
	_attack_done = true
