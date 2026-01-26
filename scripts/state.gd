extends Node2D

@export var state_name := "qo"

var dragging := false
var drag_offset := Vector2.ZERO

func is_mouse_over() -> bool:
	var mouse = to_local(get_global_mouse_position())
	
	return mouse.x > -40 and mouse.x < 40 and mouse.y > -40 and mouse.y < 40

func _input(event):
	print("hello")
	#mouse button pressed on state
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		print("i am clicked")
		
			#check if click is on this state
		if is_mouse_over():
				dragging = true
				drag_offset = global_position - get_global_mouse_position()
				
				
		else:
				dragging = false
				
				
		if event is InputEventMouseMotion and dragging:
			global_position = get_global_mouse_position() + drag_offset
			
	#get_viewport().set_input_as_handeled()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = state_name
	get_tree().get_first_node_in_group("camera").block_pan = false
	print(get_tree_string())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
