extends Control

onready var health_bar = $HealthBar
onready var temp_bar = $TempBar

func _ready():
	pass


func _process(delta):
	health_bar.value = Globals.health
	temp_bar.value = Globals.blaster_heat
	

func _on_ABtn_pressed():
	Input.vibrate_handheld(Globals.vibration_strength)

func _on_BBtn_pressed():
	Input.vibrate_handheld(Globals.vibration_strength)
	
func _on_DPadR_pressed():
	Input.vibrate_handheld(Globals.vibration_strength)

func _on_DPadL_pressed():
	Input.vibrate_handheld(Globals.vibration_strength)

func _on_DPadU_pressed():
	Input.vibrate_handheld(Globals.vibration_strength)

func _on_DPadD_pressed():
	Input.vibrate_handheld(Globals.vibration_strength)
