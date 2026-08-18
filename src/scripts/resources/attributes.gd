extends RefCounted
class_name Attirbute

enum GhostTypes {
	None = 0,
	Normal = 1,
	XRay = 2
}

var base_layers : Dictionary = {}
var color_layers : Dictionary = {
	'glow' : Color.YELLOW,
	'glow2' : Color.ORANGE,
	'glow3' : Color.RED,
}
var attributes : Dictionary = {
	'glow' : 0,
	'glow2' : 0,
	'glow3' : 0,
	'gradientGlow': 0,
	'candyGlow': 0,
	'ghost' : 0,
	'scale' : 100
}
var types : Dictionary = {
	'__form' : ['default'],
}

func get_data() -> Dictionary:
	var data : Dictionary = {
		'base_layers' : from_color_to_dictionary(base_layers),
		'color_layers' : from_color_to_dictionary(color_layers),
		'types' : types,
		'attributes' : attributes
	}
	return data

static func from_color_to_dictionary(data : Dictionary) -> Dictionary:
	var output : Dictionary = {}
	for i in data.keys():
		var color : Color = data[i]
		output[i] = {
			'r' : color.r,
			'g' : color.g,
			'b' : color.b,
			'a' : color.a,
		}
	
	return output

class CatAttirbutes extends Attirbute:
	
	static var base : Dictionary = {
		'body' : Color.WHITE,
		'head' : Color.WHITE,
		'tail' : Color.WHITE,
		'leg' : Color.WHITE,
		'foot' : Color.WHITE,
		'ruff' : Color.WHITE,
		'nose' : Color.HOT_PINK,
		'mouth' : Color.DIM_GRAY,
		'toes' : Color.DIM_GRAY,
		}
	
	static var colors : Dictionary = {
			'earInner' : Color.HOT_PINK,
			'earOuter' : Color.WHITE,
			'eyeBrow' : Color.WHITE,
			
			'eyeLid' : Color.DARK_SLATE_GRAY,
			'eyeShadow' : Color.DARK_SLATE_GRAY,
			'pupil' : Color.DARK_BLUE,
			'iris' : Color.BLUE,
			
			'face' : Color.WHITE,
			
			'stripes' : Color.WHITE,
			'leopardSpots' : Color.WHITE,
			'calicoSpots1' : Color.WHITE,
			'calicoSpots2' : Color.WHITE,
		}
	
	static var att : Dictionary ={
			'stripes' : 0,
			'calicoSpots1' : 0,
			'calicoSpots2' : 0,
			
			'leopardSpots' : 0,
			'horn' : 0,
			'fancyMane' : 0,
			
			'tattooStar' : 0,
			'sparkles' : 0,
		}
	
	static var pet_types : Dictionary = {
			'__form' : ['default'],
			'special': ['None','sparkles','tattooStar'],
			'body'   : ['default','scruffy', 'persian', 'fold', 'skinny'],
			'tail'  : ['default'],
		}
	
	func _init() -> void:
		base_layers = base.duplicate(true)
		color_layers.merge(colors, true)
		attributes.merge(att, true)
		
		types = {
			'__form' : ['default'],
			'special': [],
			'body'   : ['default'],
		}

class DogAttirbutes extends Attirbute:
	
	static var base : Dictionary = {
		'body' : Color.WHITE,
		'head' : Color.WHITE,
		'tail' : Color.WHITE,
		'leg' : Color.WHITE,
		'foot' : Color.WHITE,
		'nose' : Color.HOT_PINK,
		'mouth' : Color.DIM_GRAY,
		'toes' : Color.DIM_GRAY,
		}
	
	static var colors : Dictionary = {
			'earInner' : Color.HOT_PINK,
			'earOuter' : Color.WHITE,
			'eyeBrow' : Color.WHITE,
			
			'eyeLid' : Color.DARK_SLATE_GRAY,
			'eyeShadow' : Color.DARK_SLATE_GRAY,
			'pupil' : Color.DARK_BLUE,
			'iris' : Color.BLUE,
			
			'face' : Color.WHITE,
			
			'dalmationsSpots' : Color.WHITE,
			'headPlate' : Color.WHITE,
			'chestPlate' : Color.WHITE,
			'eyePatch' : Color.WHITE,
			'bigSpots' : Color.WHITE,
		}
	
	static var att : Dictionary ={
			'dalmationsSpots' : 0,
			'bigSpots' : 0,
			'chestPlate' : 0,
			'eyePatch' : 0,
			'headPlate' : 0,
		}
	
	static var pet_types : Dictionary = {
			'__form' : ['default', 'small'],
			'ears'  :  ['default','floppy','pointy','droopy','curly'],
			'tail'  : ['default','stubby','curly', 'fluffy', 'skinny','scruffy'],
			'body' :  ['default', 'scruffy','curly'],
		}
	
	func _init() -> void:
		base_layers = base.duplicate(true)
		color_layers.merge(colors, true)
		attributes.merge(att, true)
		
		types = {
			'__form' : ['default'],
			'ears'  :  ['default'],
			'tail'  : ['default'],
			'body' :  ['default'],
		}

