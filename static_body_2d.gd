extends StaticBody2D

var speed = 100  # скорость перемещения платформы
var target_position = Vector2.ZERO  # координаты целевой позиции для перемещения

func _ready():
	# задаем начальную целевую позицию случайным образом
	target_position = Vector2(randf_range(464, 0), randf_range(464, -900))

func _physics_process(delta):
	# вычисляем расстояние до целевой позиции
	var distance = target_position.distance_to(position)

	if distance < 10:
		# если платформа достигла целевой позиции, выбираем новую целевую позицию
		target_position = Vector2(randf_range(0, 0), randf_range(0, 0))
	else:
		# вычисляем направление движения к целевой позиции
		var direction = (target_position - position).normalized()
		# перемещаем платформу в этом направлении со скоростью, заданной в переменной speed
		move_and_collide(direction * speed * delta)
