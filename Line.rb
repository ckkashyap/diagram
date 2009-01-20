require 'Image'
class Line
	def right(image,d)
		(x,y)=image.getCursor
		(x..x+d).each do |xx|
			image.putpixel(xx,y)
		end
		image.setCursor(x+d,y)
	end
	def left(image,d)
		(x,y)=image.getCursor
		(x-d..x).each do |xx|
			image.putpixel(xx,y)
		end
		image.setCursor(x-d,y)
	end

	def up(image,d)
		(x,y)=image.getCursor
		(y-d..y).each do |yy|
			image.putpixel(x,yy)
		end
		image.setCursor(x,y-d)
	end
	def down(image,d)
		(x,y)=image.getCursor
		(y..y+d).each do |yy|
			image.putpixel(x,yy)
		end
		image.setCursor(x,y+d)
	end
end

i=Image.new(100,100)
	i.setCursor(50,50)
	l=Line.new
	l.right(i,20)
	l.up(i,20)
	l.left(i,20)
	l.down(i,20)

i.write("/mnt/hgfs/tabos/Downloads/out.pnm")