class CorgiAttirbutes extends Attirbute:
	
	static var base : Dictionary = {
		'body' : Color.WHITE,
		'head' : Color.WHITE,
		'tail' : Color.WHITE,
		'leg' : Color.WHITE,
		'foot' : Color.WHITE,
		'nose' : Color.HOT_PINK,
		'mouth' : Color.DIM_GRAY,
		'toes' : Color.DIM_GRAY,
		}
	
	static var colors : Dictionary = {
			'earInner' : Color.HOT_PINK,
			'earOuter' : Color.WHITE,
			'eyeBrow' : Color.WHITE,
			
			'eyeLid' : Color.DARK_SLATE_GRAY,
			'eyeShad' : Color.DARK_SLATE_GRAY,
			'pupil' : Color.DARK_BLUE,
			'iris' : Color.BLUE,
			
			'bib' : Color.WHITE,
			'muzzle': Color.WHITE,
			
			'chest' : Color.WHITE,
			'spots' : Color.WHITE,
			'bigSpot' : Color.WHITE,
			'shoulder' : Color.WHITE,
			'thigh' : Color.WHITE,
		}
	
	static var att : Dictionary ={}
	
	static var pet_types : Dictionary = {
			'__form' : ['default'],
		}
	
	func _init() -> void:
		base_layers = base.duplicate(true)
		color_layers.merge(colors, true)
		attributes.merge(att, true)
		
		types = {
			'__form' : ['default'],
		}

class YorkieAttirbutes extends Attirbute:
	
	static var base : Dictionary = {
		'body' : Color.WHITE,
		'head' : Color.WHITE,
		'tail' : Color.WHITE,
		'leg' : Color.WHITE,
		'foot' : Color.WHITE,
		'nose' : Color.HOT_PINK,
		'mouth' : Color.DIM_GRAY,
		'muzzle' : Color.WHITE,
		'toes' : Color.DIM_GRAY,
		}
	
	static var colors : Dictionary = {
			'earInner' : Color.HOT_PINK,
			'earOuter' : Color.WHITE,
			'brow' : Color.WHITE,
			'chin' : Color.WHITE,
			
			'eyeLid' : Color.DARK_SLATE_GRAY,
			'eyeShad' : Color.DARK_SLATE_GRAY,
			'pupil' : Color.DARK_BLUE,
			'iris' : Color.BLUE,
			'noseSpot' : Color.WHITE,
			
			'chest' : Color.WHITE,
			'spots' : Color.WHITE,
			'shoulder' : Color.WHITE,
			'thigh' : Color.WHITE,
		}
	
	static var att : Dictionary ={
			'spots' : 0,
		}
	
	static var pet_types : Dictionary = {
			'__form' : ['default'],
			'spotType' : ['default','spot','hearts']
		}
	
	func _init() -> void:
		base_layers = base.duplicate(true)
		color_layers.merge(colors, true)
		attributes.merge(att, true)
		
		types = {
			'__form' : ['default'],
			'spotType' : ['default']
		}

class ReindeerAttirbutes extends Attirbute:
	static var base : Dictionary = {
		'body' : Color.GRAY,
		#'tail' : Color.WHITE,
		'nose' : Color.HOT_PINK,
		'mouth' : Color.DIM_GRAY,
		'face': Color.GRAY,
		}
	
	static var colors : Dictionary = {
			'antler1' : Color.BISQUE,
			'tummy' : Color.WHITE,
			
			'muzzle' : Color.CORNSILK,
			'neck' : Color.WEB_GRAY,

			'legStripe' : Color.WHITE,
			'leg': Color.WEB_GRAY,
			'shoulder': Color.WEB_GRAY,
			'hoof' : Color.DIM_GRAY,
			'hoofHilite': Color.DARK_SLATE_GRAY,
		
			'earInner' : Color.HOT_PINK,
			'earOuter' : Color.GRAY,
			'eyeBrow' : Color.WHITE,
			
			'eyeWhite' : Color.WHITE,
			'eyeLid' : Color.DARK_SLATE_GRAY,
			'eyeShadow' : Color.DARK_SLATE_GRAY,
			'pupil' : Color.DARK_BLUE,
			'iris' : Color.BLUE,

			'faceStripe' : Color.WHITE_SMOKE,
			'bodySpots' : Color.WHITE,
			'zebraStripes' : Color.WHITE,
			
			'appoloosaSpots' : Color.WHITE,
			'appoloosaTail' : Color.DIM_GRAY,
			'pintoSpots' : Color.WHITE,
			#'legCly' : Color.WHITE,
		}
	
	static var att : Dictionary ={
			'zebraStripes' : 0,
			'appoloosaSpots' : 0,

			'pintoSpots' : 0,
			'legCly' : 0,
			'bodySpots' : 0,
		}
	
	static var pet_types : Dictionary = {
			'__form' : ['default'],
		}
	
	func _init() -> void:
		base_layers = base.duplicate(true)
		color_layers.merge(colors, true)
		attributes.merge(att, true)

