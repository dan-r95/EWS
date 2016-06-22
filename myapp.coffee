#Programm benutzt Input-Framer
#https://github.com/ajimix/Input-Framer

# Set device resolution
device = new Framer.DeviceView()
device.setupContext()
device.deviceType = "google-nexus-5x"
device.contentScale = 1

background = new BackgroundLayer
# end

eNummer = ""
eAbschluss = ""
eGruppe = ""
eRichtung = ""
rDatum = ""
rT1 = ""
rT2 = ""
rT3 = ""
rT4 = ""
rT5 = ""
rStoeren = ""
rNutzung = ""
rName = ""
rId = ""

# Inhalt
content = new Layer
  y: 160
  width: background.width
  height: background.height - 160
  backgroundColor: "rgb(226, 226, 226)"
  parent: navigation
# Inahlt end

# Navigation
navigation = new Layer
  backgroundColor: "rgb(0, 94, 255)"
  width: background.width
  height: 160
  shadowY: 7
  shadowColor: "rgba(0,0,0,0.5)"
  shadowBlur: 7
# Navigation end

# Hambuger Menu Button transparent
hamburgerbuttonT = new Layer
  x: 30
  y: 30
  width: 120
  height: 100
  backgroundColor: "rgba(255,255,255,0)"

hamburgerbuttonT.states.add
  stateRotate:
    rotation: 90
hamburgerbuttonT.states.animationOptions =
    curve: "spring(100, 10, 0)"
# Hambuger Menu Button transparent end

# Hambuger Menu Button
hamburgerbutton = new Layer
  y: 5
  width: 120
  height: 18
  backgroundColor: "white"
  borderRadius: 20
  parent: navigation

hamburgerbutton2 = hamburgerbutton.copySingle()
hamburgerbutton2.x = 0
hamburgerbutton2.y = 42
hamburgerbutton2.parent = hamburgerbutton

hamburgerbutton3 = hamburgerbutton2.copySingle()
hamburgerbutton3.x = 0
hamburgerbutton3.y = 79
hamburgerbutton3.parent = hamburgerbutton

hamburgerbuttonT.addChild(hamburgerbutton)
hamburgerbuttonT.addChild(hamburgerbutton2)
hamburgerbuttonT.addChild(hamburgerbutton3)
#Hamburger Menu Button end

# sucheMenu
sucheMenu = new Layer
  x: 0
  y: 0
  width: background.width
  height: background.height - 160
  backgroundColor: "rgb(226, 226, 226)"
  image: "images/suchmaske.png"
  parent: content
sucheMenu.sendToBack()

sDatum = new Input
  x: 400
  y: 90
  setup: true
  placeholderColor: "#2e2e2e"
  type: "date"
  fontSize: 50
  width: 560
  height: 100
  goButton: true
  parent: sucheMenu

sUhrzeit1 = new Input
  x: 470
  y: 330
  setup: true
  type: "checkbox"
  width: 60
  height: 60
  goButton: true
  parent: sucheMenu
sUhrzeit1.name = "S1"

sUhrzeit2 = new Input
  x: 470
  y: 420
  setup: true
  type: "checkbox"
  width: 60
  height: 60
  goButton: true
  parent: sucheMenu
sUhrzeit2.name = "S2"

sUhrzeit3 = new Input
  x: 470
  y: 505
  setup: true
  type: "checkbox"
  width: 60
  height: 60
  goButton: true
  parent: sucheMenu
sUhrzeit3.name = "S3"

sUhrzeit4 = new Input
  x: 470
  y: 590
  setup: true
  type: "checkbox"
  width: 60
  height: 60
  goButton: true
  parent: sucheMenu
sUhrzeit4.name = "S4"

sUhrzeit5 = new Input
  x: 470
  y: 675
  setup: true
  type: "checkbox"
  width: 60
  height: 60
  goButton: true
  parent: sucheMenu
sUhrzeit5.name = "S5"

