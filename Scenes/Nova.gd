extends KinematicBody2D

var health = 10
onready var label = $Label

var dir = 0

func _ready():
	pass # Replace with function body.

func _process(delta):
	label.text = str(health)
	if health <= 0:
		self.queue_free()
	
	self.position.y += 50 * dir * delta

func _on_Area2D_area_entered(area):
	if area.is_in_group("bullets"):
		health -= 1
		area.queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()
