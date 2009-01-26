require 'Drawable'

class Text < Drawable
	@@fontData=nil
	@scaleFactor
	def write(str)
		loadFontData if @@fontData.nil?
		cx=0
		cy=0
		max_x=0
		str.each_byte do |b|
			if b==32
				cx=cx+16
				next
			end
			f=@@fontData[b]
			x=cx
			y=cy
			f.each do |sl|
				sl.each_byte do |pixel|
					if(pixel != 32)
						r=@r
						g=@g
						b=@b
						if (pixel == 43) # == '+' that is
							r=r+((255-r)/2)
							g=g+((255-g)/2)
							b=b+((255-b)/2)
						end
						max_x=x if x > max_x
						@scaleFactor.times do |h|
							@scaleFactor.times do |v|
								@points.push([x+h,y+v,r,g,b])
							end
						end
					end
					x=x+@scaleFactor
				end
				y=y+@scaleFactor
				x=cx
			end
			cx=cx+16*@scaleFactor
			#cx=max_x+1
		end
	end
	def loadFontData
		@@fontData=Array.new
		ctr=0
		arr=Array.new
		IO.foreach("fonts") do |line|
			ctr=ctr+1
			arr.push(line.chomp!)
			if(ctr==20)
				ctr=0
				@@fontData.push(arr)
				arr=Array.new
			end
		end
	end
	def initialize
		super
		@scaleFactor=1
	end
end