sStunde = new Input
  x: 640
  y: 860
  setup: true
  placeholder: "z.B. S 701"
  placeholderColor: "#2e2e2e"
  type: "input"
  fontSize: 50
  width: 320
  height: 100
  goButton: true
  parent: sucheMenu

sRaum = new Input
  x: 640
  y: 860
  setup: true
  placeholder: "z.B. S 701"
  placeholderColor: "#2e2e2e"
  type: "input"
  fontSize: 50
  width: 320
  height: 100
  goButton: true
  parent: sucheMenu

sFrei = new Input
  x: 640
  y: 1140
  setup: true
  type: "checkbox"
  width: 60
  height: 60
  goButton: true
  parent: sucheMenu
sFrei.name = "stoeren"
###
sFrei.on "click", ->
  if rStoeren == ""
    rStoeren = "checked"
  else
    rStoeren = ""###
# sucheMenu end

#suchergebnis
searchResult = new Layer
  x: 0
  y: -50
  width: 1080
  height: 1920
  backgroundColor: "rgb(255, 94, 255)"
  parent: content
  image: "images/suchergebnis.png"
searchResult.sendToBack()
#suchergebnis

#such button
sucheButton = new Layer
  x: 820
  y: 1500
  width: 180
  height: 180
  backgroundColor: "rgb(0, 94, 255)"
  parent: sucheMenu
  borderRadius: 90
  color: "#000"
  shadowY: 7
  shadowX: 7
  shadowColor: "rgba(0,0,0,0.5)"
  shadowBlur: 7
  shadowSpread: 2
  image: "images/suchen.png"
sucheButton.states.add
  stateA:
    rotation: 360
#such button end

#such button handler
sucheButton.on Events.Click, ->
  sucheButton.states.next()
  Utils.delay 1, ->
    searchResult.bringToFront()
    arrowL.bringToFront()
#such button handler


# Reservierung Menü
reservierung = new Layer
  x: 0
  y: 0
  width: background.width
  height: background.height - 160
  backgroundColor: "rgb(226, 226, 226)"
  opacity: 1
  image: "images/reservierung.png"
  parent: content
reservierung.sendToBack()

datum = new Input
  x: 400
  y: 80
  setup: true
  placeholder: "Datum"
  placeholderColor: "#2e2e2e"
  type: "date"
  fontSize: 50
  width: 560
  height: 100
  goButton: true
  parent: reservierung
datum.value = rDatum

uhrzeit1 = new Input
  x: 350
  y: 320
  setup: true
  type: "checkbox"
  width: 60
  height: 60
  goButton: true
  parent: reservierung
uhrzeit1.name = "S1"
uhrzeit1.on "click", ->
  if rT1 == ""
    rT1 = "checked"
  else
    rT1 = ""

uhrzeit2 = new Input
  x: 350
  y: 410
  setup: true
  type: "checkbox"
  width: 60
  height: 60
  goButton: true
  parent: reservierung
uhrzeit2.name = "S2"
uhrzeit2.on "click", ->
  if rT2 == ""
    rT2 = "checked"
  else
    rT2 = ""

uhrzeit3 = new Input
  x: 350
  y: 495
  setup: true
  type: "checkbox"
  width: 60
  height: 60
  goButton: true
  parent: reservierung
uhrzeit3.name = "S3"
uhrzeit3.on "click", ->
  if rT3 == ""
    rT3 = "checked"
  else
    rT3 = ""

uhrzeit4 = new Input
  x: 350
  y: 580
  setup: true
  type: "checkbox"
  width: 60
  height: 60
  goButton: true
  parent: reservierung
uhrzeit4.name = "S4"
uhrzeit4.on "click", ->
  if rT4 == ""
    rT4 = "checked"
  else
    rT4 = ""

uhrzeit5 = new Input
  x: 350
  y: 665
  setup: true
  type: "checkbox"
  width: 60
  height: 60
  goButton: true
  parent: reservierung
