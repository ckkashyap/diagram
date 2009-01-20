class Image
	@width
	@height
	@buffer
	def initialize(width,height)
		@width=width
		@height=height
		x=[255].pack("c")
		@buffer=x*(height*width*3)
	end
	def write(name="out.png")
		file=File.open(name,"wb")
		file.print("P6\n")
		file.print("#Comment\n")
		file.print("#{@width} #{@height}\n")
		file.print("255\n")
		file.print(@buffer)
		file.close
	end

end

i=Image.new(100,100)
	i.write
