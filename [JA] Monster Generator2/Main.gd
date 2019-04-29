extends Node2D
func _ready():
	pass # Replace with function body.

var VIT = ""
var MNA = ""
var STR = ""
var DEF = ""
var SPD = ""

func _on_MonsterGenerator2D_submitted():
	VIT = get_node("MonsterGenerator2D").VIT
	MNA = get_node("MonsterGenerator2D").MNA
	STR = get_node("MonsterGenerator2D").STR
	DEF = get_node("MonsterGenerator2D").DEF
	SPD = get_node("MonsterGenerator2D").SPD
	
	get_child(0).queue_free()
	
	get_node("MonsterTrainer2D/VITLabel2").text = "VIT: " + str(VIT)
	get_node("MonsterTrainer2D/MNALabel2").text = "MNA: " + str(MNA)
	get_node("MonsterTrainer2D/STRLabel2").text = "STR: " + str(STR)
	get_node("MonsterTrainer2D/DEFLabel2").text = "DEF: " + str(DEF)
	get_node("MonsterTrainer2D/SPDLabel2").text = "SPD: " + str(SPD).