extends Sprite

onready var timer = $Timer
onready var death = $Death
var _entred = false
var _attacking = false

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _entred and _attacking :
		$AnimatedSprite.play("death")
		death.start(0.5)

func _on_Area2D_body_entered(body):
	_entred = true

func _on_Area2D_body_exited(body):
	_entred = false

func _input(event):
	if event.is_action_pressed("attack"):
		_attacking = true
		if timer.is_stopped():
			timer.start()
			
func _on_Timer_timeout():
	_attacking = false

func _on_Death_timeout():
	queue_free() # Replace with function body.
