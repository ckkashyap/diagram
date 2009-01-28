
#define BLEND_COLOR(a, nc, c, cc) \
nc = (cc) + (((((c) - (cc)) * (a)) + ((((c) - (cc)) * (a)) >> 8) + 0x80) >> 8);

#define SWAP(x, y) (x ^= y ^= x ^= y)
void plot(int x,int y,int c,int t)
{
	int dr,dg,db,p,r,g,b;
	dr=c;
	r=127;
	BLEND_COLOR(t, dr, r, dr);

	dr=255-dr;
	printf("%d %d %d\n",x,y,dr);
}


static void line ( int x1, int y1, int x2, int y2, int col)
{
	/* keep them as 32bits */
	long x, y, inc;
	long dx, dy,tmp;

        /* TBB: use the clipping rectangle */
	dx = x2 - x1;
	dy = y2 - y1;

	/* Axis aligned lines */
	if (dx == 0) {
		return;
	} else if (dy == 0) {
		return;
	}

	if (dx == 0 && dy == 0) {
		return;
	}
	if (abs(dx) > abs(dy)) {
		if (dx < 0) {
			tmp = x1;
			x1 = x2;
			x2 = tmp;
			tmp = y1;
			y1 = y2;
			y2 = tmp;
			dx = x2 - x1;
			dy = y2 - y1;
		}
		x = x1 << 16;
		y = y1 << 16;
		inc = (dy * 65536) / dx;
		/* TBB: set the last pixel for consistency (<=) */
		while ((x >> 16) <= x2) {
			plot(x >> 16, y >> 16, col, (y >> 8) & 0xFF);
			plot( x >> 16, (y >> 16) + 1,col, (~y >> 8) & 0xFF);
			x += (1 << 16);
			y += inc;
		}
	} else {
		if (dy < 0) {
			tmp = x1;
			x1 = x2;
			x2 = tmp;
			tmp = y1;
			y1 = y2;
			y2 = tmp;
			dx = x2 - x1;
			dy = y2 - y1;
		}
		x = x1 << 16;
		y = y1 << 16;
		inc = (dx * 65536) / dy;
		/* TBB: set the last pixel for consistency (<=) */
		while ((y>>16) <= y2) {
			plot( x >> 16, y >> 16, col, (x >> 8) & 0xFF);
			plot( (x >> 16) + 1, (y >> 16),col, (~x >> 8) & 0xFF);
			x += inc;
			y += (1<<16);
		}
	}
}
#if 0
void line(int x0, int y0, int x1, int y1) {
	int x;
   int Dx = x1 - x0; 
   int Dy = y1 - y0;
   int steep = (abs(Dy) >= abs(Dx));
   if (steep) {
       SWAP(x0, y0);
       SWAP(x1, y1);
       // recompute Dx, Dy after swap
       Dx = x1 - x0;
       Dy = y1 - y0;
   }
   int xstep = 1;
   if (Dx < 0) {
       xstep = -1;
       Dx = -Dx;
   }
   int ystep = 1;
   if (Dy < 0) {
       ystep = -1;		
       Dy = -Dy; 
   }
   int TwoDy = 2*Dy; 
   int TwoDyTwoDx = TwoDy - 2*Dx; // 2*Dy - 2*Dx
   int E = TwoDy - Dx; //2*Dy - Dx
   int y = y0;
   int xDraw, yDraw;	
   for (x = x0; x != x1; x += xstep) {		
       if (steep) {			
           xDraw = y;
           yDraw = x;
       } else {			
           xDraw = x;
           yDraw = y;
       }
       // plot
       plot(xDraw, yDraw);
       // next
       if (E > 0) {
           E += TwoDyTwoDx; //E += 2*Dy - 2*Dx;
           y = y + ystep;
       } else {
           E += TwoDy; //E += 2*Dy;
       }
   }
}
#endif

int main(int argc, char* argv[]){
	int x0,y0,x1,y1;
	x0=atoi(argv[1]);
	y0=atoi(argv[2]);
	x1=atoi(argv[3]);
	y1=atoi(argv[4]);
	line(x0,y0,x1,y1,255);
}
