print
Print "ESP8266 Basic Learning IR remote"

dim irButtons(6) as string 
dim irCodes(6) as string
x = 0

ir.recv.setup(2)  
ir.send.setup(0)  
IRBRANCH [received]

for x = 1 to 6
    irButtons(x) = read("irbut" & str(x))
    irCodes(x)   = read("ircode" & str(x))
    if irButtons(x) = "" then irButtons(x) = "UNUSED"
next x

[top]
cls


button irButtons(1), [bu1]
button irButtons(2), [bu2]
button irButtons(3), [bu3]
button irButtons(4), [bu4]
button irButtons(5), [bu5]
button irButtons(6), [bu6]
cssclass "button", "background-color: powderblue;height: 20%;width: 30%;"

print "Last IR recvd"
textbox ircode
print "Text for button"
textbox newtxt
print "Button number"
dropdown x, "1,2,3,4,5,6"
Button "Program Code to button", [program]
print 

IRBRANCH [received]
wait

[received]
ircode = ir.recv.full() 
return

[bu1]
ir.send(irCodes(1))
x = 1
wait

[bu2]
ir.send(irCodes(2))
x = 2
wait

[bu3]
ir.send(irCodes(3))
x = 3
wait

[bu4]
ir.send(irCodes(4))
x = 4
wait

[bu5]
ir.send(irCodes(5))
x = 5
wait

[bu6]
ir.send(irCodes(6))
x = 6
wait

[program]  
irButtons(x) = newtxt
irCodes(x)  =  ircode
write("irbut" & str(x),irButtons(x) )
write("ircode" & str(x),irCodes(x))
goto [top]