uhrzeit5.name = "S5"
uhrzeit5.on "click", ->
  if rT5 == ""
    rT5 = "checked"
  else
    rT5 = ""

stoeren = new Input
  x: 350
  y: 880
  setup: true
  type: "checkbox"
  width: 60
  height: 60
  goButton: true
  parent: reservierung
stoeren.name = "stoeren"
stoeren.on "click", ->
  if rStoeren == ""
    rStoeren = "checked"
  else
    rStoeren = ""

nutzung = new Input
  x: 150
  y: 1250
  setup: true
  placeholder: "Was will ich machen?"
  placeholderColor: "#2e2e2e"
  type: "text"
  fontSize: 72
  width: 800
  height: 100
  goButton: true
  parent: reservierung
nutzung.value = rNutzung

reservierungBack = new Layer
  x: 875
  y: 1530
  width: 90
  height: 90
  backgroundColor: "rgb(222,222,80)"
  parent: reservierung
  borderRadius: 45
  shadowY: 7
  shadowX: 7
  shadowColor: "rgba(0,0,0,0.5)"
  shadowBlur: 7
  shadowSpread: 2
  image: "images/before.png"
reservierungBack.states.add
  stateA:
    x: 130
    rotation: 360

reservierungAdd = new Layer
  x: 850
  y: 1520
  width: 120
  height: 120
  backgroundColor: "rgb(86,254,168)"
  parent: reservierung
  borderRadius: 60
  shadowY: 7
  shadowX: 7
  shadowColor: "rgba(0,0,0,0.5)"
  shadowBlur: 7
  shadowSpread: 2
  image: "images/add.png"
reservierungAdd.states.add
  stateA:
    x: 330
    rotation: 360

reservierungDel = new Layer
  x: 835
  y: 1510
  width: 150
  height: 150
  backgroundColor: "rgb(254,86,86)"
  parent: reservierung
  borderRadius: 75
  color: "#000"
  shadowY: 7
  shadowX: 7
  shadowColor: "rgba(0,0,0,0.5)"
  shadowBlur: 7
  shadowSpread: 2
  image: "images/del.png"
reservierungDel.states.add
  stateA:
    x: 560
    rotation: 360

reservierungOpt = new Layer
  x: 820
  y: 1500
  width: 180
  height: 180
  backgroundColor: "rgb(0, 94, 255)"
  parent: reservierung
  borderRadius: 90
  color: "#000"
  shadowY: 7
  shadowX: 7
  shadowColor: "rgba(0,0,0,0.5)"
  shadowBlur: 7
  shadowSpread: 2
  image: "images/opt.png"
reservierungOpt.states.add
  stateA:
    rotation: 360

reservierungConf = new Layer
  x: 390
  y: 1810
  width: 300
  height: 250
  parent: reservierung
  borderRadius: 0
  color: "#000"
  shadowY: 7
  shadowX: 7
  shadowColor: "rgba(0,0,0,0.5)"
  shadowBlur: 7
  shadowSpread: 2
reservierungConf.states.add
  stateA:
    y: 1460
    curve: "ease-in-out"

reservierungOpt.on Events.Click, ->
  reservierungOpt.states.next()
  reservierungAdd.states.next()
  reservierungDel.states.next()
  reservierungBack.states.next()

reservierungAdd.on Events.Click, ->
  reservierungConf.image = "images/ready.jpg"
  reservierungConf.states.next()
  Utils.delay 1, ->
    reservierungConf.states.next()
  rDatum = datum.value
  rNutzung = nutzung.value
  if rDatum != ""
    roomS[rId].backgroundColor = "rgb(255, 153, 33)"
    roomLayer1[rId].backgroundColor = "rgb(255, 153, 33)"
  if rStoeren != ""
    roomS[rId].backgroundColor = "rgb(255, 0, 0)"
    roomLayer1[rId].backgroundColor = "rgb(255, 0, 0)"

