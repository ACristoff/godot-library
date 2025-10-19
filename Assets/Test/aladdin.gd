extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta):
	position = position.round()
	velocity = Input.get_vector("a","d","w","s") * SPEED
	move_and_slide()
