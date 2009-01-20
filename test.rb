require 'Image'
require 'Line'
require 'Box'
require 'Text'


i=Image.new(400,400)

l=Line.new
l.setColor(255,0,0)
l.right(20)
b=Box.new(50,20,0)


	t=Text.new
	t.write("HELLO")


i.setCursor(100,100)
i.draw(l)
i.setCursor(120,100)
i.draw(b)
i.setCursor(125,95)
i.draw(t)
i.write("/mnt/hgfs/tabos/Downloads/out.pnm")

