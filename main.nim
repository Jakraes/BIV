import nico, strutils, std/streams

echo("File name: ")
var filename: string = readLine(stdin)

echo("Scale: ")
let scale: int = parseInt(readLine(stdin))

var 
    temp: string
    width, height: int = 0

for i in len(filename)-4..<len(filename):
    temp = temp & filename[i]

if temp != ".txt":
    filename = temp & ".txt"

var 
    file = newFileStream(filename, fmRead)
    line = ""
if not isNil(file):
    while file.readLine(line):
        height += 1
        width = len(line)
    file.close()


proc max(x,y:int):int =
    if x > y:
        return x
    else:
        return y

proc progInit() =
    discard

proc progUpdate(dt:float32) = 
    file = newFileStream(filename, fmRead)
    line = ""

proc progDraw() =
    cls()
    var tempx: int = 0 
    setColor(1)
    rect(0,0,width+1,height+1)
    setColor(7)
    if not isNil(file):
        while file.readLine(line):
            for j in 0 ..< width:
                if line[j] == '1':
                    pset(j+1, tempx+1) #For someone reason it switches x and y so I switched them manually
            tempx += 1
    file.close()

nico.init("Jakraes", "Binary Image Viewer")
fixedSize(true)
integerScale(true)
nico.createWindow("Binary Image Viewer", max(width,height)+2, max(width,height)+2, scale*5)
nico.run(progInit, progUpdate, progDraw)