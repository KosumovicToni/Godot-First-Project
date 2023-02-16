extends Label


var cont = 0
onready var points = $'.'
# Called when the node enters the scene tree for the first time.
#func _ready():

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	points.text = String(cont)

func _on_Game_child_exiting_tree(node):
	cont += 100
