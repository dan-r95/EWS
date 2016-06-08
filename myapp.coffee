# Set device resolution
device = new Framer.DeviceView()
device.setupContext()
device.deviceType = "google-nexus-5x"
device.contentScale = 1

background = new BackgroundLayer
# end

# Inhalt
content = new Layer
  y: 160
  backgroundColor: "rgb(0, 94, 100)"
  width: background.width
  height: background.height - 160
  backgroundColor: "rgb(226, 226, 226)"
# Inahlt end

# Navigation
navigation = new Layer
  backgroundColor: "rgb(0, 94, 255)"
  width: background.width
  height: 160
# Navigation end

# Hambuger Menu Button
hamburgerbutton = new Layer
  x: 40
  y: 30
  width: 120
  height: 20
  backgroundColor: "white"
  borderRadius: 50
  parent: navigation

hamburgerbutton2 = hamburgerbutton.copySingle()
hamburgerbutton2.x = 0
hamburgerbutton2.y = 40
hamburgerbutton2.parent = hamburgerbutton

hamburgerbutton3 = hamburgerbutton2.copySingle()
hamburgerbutton3.x = 0
hamburgerbutton3.y = 80
hamburgerbutton3.parent = hamburgerbutton
#Hamburger Menu Button end

# Map
map=new Layer
	width: 2077
	height: 2063
	image: "images/main_map.jpg"
#setze auf untere linke ecke ???
map.x = 0
map.y = 0
map.draggable.enabled = true
map.draggable.constraints =
	x:-(map.width-background.width)
	y:-(map.height-background.height)
	width: (map.width*2)-background.width
	height: (map.height*2)-background.height

map.pinchable.maxScale = 3
map.pinchable.enabled = true
map.pinchable.rotate = false

map.onScaleEnd ->
	map.animate
		properties:
			scale:1

content.addChild map
# Map end

# Buttons for main map
button = []
for i in [0..7]
  button[i] = new Layer
    width: 70
    height: 70
    backgroundColor: "rgb(122, 255, 0)"
    borderRadius: 50
    parent: map

buttonLayer = []
for j in [0..7]
  buttonLayer[j] = new Layer
    width: 60
    height: 60
    backgroundColor: "rgb(78, 78, 78)"
    borderRadius: 50
    parent: button[j]

buttonLayer1 = []
for k in [0..7]
  buttonLayer1[k] = new Layer
    width: 43
    height: 43
    backgroundColor: "rgb(122, 255, 0)"
    borderRadius: 50
    parent: buttonLayer[k]

for i in [0..7]
  buttonLayer[i].center()
  buttonLayer1[i].center()

# Z
button[0].x = 325
button[0].y = 1875
button[0].backgroundColor = "black"
buttonLayer1[0].backgroundColor = "black"
buttonLayer1[0].html = "Z"
buttonLayer1[0].color = "rgb(255, 0, 0)"
buttonLayer1[0].style =
  "font-size" : "35px"
  "font-weight" : "Bold"
  "text-align" : "center"

# S
button[1].x = 865
button[1].y = 1705
buttonLayer1[1].html = "S"
buttonLayer1[1].color = "rgb(255, 0, 0)"
buttonLayer1[1].style =
  "font-size" : "35px"
  "font-weight" : "Bold"
  "text-align" : "center"

# N
button[2].x = 1055
button[2].y = 1485
buttonLayer1[2].html = "N"
buttonLayer1[2].color = "rgb(255, 0, 0)"
buttonLayer1[2].style =
  "font-size" : "35px"
  "font-weight" : "Bold"
  "text-align" : "center"
# A
button[3].x = 1105
button[3].y = 1315
buttonLayer1[3].html = "A"
buttonLayer1[3].color = "rgb(255, 0, 0)"
buttonLayer1[3].style =
  "font-size" : "35px"
  "font-weight" : "Bold"
  "text-align" : "center"
# L
button[4].x = 1142
button[4].y = 1005
buttonLayer1[4].html = "L"
buttonLayer1[4].color = "rgb(255, 0, 0)"
buttonLayer1[4].style =
  "font-size" : "35px"
  "font-weight" : "Bold"
  "text-align" : "center"
# T
button[5].x = 747
button[5].y = 1215
buttonLayer1[5].html = "T"
buttonLayer1[5].color = "rgb(255, 0, 0)"
buttonLayer1[5].style =
  "font-size" : "35px"
  "font-weight" : "Bold"
  "text-align" : "center"
# F
button[6].x = 1085
button[6].y = 500
buttonLayer1[6].html = "F"
buttonLayer1[6].color = "rgb(255, 0, 0)"
buttonLayer1[6].style =
  "font-size" : "35px"
  "font-weight" : "Bold"
  "text-align" : "center"
# M
button[7].x = 1775
button[7].y = 1600
buttonLayer1[7].html = "M"
buttonLayer1[7].color = "rgb(255, 0, 0)"
buttonLayer1[7].style =
  "font-size" : "35px"
  "font-weight" : "Bold"
  "text-align" : "center"

# Buttons for main map end



# Stockwerke
buildS = []
for k in [0..6]
  buildS[k] = new Layer
    name: "buildS"+k
    width: content.width
    height: content.height
    backgroundColor: "rgb(149, 18, 180)"
    parent: content
    image: "images/S"+[k]+".jpg"
    opacity: 0
    scale: 0

# Button events
button[1].on Events.Tap, (event) ->
  buildS[0].animate
    properties:
      scale: 1
      opacity: 1
    time: 0.5
    curve: "spring(180, 60, 50)"
# Button events end

# arrows for navigation
arrowL = new Layer
  x: 250
  y: 1240
  z: 500
  width: 90
  height: 90
  backgroundColor: "rgb(0, 255, 10)"
  borderRadius: 50
  parent: content

arrowL.html = "<"
arrowL.style =
  "font-size" : "60px"
  "font-weight" : "Bold"
  "text-align" : "center"

arrowR = new Layer
  x: 740
  y: 1240
  z: 500
  width: 90
  height: 90
  backgroundColor: "rgb(0, 255, 10)"
  borderRadius: 50
  parent: content

arrowR.html = ">"
arrowR.style =
  "font-size" : "60px"
  "font-weight" : "Bold"
  "text-align" : "center"

  #arrow end



# Button events
button[0].on Events.Tap, (event) ->
  buildS[0].opacity = 1
  arrowL.opacity = 1
  arrowR.opacity = 1
# Button events end

page = new PageComponent
    width: Screen.width
    height: Screen.height
    scrollVertical: false
    backgroundColor: "#fff"

for number in [0...5]
  pageContent = new Layer
#  buildS[number] = new Layer
      width: page.width
      height: page.height
      x: page.width * number
      backgroundColor: "rgb(149, 18, 180)"
      parent: page.content
      image: "images/S"+[number]+".jpg"


  pageContent.html = pageContent.html = number + 1

  pageContent.style =
    "font-size" : "100px",
    "font-weight" : "100",
    "text-align" : "center",
    "line-height" : "#{page.height}px"


# arrow events
arrowL.on Events.Tap, (event) ->
    page.snapToPreviousPage()


arrowR.on Events.Tap, (event) ->
      page.snapToNextPage()
      
   # arrow events end
