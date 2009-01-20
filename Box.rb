require 'Line'


#
# type 0 -|
# type 1 |-
# type 2 ``|``
# type 3 _|_
#

class Box < Line
	def initialize(w,h,type=0)
		super()
		case type
			when 0
				down(h/2)
				right(w)
				up(h)
				left(w)
				down(h/2)
			when 1
				puts "DINGO"
		end
	end
end

