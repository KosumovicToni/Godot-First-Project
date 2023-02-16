extends Node2D


var random = RandomNumberGenerator.new()
onready var timer = $Timer	
var enemyScene = preload("Slime.tscn")

func _input(event):
	if event.is_action_pressed('close'):
		get_tree().quit()

func _process(delta):
	if timer.is_stopped():
		timer.start()
		
func _on_Timer_timeout():
	var enemy = enemyScene.instance()
	random.randomize()
	var x = random.randf_range(0,960)
	var y = random.randf_range(0,600)
	enemy.position = Vector2(x,y)
	get_tree().current_scene.add_child(enemy)
