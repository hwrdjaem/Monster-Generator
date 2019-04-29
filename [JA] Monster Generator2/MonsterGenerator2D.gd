extends Node2D
func _ready():
	pass # Replace with function body.
var password_dict = {"a":1, "b":2, "c":3, "d":4, "e":5, "f":6, "g":7, "h":8, "i":9, "j":10, "k":11, "l":12, "m":13, "n":14, "o":15, "p":16, "q":17, "r":18, "s":19, "t":20, "u":21, "v":22, "w":23, "x":24, "y":25, "z":26, "A":10000, "B":20000, "C":30000, "D":40000, "E":50000, "F":60000, "G":70000, "H":80000, "I":90000, "J":100000, "K":110000, "L":120000, "M":130000, "N":140000, "O":150000, "P":160000, "Q":170000, "R":180000, "S":190000, "T":200000, "U":210000, "V":220000, "W":230000, "X":240000, "Y":250000, "Z":260000}
var attribute_dict = { 0: 0, 1: 1, 2: 2, 3: 3, 4: 4, 5: 5, 6: 6, 7: 7, 8: 8, 9: 9}

var monster_attributes = []
var password_value = 0

signal submitted

var VIT = ""
var MNA = ""
var STR = ""
var DEF = ""
var SPD = ""

#Generates the monster_attributes list
#Regulates list so that it always contains the correct number of values for our purposes
#If character submitted to the password isn't in the dictionary, it has no effect on the final outcome
func _password_checker(password):
	for x in password:
		if x in password_dict:
			password_value += password_dict[x]
		else:
			password_value += 0
			
	password_value = str(password_value)
	for y in password_value:
		monster_attributes.append(int(y))
		
	var desired_length = 5
	while monster_attributes.size() != desired_length:
		if monster_attributes.size() > desired_length:
			monster_attributes.pop_back()
		elif monster_attributes.size() < desired_length:
			monster_attributes.push_back(0)

#Returns the total value of all numbers in an array
func _check_total(some_array):
	var total = 0
	for x in some_array:
		total += x
	
	return total

#Returns the index of the first instance of the highest value in an array
func _check_highest(some_array):
	var index = 0
	var win_count = 0
	
	while win_count != (len(some_array) - index):
		if some_array[index] >= some_array[index + win_count]:
			win_count += 1
		else:
			win_count = 0
			index += 1
	return index

#Returns the index of the first instance of the lowest value in an array
func _check_lowest(some_array):
	var index = 0
	var win_count = 0

	while win_count != (len(some_array) - index):
		if some_array[index] <= some_array[index + win_count]:
			win_count += 1
		else:
			win_count = 0
			index += 1
	return index

#Ensures that the sum of all items in an array is equal to a certain number
func _stat_balancer(some_array):
	var total = _check_total(some_array)
	
	while total != 25:
		if total > 25:
			var index = _check_highest(some_array)
			some_array[index] -= 1
			total = _check_total(some_array)
		elif total < 25:
			var index = _check_lowest(some_array)
			some_array[index] += 1
			total = _check_total(some_array)
	return some_array

#Even correcting this typo (Passoword) on both the function and the node doesn't help... the debugger gets mad
func _on_SubmitPasswordButton_pressed():
	#Set variables back to zero for a fresh attempt
	monster_attributes = []
	password_value = 0
	
	var password = get_node("PasswordLineEdit").get_text()
	_password_checker(password)
	get_node("TestLabel").text = "Password Value: " + str(password_value)
	_stat_balancer(monster_attributes)
	
	VIT = attribute_dict[monster_attributes[0]]
	MNA = attribute_dict[monster_attributes[1]]
	STR = attribute_dict[monster_attributes[2]]
	DEF = attribute_dict[monster_attributes[3]]
	SPD = attribute_dict[monster_attributes[4]]
	
	get_node("VITLabel").text = "VIT: " + str(VIT)
	get_node("MNALabel").text = "MNA: " + str(MNA)
	get_node("STRLabel").text = "STR: " + str(STR)
	get_node("DEFLabel").text = "DEF: " + str(DEF)
	get_node("SPDLabel").text = "SPD: " + str(SPD)
	
	emit_signal("submitted")