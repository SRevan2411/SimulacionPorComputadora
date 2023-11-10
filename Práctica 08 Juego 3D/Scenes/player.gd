extends CharacterBody3D

signal hit
signal UnPower
signal Picked



@export var bounce_impulse = 16
@export var jump_impulse = 20
@export var speed = 14
@export var fall_acceleration = 75

@onready var JumpPlayer =  $AudioStreamPlayer

@onready var JumpPlayerHit =  $AudioStreamPlayer2



var target_velocity = Vector3.ZERO

func _physics_process(delta):
	
	# Iterate through all collisions that occurred this frame
	for index in range(get_slide_collision_count()):
		var collision = get_slide_collision(index)
		if (collision.get_collider() == null):
			continue
		if collision.get_collider().is_in_group("mob"):
			var mob = collision.get_collider()
			if Vector3.UP.dot(collision.get_normal()) > 0.1:
				JumpPlayerHit.play()
				mob.squash()
				target_velocity.y = bounce_impulse
	#Jump
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		JumpPlayer.play()
		target_velocity.y = jump_impulse
	
	# We create a local variable to store the input direction.
	var direction = Vector3.ZERO

# We check for each move input and update the direction accordingly.
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		# Notice how we are working with the vector's x and z axes.
		# In 3D, the XZ plane is the ground plane.
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
	
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(position + direction, Vector3.UP)
		
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	# Moving the Character
	velocity = target_velocity
	
	$Pivot/Character/AnimationTree.set("parameters/conditions/idle", direction == Vector3.ZERO)
	$Pivot/Character/AnimationTree.set("parameters/conditions/walk", direction != Vector3.ZERO)
	move_and_slide()




	

func _on_mob_detector_body_entered(body):
	if body.is_in_group("Coin"):
		print("Detecta")
		GameManager.addScore()
		print(GameManager.Score)
		
		
	
	elif GameManager.Invisible != true:
		die()
	else:
		print("Escudoo")
		GameManager.Romper()
		UnPower.emit()
		return

func die():
	hit.emit()
	queue_free()
	GameManager.endTime()
	get_tree().change_scene_to_file("res://Scenes/Lose.tscn")



func _on_time_label_power():
	print("Entra")
	print(GameManager.Invisible)
	if GameManager.Invisible == false:
		GameManager.Escudo()
		print(GameManager.Invisible)
	
