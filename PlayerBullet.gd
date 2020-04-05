extends "res://BaseBullet.gd"

signal enemy_hit(damage)
const EnemyGeneric = preload("res://EnemyGeneric.gd")

func _ready():
	connect("enemy_hit", $"../EnemyHitHandler", "_on_PlayerBullet_enemy_hit")
	
func _on_self_body_entered(body):
	print("hitto")
	if (body is EnemyGeneric):
		emit_signal("enemy_hit", 1)
		hide()
		$CollisionShape2D.set_deferred("disabled", true)
		queue_free()
