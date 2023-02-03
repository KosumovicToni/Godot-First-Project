extends KinematicBody2D

var _animated_sprite 
# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_sprite	= $AnimatedSprite


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		_animated_sprite.play('run')
		
	else:
		_animated_sprite.stop()
