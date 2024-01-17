extends Area2D

var dir = 0
var is_shot_by_player = false

func _ready():
	pass # Replace with function body.

func _process(delta):
	self.position.y += dir * 300 * delta
	
func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()
