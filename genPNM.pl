#!/usr/bin/perl

binmode STDOUT;

$WIDTH=500;
$HEIGHT=500;

print "P5\n";
print "$WIDTH $HEIGHT\n";
print "255\n";

for $row (0 .. ($HEIGHT-1)){
	for $col (0 .. ($WIDTH-1)){
		$image->[$row]->[$col]->{"RED"} = pack "C",255;
		$image->[$row]->[$col]->{"GREEN"} = pack "C",255;
		$image->[$row]->[$col]->{"BLUE"} = pack "C",255;
	}
}

$x=pack "C",255;
for (1..(500*500*3)){
	print $x;
}
