require 'Image'
require 'Line'
require 'Box'
require 'Text'



def drawNumber(canvas,x,y,val,name) # represent a val in 32 bits
	bit=Box.new(20,20)
	bit.setColor(125,127,127)
	t=Text.new
	t.setColor(255,0,0)
	[val].pack("N").unpack("B*")[0].each_byte do |b|
		canvas.setCursor(x,y)
		canvas.draw(bit)
		str="1"
		str="0" if b==48
		t.write(str)
		canvas.setCursor(x+2,y+2)
		canvas.draw(t)
		t.clear
		x=x+20
	end
	canvas.setCursor(x+20,y)
	t.write(name)
	canvas.draw(t)
end


structure=<<'END'
int id;
char b;
short vijay;
END

symbols=Hash.new
symbols["id"]=20
symbols["b"]=7
symbols["vijay"]=100


canvas=Image.new(800,500)
t=Text.new
t.setColor(0,0,255)
bit=Box.new(40,40)
x=20
y=20
structure.each_line do |line|
	/(\S+) (\S+);/.match(line)
	size=1
	case $1
		when "int"
			size=4
		when "char"
			size=1
		when "short"
			size=2
	end
	val=symbols[$2]

	drawNumber(canvas,x,y,val,$2)
	y=y+20
	puts size

end
t.clear
t.write("She sells sea shells on the sea shore")
canvas.setCursor(20,100)
canvas.draw(t)
canvas.setCursor(20,118)
canvas.draw(t)
t.clear
t.write("The quick brown fox jumped over the lazy dog")
canvas.setCursor(20,136)
canvas.draw(t)
t.clear
t.setColor(127,127,127)
t.write("Where there is a will, there is pay")
canvas.setCursor(20,136+18)
canvas.draw(t)

canvas.write("/mnt/hgfs/tabos/Downloads/out.pnm")

