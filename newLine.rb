require 'Image'
require 'Line'
require 'Box'
require 'Text'


i=Image.new(500,500)

l=Line.new
i.setCursor(1,1)
l.drawLine(0,0,10,5)
l.drawLine(10,10,20,25)
l.drawLine(100,100,90,35)
50.times do |x|
l.drawLine(10,10,x*10,450)
end
i.draw(l)
i.write("/mnt/hgfs/tabos/Downloads/out.pnm")

