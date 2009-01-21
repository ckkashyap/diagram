require 'Image'
require 'Line'
require 'Box'
require 'Text'


canvas=Image.new(800,500)


b=Box.new(20,20)
	t=Text.new

32.times do |i|
x=10+20*i
canvas.setCursor(x,200)
canvas.draw(b)
x+=5
canvas.setCursor(x,200)
t.write("1")
t.setColor(0,0,255)
canvas.draw(t)
end
canvas.write("/mnt/hgfs/tabos/Downloads/out.pnm")