class WolfAttirbutes extends Attirbute:
	
	static var base : Dictionary = {
		'body' : Color.SADDLE_BROWN,
		'tail' : Color.SADDLE_BROWN,
		'head' : Color.SADDLE_BROWN,
		'leg' : Color.SADDLE_BROWN,
		'foot' : Color.TAN,
		'nose' : Color.HOT_PINK,
		'mouth' : Color.DARK_RED,
		'toes' : Color.DARK_RED,
		}
	
	static var colors : Dictionary = {
			'earInner' : Color.HOT_PINK,
			'earOuter' : Color.SADDLE_BROWN,
			'eyeBrow' : Color.WHITE,
			
			'eyeLid' : Color.DARK_SLATE_GRAY,
			'eyeShad' : Color.DARK_SLATE_GRAY,
			'pupil' : Color.DARK_BLUE,
			'iris' : Color.BLUE,

			'noseTop' : Color.PINK,
			'bodyUppercoat' : Color.WHITE,
			'undercoat' : Color.TAN,
			'wrist' : Color.TAN,
			'claws' : Color.DARK_RED,
			'shoulder' : Color.SADDLE_BROWN,
			'headStar' : Color.WHITE,
			'headStripe' : Color.ROSY_BROWN,
			'earTip' : Color.DARK_RED,
			'eyeback' : Color.TAN,
			'eyespot' : Color.WHITE,
			'muzzleTop' : Color.NAVAJO_WHITE,
			#'muzzleSide' : Color.ROSY_BROWN,
			'tailStripe' : Color.SADDLE_BROWN,
			'tailUndercoat' : Color.ROSY_BROWN,
			'tailTip' : Color.DARK_RED,
			'neck' : Color.SADDLE_BROWN,
			'hackles' : Color.WHITE,
			'shoulderStripe' : Color.ROSY_BROWN,
			'neckUndercoat' : Color.ROSY_BROWN,
			'earFluff' : Color.WHITE,
			'cheek' : Color.BURLYWOOD,
			'spots' : Color.WHITE,
			'splotch1' : Color.WHITE,
			'splotch2' : Color.WHITE,
			'speckles' : Color.WHITE,
		}
	
	static var att : Dictionary ={
			'spots' : 0,
			'splotch1' : 0,
			'splotch2' : 0,
			'speckles' : 0,
			'hackles' : 0,
			'scruffy' : 0,
		}
	
	static var pet_types : Dictionary = {
			'__form' : ['default'],
			'earType' : ['default', 'big'],
			'cheekType' : ['default', 'small'],
			'tailType' : ['default', 'down'],
			'scruffy' : ['default', 'scruffy'],
			'fang' : ['default', 'fang'],
		}
	
	func _init() -> void:
		base_layers = base.duplicate(true)
		color_layers.merge(colors, true)
		attributes.merge(att, true)
		
		types = {
			'__form' : ['default'],
			'earType' : ['default'],
			'cheekType' : ['default'],
			'tailType' : ['default'],
			'scruffy' : ['default'],
			'fang' : ['default'],
		}

