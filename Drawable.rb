class Drawable
	@points
	@r
	@g
	@b
	def render(image)
		(cx,cy)=image.getCursor
		@points.each do |p|
			(x,y,r,g,b)=p
			if r.nil?
				r=@r
				g=@g
				b=@b
			end
			x+=cx
			y+=cy
			image.putpixel(x,y,r,g,b)
		end
	end
	def initialize
		@points=Array.new
		@r=@g=@b=0
	end
	def setColor(r,g,b)
		@r=r
		@g=g
		@b=b
	end
	def clear
		@points=Array.new
	end
end
