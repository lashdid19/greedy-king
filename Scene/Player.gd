extends KinematicBody2D

var velocity = Vector2(0,0)
var SPEED = 300
var JUMPFORCE = -800
const GRAVITY = 40
var coins = 0
var hunger = 0
var idle_anim = "idle"
var run_anim = "run"
var jump_anim = "jump"
export (int, 0, 200) var push = 50
export var restartTo = "res://Scene/Level 1.tscn"

signal coin_collected;
signal finish;

func _physics_process(delta):
	if Input.is_action_just_pressed("restart") :
		coins == 0
		get_tree().change_scene(restartTo)
	
	if Input.is_action_pressed("right") :
		velocity.x = SPEED
		$AnimatedSprite.play(run_anim)
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$AnimatedSprite.play(run_anim)
		$AnimatedSprite.flip_h = true
	else :
		$AnimatedSprite.play(idle_anim)
		
	velocity = move_and_slide(velocity, Vector2.UP, false, 4, PI/4, false)
	
	if Input.is_action_just_pressed("jump") and is_on_floor() :
		velocity.y += JUMPFORCE
	
	if not is_on_floor() :
		$AnimatedSprite.play(jump_anim)
	
	velocity.y += GRAVITY
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("box"):
			collision.collider.apply_central_impulse(-collision.normal * push)
	
	velocity.x = lerp(velocity.x, 0, 0.2)
	if coins == 3 :
		emit_signal("coin_collected")
	
func addCoin() :
	coins += 1

func resetCoin() :
	coins = 0

func _on_Hunger_half():
	idle_anim = "fat_idle"
	run_anim = "fat_run"
	jump_anim = "fat_jump"
	JUMPFORCE = -1000
	SPEED = 200
	
