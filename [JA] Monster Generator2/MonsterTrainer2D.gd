extends Node2D

func _on_VITButton_pressed():
	VIT += 4
	get_node("MonsterTrainer2D/VITLabel2").text = "VIT: " + str(VIT)

func _on_MNAButton_pressed():
	MNA += 4
	get_node("MonsterTrainer2D/MNALabel2").text = "MNA: " + str(MNA)

func _on_STRButton_pressed():
	STR += 4
	get_node("MonsterTrainer2D/STRLabel2").text = "STR: " + str(STR)

func _on_DEFButton_pressed():
	DEF += 4
	get_node("MonsterTrainer2D/DEFLabel2").text = "DEF: " + str(DEF)

func _on_SPDButton_pressed():
	SPD += 4
	get_node("MonsterTrainer2D/SPDLabel2").text = "SPD: " + str(SPD)