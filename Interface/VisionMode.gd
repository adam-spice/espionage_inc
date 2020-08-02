extends CanvasModulate

const DARK = Color("1b1a1a")
const NIGTHVISION = Color("37bf62")

var cooldown = false

func _ready():
	visible = true
	color = DARK

func cycle_vision_mode():
	if not cooldown:
		if color == NIGTHVISION:
			DARK_mode()
		else:
			NIGTHVISION_mode()
			cooldown = true
			$Timer.start()
				
func DARK_mode():
	color = DARK
	$AudioStreamPlayer2D.stream = load("res://SFX/nightvision_off.wav")
	$AudioStreamPlayer2D.play()
	get_tree().call_group("lights", "show")
	get_tree().call_group("labels", "hide")

func NIGTHVISION_mode():
	color = NIGTHVISION
	$AudioStreamPlayer2D.stream = load("res://SFX/nightvision.wav")
	$AudioStreamPlayer2D.play()
	get_tree().call_group("lights", "hide")
	get_tree().call_group("labels", "show")


func _on_Timer_timeout():
	cooldown = false
