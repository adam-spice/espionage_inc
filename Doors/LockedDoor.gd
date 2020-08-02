extends "res://Doors/Door.gd"

func _ready():
	generate_combination()


func _on_Door_input_event(_viewport, _event, _shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		$CanvasLayer/NumPad.popup_centered()
		
func _on_Door_body_exited(body):
	if body.collision_layer == 1:
		can_click = false
		$CanvasLayer/NumPad.hide()


func _on_NumPad_combination_correct():
	open()
	$CanvasLayer/NumPad.hide()
	
func generate_combination():
	var length = 8
	var combination = CombinationGenerator.generate_combination(length)
	$CanvasLayer/NumPad.combination = combination
	print(str(combination))
	
	
	
	
	
