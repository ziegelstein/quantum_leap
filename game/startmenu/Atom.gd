extends Area2D

# TODO Move global

var atomtypes = {
	"hydrogen" : { "numOfProtons" : 1, "numOfNeutrons": 1, "numOfElectrons": 1}
	}
	
var numOfProtons
var numOfNeutrons
var numOfElectrons
var atomType

var collisionPlayer = PhysicsBody2D.new()

func _ready():
	createAtom("hydrogen")
	pass # Replace with function body.

func createAtom(atomType):
	self.atomType = atomType
	self.numOfProtons = atomtypes.get(atomType).get("numOfProtons")
	self.numOfNeutrons = atomtypes.get(atomType).get("numOfNeutrons")
	self.numOfElectrons = atomtypes.get(atomType).get("numOfElectrons")
	self.gravity = numOfNeutrons * 8 + numOfProtons * 5
	var shape = CircleShape2D.new()
	shape.set_radius(numOfElectrons * 8)
	$Graviation.shape = shape
	createElectrons(numOfElectrons)

func createElectrons(numOfElectrons):
	var electronsOnShell = 2
	var distanceToCore = 5
	for i in range(numOfElectrons):
		for i in range(electronsOnShell):
			var elec = null # Null Pointer Exception: $Graviation/Electron.instance()
			add_child(elec)
			# TODO Think about a nice algorithm to place the electron
			#elec.set_position(Vector2(distanceToCore, distanceToCore))
			#electronsOnShell = 8
		distanceToCore += 5
	pass
	
func createProtons(numOfProtons):
	for i in range(numOfProtons):
		pass
		
func createNeutrons(numOfNeutrons):
	for i in range(numOfNeutrons):
		pass
func _on_Atom_body_shape_entered(body_id, body, body_shape, area_shape):
	if (body.name == "Player"):
		$CollisionTimer.wait_time = 500
		$CollisionTimer.one_shot = true
		$CollisionTimer.start()
		body.PAUSE_MODE_STOP
		# TODO play sound
		collisionPlayer = body
	pass


func _on_CollisionTimer_timeout():
	collisionPlayer.PAUSE_MODE_PROCESS
	collisionPlayer # TODO Bounce Back
	collisionPlayer = null