extends CharacterBody3D

var speed = 1000
var turn_speed = 3

func _physics_process(delta: float) -> void:
	var target_speed = Input.get_axis("movement_backward", "movement_forward")
	var target_turn_rate = Input.get_axis("movement_right", "movement_left")
	rotate_y(target_turn_rate * turn_speed * delta)
	velocity = -transform.basis.z * target_speed * speed * delta
	move_and_slide()

# Rotation speed is based on speed of forward movement. If standing still, it's 3.5 seconds to spin 360. If moving 70 kph it's 6 seconds
# Rotation is linearly related to percentage of max speed. Rotation goes from 100% to 50% rotation speed.
# Acceleration is m/s^2. Starts at 100% and lowers to 25% at one third speed then 0% at max speed.
# Deceleration is m/s^2. 

# FLE
# Acceleration: 93.86 [KPH/s], Deceleration: 167.5 [KPH/s], Turn rate: 115.16[deg/s], Torso turn rate: 198 [deg/s]
# Pitch ang: 30 torso, 60 arms, Pitch speed: torso 143 [deg/s], arms 473 [deg/s]
# Yaw ang: 130 torso, 0 arms, Yaw speed: torso 198 [deg/s], arms 473 [deg/s]
