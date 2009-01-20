require 'Image'
require 'Line'
require 'Box'


i=Image.new(400,400)

l=Line.new
l.setColor(255,0,0)
l.right(20)
b=Box.new(50,20,0)

i.setCursor(100,100)
i.draw(l)
i.setCursor(120,100)
i.draw(b)
i.write("/mnt/hgfs/tabos/Downloads/out.pnm")