reservierungDel.on Events.Click, ->
  reservierungConf.image = "images/delConf.jpg"
  reservierungConf.states.next()
  Utils.delay 1, ->
    reservierungConf.states.next()
  rDatum = datum.value = ""
  rT1 = ""
  rT2 = ""
  rT3 = ""
  rT4 = ""
  rT5 = ""
  rStoeren = ""
  rNutzung = nutzung.value = ""
  roomS[rId].backgroundColor = "rgb(122, 255, 0)"
  roomLayer1[rId].backgroundColor = "rgb(122, 255, 0)"

reservierungBack.on Events.Click, ->
  reservierung.sendToBack()
# Reservierung Menü end

# About Menü
about = new Layer
  x: 0
  y: 0
  #z: 90
  width: background.width
  height: background.height - 160
  backgroundColor: "rgb(226, 226, 226)"
  #scale: 0
  opacity: 1
  parent: content
  image: "images/ueber_app.png"
# About Menü end

# Einstellungen Menü
einstellungen = new Layer
  width: background.width
  height: background.height - 160
  backgroundColor: "rgb(245,245,245)"
  image: "images/einstellungen.png"
  parent: content
einstellungen.sendToBack()

snummer = new Input
  x: 159
  y: 189
  setup: true
  placeholder: "sXXXXX"
  placeholderColor: "#000"
  type: "text"
  fontSize: 60
  width: 800
  height: 100
  goButton: true
  parent: einstellungen
snummer.value = eNummer

abschluss = new Input
  x: 159
  y: 559
  setup: true
  placeholder: "z.B. Bachelor, Master, Diplom"
  placeholderColor: "#000"
  type: "text"
  fontSize: 60
  width: 800
  height: 100
  goButton: true
  parent: einstellungen
abschluss.value = eAbschluss

sgruppe = new Input
  x: 159
  y: 932
  setup: true
  placeholder: "XX/XXX/XX"
  placeholderColor: "#000"
  type: "text"
  fontSize: 60
  width: 800
  height: 100
  goButton: true
  parent: einstellungen
sgruppe.value = eGruppe

srichtung = new Input
  x: 159
  y: 1309
  setup: true
  placeholder: "z.B. Medieninformatik"
  placeholderColor: "#000"
  type: "text"
  fontSize: 60
  width: 800
  height: 100
  goButton: true
  parent: einstellungen
srichtung.value = eRichtung

einstellungenBOK = new Layer
  x: 730
  y: 1550
  width: 300
  height: 100
  backgroundColor: "rgb(0, 94, 255)"
  parent: einstellungen
  borderRadius: 20
  color: "#000"
  shadowY: 7
  shadowX: 7
  shadowColor: "rgba(0,0,0,0.5)"
  shadowBlur: 7
  shadowSpread: 2
einstellungenBOK.html = "OK"
einstellungenBOK.style =
  "font-size" : "60px"
  "font-family" : "Arial"
  "text-align" : "center"
  "padding-top" : "18px"
  "text-shadow" : "2px 2px rgba(0,0,0,0.5)"
# Reservierung Menü end

# Hambuger Menu Shadow
hamburgershadow = new Layer
  x: 0
  y: 0
  z: 100
  width: background.width
  height: background.height - 160
  backgroundColor: "rgba(0,0,0,0.5)"
  parent: content
  opacity: 0
hamburgershadow.states.add
  stateA:
    opacity: 1
#Hamburger Menu Shadow end

# Hambuger Menu
hamburgermenu = new Layer
  x: -background.width - 200
  y: 0
  z: 100
  width: background.width - 200
  height: background.height - 160
  backgroundColor: "rgb(245,245,245)"
  image: "images/Menue.png"
  parent: content

hamburgermenu.states.add
  stateA:
    x: 30
hamburgermenu.states.animationOptions =
    curve: "spring(120, 37, 10)"
#Hamburger Menu end