class MaineCoonAttirbutes extends Attirbute:
	
	static var base : Dictionary = {
		'body' : Color.WHITE,
		}
	
	static var colors : Dictionary = {
			'earInner' : Color.HOT_PINK,
			'ear' : Color.WHITE,
			'earDark' : Color.WHITE,
			'brow' : Color.WHITE,
			'chin' : Color.WHITE,
			'muzzle' : Color.WHITE,
			'beard' : Color.WHITE,
			
			'head' : Color.WHITE,
			'tail' : Color.WHITE,
			'leg' : Color.WHITE,
			'foot' : Color.WHITE,
			'nose' : Color.HOT_PINK,
			'noseDark' : Color.WHITE,
			'mouth' : Color.DIM_GRAY,
			'toe' : Color.DIM_GRAY,
			
			'eyeLine' : Color.DARK_SLATE_GRAY,
			'eyeShadow' : Color.DARK_SLATE_GRAY,
			'pupil' : Color.DARK_BLUE,
			'iris' : Color.BLUE,
			
			'tailStripes' : Color.WHITE,
			'headSpot' : Color.WHITE,
			
			'chest' : Color.WHITE,
			'spots' : Color.WHITE,
			'stripes': Color.WHITE,
			'whisker' : Color.WHITE,
		}
	
	static var att : Dictionary ={
			'spots' : 0,
			'striped': 0,
		}
	
	static var pet_types : Dictionary = {
			'__form' : ['default'],
			'spotType' :["default","spot","striped"]
		}
	
	func _init() -> void:
		base_layers = base.duplicate(true)
		color_layers.merge(colors, true)
		attributes.merge(att, true)
		
		types = {
			'__form' : ['default'],
			'spotType' : ['default'],
		}

class TriceratopsAttirbutes extends Attirbute:
	
	static var base : Dictionary = {
		'body' : Color.WHITE,
		'head' : Color.WHITE,
		'tail' : Color.WHITE,
		'leg' : Color.WHITE,
		'foot' : Color.WHITE,
		'nose' : Color.HOT_PINK,
		'mouth' : Color.DIM_GRAY,
		}
	
	static var colors : Dictionary = {
			'shield' : Color.GREEN_YELLOW,
			'shieldHilite' : Color.WHITE,
			
			'eyeLid' : Color.DARK_SLATE_GRAY,
			'eyeShad' : Color.DARK_SLATE_GRAY,
			'pupil' : Color.DARK_BLUE,
			'iris' : Color.BLUE,
			
			'headHilite' : Color.WHITE,
			'footSole' : Color.WHITE,
			'footPad' : Color.HOT_PINK,
			
			'tailStripe' : Color.WHITE,
			
			'horn': Color.WHITE,
			'hornBase': Color.DIM_GRAY,
			'hornShadow': Color.DIM_GRAY,

			'torsoStripe' : Color.WHITE,
			'torsoSpots' : Color.WHITE,
			'legSpots' : Color.WHITE,
			'toeNail' : Color.WHITE,
			'headSpots' : Color.WHITE,
		}
	
	static var att : Dictionary ={}
	
	static var pet_types : Dictionary = {
			'__form' : ['default'],
		}
	
	func _init() -> void:
		base_layers = base.duplicate(true)
		color_layers.merge(colors, true)
		attributes.merge(att, true)

class FoxAttirbutes extends Attirbute:
	
	static var base : Dictionary = {
		'body' : Color.WHITE,
		'head' : Color.WHITE,
		'tail' : Color.WHITE,
		'leg' : Color.WHITE,
		'foot' : Color.WHITE,
		'nose' : Color.HOT_PINK,
		'mouth' : Color.DIM_GRAY,
		}
	
	static var colors : Dictionary = {
		'eyeBrow': Color.WHITE,
		'earOuter': Color.WHITE,
		'eyeShadow' : Color.DIM_GRAY,
		'eyeLid': Color.DIM_GRAY,
		'eyeDark': Color.DIM_GRAY,
		'earInner': Color.HOT_PINK,
		'eyeMask': Color.DIM_GRAY,
		'earShadow': Color.DIM_GRAY,
		'noseHilite': Color.WHITE,
		'footLine': Color.DIM_GRAY,
		
		'pupil' : Color.DARK_BLUE,
		'iris' : Color.BLUE,
		'headLight': Color.WHITE,
		'tailLight': Color.WHITE,
		'chest'  : Color.WHITE,
		'legDark'  : Color.WHITE,
		}
	
	static var att : Dictionary ={}
	
	static var pet_types : Dictionary = {
			'__form' : ['default'],
		}
	
	func _init() -> void:
		base_layers = base.duplicate(true)
		color_layers.merge(colors, true)
		attributes.merge(att, true)

