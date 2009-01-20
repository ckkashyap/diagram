class Image
	@width
	@height
	@buffer

	@offsetFactor

	@cursor_x
	@cursor_y
	def initialize(width,height)
		@width=width
		@height=height
		x=[255].pack("c")
		@buffer=x*(height*width*3)
		@offsetFactor=width*3
		@cursor_x=0
		@cursor_y=0
	end
	def write(name="out.pnm")
		file=File.open(name,"wb")
		file.print("P6\n")
		file.print("#Comment\n")
		file.print("#{@width} #{@height}\n")
		file.print("255\n")
		file.print(@buffer)
		file.close
	end
	
	def putpixel(x,y,r=0,g=0,b=0)
		offset=y*@offsetFactor + x*3
		@buffer[offset,3]=[r,g,b].pack("ccc")
	end

	def getCursor
		[@cursor_x,@cursor_y]
	end
	def setCursor(x,y)
		@cursor_x=x
		@cursor_y=y
	end
	
	def draw(d)
		d.render(self)
	end
end

