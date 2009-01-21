require 'Drawable'

class Text < Drawable
	@@fontData=nil
	@scaleFactor
	def write(str)
		loadFontData if @@fontData.nil?
		cx=0
		cy=0
		str.each_byte do |b|
			f=@@fontData[b]
			x=cx
			y=cy
			f.each do |sl|
				sl.each_byte do |pixel|
					if(pixel == 49)
						@scaleFactor.times do |h|
							@scaleFactor.times do |v|
								@points.push([x+h,y+v])
							end
						end
					end
					x=x+@scaleFactor
				end
				y=y+@scaleFactor
				x=cx
			end
			cx=cx+8*@scaleFactor
		end
	end
	def loadFontData
		@@fontData=Array.new
		ctr=0
		arr=Array.new
		IO.foreach("font_8x8.c") do |line|
			next unless /^\s+0x[0-9a-fA-F]+, .. ([01]+) ..$/.match(line)
			ctr=ctr+1
			arr.push($1)
			if(ctr==8)
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
