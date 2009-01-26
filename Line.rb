require 'Drawable'
class Line < Drawable
	@cursor_x
	@cursor_y
	def right(d)
		bx=@cursor_x
		@cursor_x=@cursor_x+d
		(bx..@cursor_x).each do |x|
			@points.push([x,@cursor_y])
		end
	end
	def left(d)
		bx=@cursor_x
		@cursor_x=@cursor_x-d
		(@cursor_x..bx).each do |x|
			@points.push([x,@cursor_y])
		end
	end

	def up(d)
		by=@cursor_y
		@cursor_y=@cursor_y-d
		(@cursor_y..by).each do |y|
			@points.push([@cursor_x,y])
		end
	end
	def down(d)
		by=@cursor_y
		@cursor_y=@cursor_y+d
		(by..@cursor_y).each do |y|
			@points.push([@cursor_x,y])
		end
	end
	def initialize
		super
		@cursor_x=0
		@cursor_y=0
	end


		
	def drawLine(x1,y1,x2,y2)
		`./line #{x1} #{y1} #{x2} #{y2}`.each_line do |l|
		/(\d+) (\d+) (\d+)/.match(l)
		@points.push([$1.to_i,$2.to_i,$3.to_i,$3.to_i,$3.to_i])
		end

	end
end