#Button Karte
KartenB = new Layer
  x: 180
  y: 280
  width: 600
  height: 110
  parent: hamburgermenu
  opacity: 0
#Button Karte end

#Button Listensuche
ListenB = new Layer
  x: 180
  y: 490
  width: 600
  height: 120
  parent: hamburgermenu
  opacity: 0
#Button Listensuche end

#About Karte
AboutB = new Layer
  x: 180
  y: 690
  width: 600
  height: 120
  parent: hamburgermenu
  opacity: 0
#about Karte end

#Button Einstellungen
einstellungenB = new Layer
  x: 180
  y: 840
  width: 600
  height: 120
  parent: hamburgermenu
  opacity: 0
#Button Einstellungen end

# Button events
hamburgerbuttonT.on Events.Click, (event) ->
  hamburgermenu.states.next()
  hamburgershadow.states.next()
  hamburgerbuttonT.states.next()

einstellungenB.on Events.Click, (event) ->
  einstellungen.bringToFront()
  einstellungen.states.next()
  hamburgermenu.states.next()
  hamburgershadow.states.next()
  hamburgerbuttonT.states.next()

KartenB.on Events.Click, (event) ->
  hamburgermenu.states.next()
  hamburgershadow.states.next()
  hamburgerbuttonT.states.next()
  sucheMenu.sendToBack()
  einstellungen.sendToBack()
  reservierung.sendToBack()
  about.sendToBack()

ListenB.on Events.Click, (event) ->
  sucheMenu.bringToFront()
  hamburgermenu.states.next()
  hamburgershadow.states.next()
  hamburgerbuttonT.states.next()

einstellungenBOK.on Events.Click, ->
  eNummer = snummer.value
  eAbschluss = abschluss.value
  eGruppe = sgruppe.value
  eRichtung = srichtung.value
  einstellungen.states.next()
  einstellungen.sendToBack()

AboutB.on Events.Click, (event) ->
  about.bringToFront()
  arrowL.bringToFront()
  hamburgermenu.states.next()
  hamburgershadow.states.next()
  hamburgerbuttonT.states.next()
# Button events end


# Map
map=new Layer
  width: 2077
  height: 2063
  image: "images/main_map.jpg"

#setze auf untere linke ecke ???
map.x = 0
map.y = 0
map.draggable.enabled = true
# Disable overdrag
map.draggable.overdrag = false
# Disable bounce
map.draggable.bounce = false
# Disable momentum
map.draggable.momentum = false

map.draggable.constraints =
  x:-(map.width-background.width)
  y:-(map.height-background.height)-100
  width: (map.width*2)-background.width
  height: ((map.height*2)-background.height)+100

map.pinchable.maxScale = 3
map.pinchable.minScale = 1
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

# arrows for navigation
arrowL = new Layer
  x: 900
  y: 1500
  width: 100
  height: 100
  backgroundColor: "rgb(222,222,80)"
  borderRadius: 50
  parent: content
  image: "images/before.png"
  shadowY: 7
  shadowX: 7
  shadowColor: "rgba(0,0,0,0.5)"
  shadowBlur: 7
  shadowSpread: 2

arrowL.sendToBack()
#arrow for navigation end

## swipeable S-Gebaeude

page = new PageComponent
  width: Screen.width
  height: Screen.height
  scrollVertical: false
  backgroundColor: "#fff"
  parent: content

