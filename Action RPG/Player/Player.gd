extends KinematicBody2D # "inherits from"

var velocity = Vector2.ZERO
const MAX_SPEED = 180
const ACCELERATION = 120
const FRICTION = 400

func _ready():
	print("Hello world!") # Replace with function body.

func _physics_process(delta): # This function gets called every single "tick" 
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector.normalized() * MAX_SPEED, ACCELERATION * delta)
		# velocity = velocity.limit_length(MAX_SPEED)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION*delta)
	print(velocity)
	
	velocity = move_and_slide(velocity)






