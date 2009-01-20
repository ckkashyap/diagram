require 'Image'
require 'Line'
require 'Box'
require 'Text'


i=Image.new(800,600)

l=Line.new
l.setColor(255,0,0)
l.right(250)

	
b=Box.new(100,20)
b1=Box.new(100,100)

	t=Text.new
	t.setColor(0,0,255)
	t.write("HELLO")


i.setCursor(100,100)
i.draw(l)
i.setCursor(120,100)
i.draw(b)
i.setCursor(125,95)
i.draw(t)
	a=false
	50.times do |x|
	i.setCursor(320+x,100+x)
	b1.setColor(255,50,0) if a
	b1.setColor(0,50,0) unless a
	if a 
		a=false
	else
		a=true
	end

	i.draw(b1)
	end

i.write("/mnt/hgfs/tabos/Downloads/out.pnm")

