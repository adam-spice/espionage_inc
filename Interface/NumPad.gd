extends Popup

var combination = [0, 4, 5, 1]
var guess = []

onready var display = $VBoxContainer/DisplayContainer/Display
onready var light = $VBoxContainer/ButtonContainer/GridContainer/StatusLight

signal combination_correct

func _ready():
	connect_buttons()
	reset_lock()
	
func connect_buttons():
	for child in $VBoxContainer/ButtonContainer/GridContainer.get_children():
		if child is Button:
			child.connect("pressed", self, "Button_pressed", [child.text])
			
func Button_pressed(button):
	if button == "OK":
		check_guess()
	else:
		enter(int(button))
	
func check_guess():
	if guess == combination:
		emit_signal("combination_correct")
	else:
		reset_lock()
	
func enter(button):
	print(button)
	guess.append(button)
	update_display()
	
func update_display():
	display.text = PoolStringArray(guess).join("")
	
	
func reset_lock():
	display.text=""
	guess.clear()

