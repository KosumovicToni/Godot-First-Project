extends Sprite

onready var _animated_sprite = $AnimatedSprite

onready var target = position

func _input(event):
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()
		_animated_sprite.visible = true
		position = target

func _ready():
	_animated_sprite.hide()

func _on_Area2D_body_entered(body):
	_animated_sprite.hide()


func _on_KinematicBody2D_attacking():
	_animated_sprite.hide()