class GuineaPigAttirbutes extends Attirbute:
	
	static var base : Dictionary = {
		'body' : Color.WHITE,
		'head' : Color.WHITE,
		'foot' : Color.WHITE,
		'nose' : Color.HOT_PINK,
		'mouth' : Color.DIM_GRAY,
		}
	
	static var colors : Dictionary = {
		'eyeBrow': Color.WHITE,
		'earOuter': Color.WHITE,
		'eyeShadow' : Color.DIM_GRAY,
		'eyeLid': Color.DIM_GRAY,
		'muzzle': Color.YELLOW,
		'belly': Color.YELLOW,
		'pupil' : Color.DARK_BLUE,
		'iris' : Color.BLUE,
		'nostrils': Color.DARK_BLUE,
		'footlines' : Color.DARK_BLUE,
		}
	
	static var att : Dictionary ={}
	
	static var pet_types : Dictionary = {
			'__form' : ['default'],
		}
	
	func _init() -> void:
		base_layers = base.duplicate(true)
		color_layers.merge(colors, true)
		attributes.merge(att, true)

class KangarooAttirbutes extends Attirbute:
	
	static var base : Dictionary = {
		'body' : Color.WHITE,
		'head' : Color.WHITE,
		'tail' : Color.WHITE,
		'leg' : Color.WHITE,
		'hair': Color.WHITE,
		'pouch': Color.WHITE,
		'foot' : Color.WHITE,
		'toe': Color.WHITE,
		'nose' : Color.HOT_PINK,
		'mouth' : Color.DIM_GRAY,
		}
	
	static var colors : Dictionary = {
		'nostrils' : Color.BLUE,
		'eyeBrow': Color.WHITE,
		'earInner' : Color.DIM_GRAY,
		'ear': Color.WHITE,
		'eyeShadow' : Color.DIM_GRAY,
		'eyeLid': Color.DIM_GRAY,
		'muzzle': Color.YELLOW,
		'belly': Color.YELLOW,
		'arm': Color.WHITE,
		'armDark' : Color.DIM_GRAY,
		'pupil' : Color.DARK_BLUE,
		'iris' : Color.BLUE,
		'tailDark' : Color.DIM_GRAY,
		
		}
	
	static var att : Dictionary = {}
	
	static var pet_types : Dictionary = {
			'__form' : ['default'],
		}
	
	func _init() -> void:
		base_layers = base.duplicate(true)
		color_layers.merge(colors, true)
		attributes.merge(att, true)

class HorseAttirbutes extends Attirbute:
	static var base : Dictionary = {
		'body' : Color.GRAY,
		'tail' : Color.WHITE,
		'nose' : Color.HOT_PINK,
		'mouth' : Color.DIM_GRAY,
		'face': Color.GRAY,
		}
	
	static var colors : Dictionary = {
			'tummy' : Color.WHITE,
			
			'muzzle' : Color.CORNSILK,
			'cheek': Color.CORNSILK,
			'neck' : Color.WEB_GRAY,

			'legStripe' : Color.WHITE,
			'leg': Color.WEB_GRAY,
			'mane' :Color.DIM_GRAY,
			'fancyMane' :Color.DIM_GRAY,
			'hoof' : Color.DIM_GRAY,
			'hoofHilite': Color.DARK_SLATE_GRAY,
		
			'earInner' : Color.HOT_PINK,
			'earOuter' : Color.GRAY,
			'eyeBrow' : Color.WHITE,
			
			'eyeWhite' : Color.WHITE,
			'eyeLid' : Color.DARK_SLATE_GRAY,
			'eyeShadow' : Color.DARK_SLATE_GRAY,
			'pupil' : Color.DARK_BLUE,
			'iris' : Color.BLUE,

			'faceStripe' : Color.WHITE_SMOKE,
			'bodySpots' : Color.WHITE,
			'zebraStripes' : Color.WHITE,
			
			'appoloosaSpots' : Color.WHITE,
			'appoloosaTail' : Color.DIM_GRAY,
			'pintoSpots' : Color.WHITE,
			'hornHilite' : Color.WHITE,
			'horn' : Color.DIM_GRAY,
			'wing' : Color.DIM_GRAY,
			'wingHilite': Color.WHITE,
			
			'zebraMane': Color.DIM_GRAY,
			'neckShadow': Color.DIM_GRAY,
			'noseShadow': Color.DIM_GRAY,
			
			'legCly' : Color.WHITE,
		}
	
	static var att : Dictionary ={
		'horn':0,
		'zebraStripes':0,
		'zebraMane':0,
		'appoloosaSpots':0,
		'appoloosaTail':0,
		'pintoSpots':0,
		'wing':0,
		'legCly':0,
		'fancyMane':0,
		'bodySpots':0
		}
	
	static var pet_types : Dictionary = {
			'__form' : ['default'],
		}
	
	func _init() -> void:
		base_layers = base.duplicate(true)
		color_layers.merge(colors, true)
		attributes.merge(att, true)