pageContent=[]
for number in [0...5]
  pageContent[number] = new Layer
    width: page.width
    height: page.height
    x: page.width * number
    backgroundColor: "rgb(149, 18, 180)"
    parent: page.content
    image: "images/S"+[number]+".jpg"
    opacity: 1

  pageContent[number].pinchable.maxScale = 3
  pageContent[number].pinchable.minScale = 1
  pageContent[number].pinchable.enabled = true
  pageContent[number].pinchable.rotate = false
  pageContent[number].draggable.enabled = true
  pageContent[number].draggable.overdrag = false
  pageContent[number].draggable.bounce = false
  pageContent[number].draggable.momentum = false

  pageContent[number].draggable.constraints =
    x:-(pageContent[number].width-background.width)
    y:-(pageContent[number].height-background.height)-100
    width: (pageContent[number].width*2)-background.width
    height: ((pageContent[number].height*2)-background.height)+100

  pageContent[number].html = pageContent.html = number + 1
  pageContent[number].style =
    "font-size" : "100px",
    "font-weight" : "100",
    "text-align" : "center",
    "line-height" : "#{page.height}px"

page.sendToBack()
#swipeable s-gebäude end

#buttons for s-gebäude
roomS = []
for i in [0..2]
  roomS[i] = new Layer
    width: 70
    height: 70
    backgroundColor: "rgb(122, 255, 0)"
    borderRadius: 50
    parent: pageContent[3]

roomLayer = []
for j in [0..2]
  roomLayer[j] = new Layer
    width: 60
    height: 60
    backgroundColor: "rgb(78, 78, 78)"
    borderRadius: 50
    parent: roomS[j]

roomLayer1 = []
for k in [0..2]
  roomLayer1[k] = new Layer
    width: 43
    height: 43
    backgroundColor: "rgb(122, 255, 0)"
    borderRadius: 50
    parent: roomLayer[k]

for i in [0..2]
  roomLayer[i].center()
  roomLayer1[i].center()

# S 315
roomS[0].x = 420
roomS[0].y = 780
roomS.name = "S 318"

#S 310
roomS[1].x = 545
roomS[1].y = 1460
roomS.name = "S 318"

#S 318
roomS[2].x = 545
roomS[2].y = 995
roomS.name = "S 318"


for i in [0..2]
  roomS[i].sendToBack()
  roomLayer[i].sendToBack()
  roomLayer1[i].sendToBack()
#buttons for s-gebäude end

#arrow event
roomS[0].on Events.Tap, (event) ->
  rName = roomS[0].name
  rId = 0
  reservierung.bringToFront()
  about.sendToBack()
  page.sendToBack()
  arrowL.sendToBack()
  reservierung.bringToFront()
#arrow event end

#arrow event
roomS[1].on Events.Tap, (event) ->
  rName = roomS[1].name
  rId = 1
  reservierung.bringToFront()
  about.sendToBack()
  page.sendToBack()
  arrowL.sendToBack()
  reservierung.bringToFront()
#arrow event end

#arrow event
roomS[2].on Events.Tap, (event) ->
  rName = roomS[2].name
  rId = 2
  about.sendToBack()
  page.sendToBack()
  arrowL.sendToBack()
  reservierung.bringToFront()
#arrow event end

# Button events  click on S
button[1].on Events.Tap, (event) ->
  page.bringToFront()
  arrowL.bringToFront()
  for i in [0..2]
    roomS[i].bringToFront()
    roomLayer[i].sendToBack()
    roomLayer1[i].sendToBack()
# Button events end

#information button
infoButton = new Layer
  x: 850
  y: 50
  width: 180
  height: 180
  backgroundColor: "rgb(0, 94, 255)"
  parent: content
  borderRadius: 90
  color: "#000"
  shadowY: 7
  shadowX: 7
  shadowColor: "rgba(0,0,0,0.5)"
  shadowBlur: 7
  shadowSpread: 2
  image: "images/info.png"
infoButton.states.add
  stateA:
    x: 700
    y: 200
    rotation: 360
    borderRadius: 10
    scale: 3
#information button end

#information button handler
infoButton.on Events.Tap, (event) ->
  infoButton.states.next()
  infoButton.image = "images/legende.png"
#information button handler end

#arrow event
arrowL.on Events.Tap, (event) ->
  sucheMenu.sendToBack()
  searchResult.sendToBack()
  about.sendToBack()
  page.sendToBack()
  arrowL.sendToBack()
#arrow event end
