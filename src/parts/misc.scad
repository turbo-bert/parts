// file parts/misc.scad

module koppl(l=27, d=7.5) {
    d2=d*3/2;
    h=3;

    difference() {
        union() {
            translate([0,0,h/2]) sportplatz(l=l+d+d, d=d2, h=h);
        }
        translate([+l/2,0,0]) cylinder(d=d, h=100, center=true, $fn=50);
        translate([-l/2,0,0]) cylinder(d=d, h=100, center=true, $fn=50);
        LT(-1,0.1,0) translate([0,0,h-0.5]) linear_extrude(10) text(str("d=",d), size=4);
        LT(-1.3,-0.5,0) translate([0,0,h-0.5]) linear_extrude(10) text(str("l=", l, " h=", h), size=4);
    }

}

module spaxq4(a=10, h=10) {
    aa=a/2;
    translate([+aa,+aa,h/2]) cylinder(d=1.8, h=h, center=true, $fn=50); // cyz
    translate([-aa,+aa,h/2]) cylinder(d=1.8, h=h, center=true, $fn=50); // cyz
    translate([+aa,-aa,h/2]) cylinder(d=1.8, h=h, center=true, $fn=50); // cyz
    translate([-aa,-aa,h/2]) cylinder(d=1.8, h=h, center=true, $fn=50); // cyz
}

module spaxq4s(a=10, h=0) {
    aa=a/2;
    translate([+aa,+aa,h-5.5]) cut_spax2_deep();
    translate([-aa,+aa,h-5.5]) cut_spax2_deep();
    translate([+aa,-aa,h-5.5]) cut_spax2_deep();
    translate([-aa,-aa,h-5.5]) cut_spax2_deep();
}

module anno(lx, ly, txt) {
    LT(lx,ly,0) translate([0,0,0]) linear_extrude(2) text(txt, size=12);
}


module uring2020(h=10) {
    difference(){
        union() {
            translate([0,0,0]) cube([40,h,40], center=true);
        }
        translate([0,0,-2]) XL()XL()translate([-15,0,0]) cut_spax2_deep();
        translate([0,0,-2]) XL()XL()translate([+15,0,0]) cut_spax2_deep();
        translate([0,-10,10-13.5]) cube([20.5,50,20], center=true);
        translate([0,0,11]) cube([60,60,22], center=true);
        translate([7,0,0]) cylinder(d=1.8, h=100, center=true, $fn=50); // cyz;        
        translate([-7,0,0]) cylinder(d=1.8, h=100, center=true, $fn=50); // cyz;        
        translate([0,0,0]) cylinder(d=1.8, h=100, center=true, $fn=50); // cyz;        
}

}


module flachzylinder(d=7, l=80, a=1, n=1) {
    union() {
        for (i=[0:n-1]) {
            translate([0,i*d*1.5,0]) difference() {
                translate([0,0,d/2-a]) rotate([0,90,0]) cylinder(d=d, h=l, center=true, $fn=150);
                translate([0,0,-d/2]) cube([l+l,d,d], center=true);
            }
        }
    }
}

module servo_carve(h=2, w=8, helpers=false, osd=0, osb=7.2, osc=0, d=3) {
    union() {

    translate([-5+0.5,   4.5+1,0]) cylinder(d=d, h=100, center=true, $fn=40);
    translate([-5+0.5,   4.5+11,0]) cylinder(d=d, h=100, center=true, $fn=40);
    translate([+5+40-0.5,4.5+1,0]) cylinder(d=d, h=100, center=true, $fn=40);
    translate([+5+40-0.5,4.5+11,0]) cylinder(d=d, h=100, center=true, $fn=40);
    translate([-0.5,0,-60]) cube([41,21,120], center=false);
    }
}

module mantel_z(d, w, h) {
    difference() {

    translate([0,0,h/2]) cylinder(d=d, h=h, center=true, $fn=450); // cyz
    translate([0,0,h/2]) cylinder(d=d-w-w, h=h*3, center=true, $fn=450); // cyz
    }
}

module dode(d1=170, h1=4) {
    difference(){
    union() {
    
    translate([0,0,2.5]) cylinder(d=10, h=5, center=true, $fn=50); // cyz
    translate([0,0,h1/2]) cylinder(d=d1, h=h1, center=true, $fn=250); // cyz
    mantel_z(148, 8, 12);
    }
    cut_spax2_deep();
    }
}


module screw_vsign_2line(w, line1, line2) {
    h=18;
    difference(){
        union() {
            elf13_brick(w,1,2,do78=1);
            translate([(w*8-4)/2+2,-1,h/2]) cube([w*8-4, 3, h], center=true);
        }
    
        LT(w/2,0.5,0) elf_vert_bore_grid(w,1,0);
        translate([3,0,10]) XL() LT(0,0,0) translate([0,0,0]) linear_extrude(10) text(line1, size=7);
        translate([3,0,2.5]) XL() LT(0,0,0) translate([0,0,0]) linear_extrude(10) text(line2, size=7);
    }
}

module vs2(w, line1, line2) {
    h=18;
    difference(){
        union() {
            elf13_brick(w,1,2,do78=1);
            translate([(w*8-4)/2+2,-1,h/2]) cube([w*8-4, 3, h], center=true);
        }
    
        LT(w/2,0.5,0) elf_vert_bore_grid(w,1,0);
        translate([3,0,10]) XL() LT(0,0,0) translate([0,0,0]) linear_extrude(10) text(line1, size=7);
        translate([3,0,2.5]) XL() LT(0,0,0) translate([0,0,0]) linear_extrude(10) text(line2, size=7);
    }
}

module coint_faller_rail(W=15, L=8, lb="") {
    l=70;
    w1=5;
    w2=40;
    w3=w2+w1;
    h1=15;
    h2=5;
    v=2.2;

    difference(){
        union() {
            translate([-w1,0,0]) cube([w1, l, h1], center=false);
            translate([-w1+w2,0,0]) cube([w1, l, h1], center=false);
            translate([-w1,0,-h2]) cube([w3, l, h2], center=false);
        }
        translate([30,10,-6]) cut_spax2_deep();
        translate([30,60,-6]) cut_spax2_deep();
        translate([v,l/2-L/2,-50+0.01]) cube([W-v, L, 50], center=false);
        LT(3.5,6.8,-0.2)  ZR() translate([0,0,0]) linear_extrude(10) text(lb, size=5);
    translate([-10,0,-10]) cube([100,0.15,100], center=false);
    translate([-10,l-0.15,-10]) cube([100,0.15,100], center=false);


    translate([-2.5,   5,10]) cylinder(d=1.8, h=12, center=true, $fn=150); // cyz
    translate([-2.5+w2,5,10]) cylinder(d=1.8, h=12, center=true, $fn=150); // cyz
    translate([-2.5,   15,10]) cylinder(d=1.8, h=12, center=true, $fn=150); // cyz
    translate([-2.5+w2,15,10]) cylinder(d=1.8, h=12, center=true, $fn=150); // cyz

    translate([-2.5,   5 +50,10]) cylinder(d=1.8, h=12, center=true, $fn=150); // cyz
    translate([-2.5+w2,5 +50,10]) cylinder(d=1.8, h=12, center=true, $fn=150); // cyz
    translate([-2.5,   15+50,10]) cylinder(d=1.8, h=12, center=true, $fn=150); // cyz
    translate([-2.5+w2,15+50,10]) cylinder(d=1.8, h=12, center=true, $fn=150); // cyz

    translate([-2.5, 6-0.1, -2.5]) XL() cylinder(d=1.8, h=12, center=true, $fn=150); // cyz
    translate([-2.5+w2, 6-0.1, -2.5]) XL() cylinder(d=1.8, h=12, center=true, $fn=150); // cyz

    translate([-2.5, 6-0.1+50+8.2, -2.5]) XL() cylinder(d=1.8, h=12, center=true, $fn=150); // cyz
    translate([-2.5+w2, 6-0.1+50+8.2, -2.5]) XL() cylinder(d=1.8, h=12, center=true, $fn=150); // cyz
    }

}

module hring(d=7) {
    difference(){
    union() {
    
    translate([0,0,0]) cube([70,12,6], center=true);
    
    translate([+32,0,10-6/2]) cube([7,12,20], center=true);
    translate([-32,0,10-6/2]) cube([7,12,20], center=true);
    }
    translate([-10,0,0]) cylinder(h=80, d=1.8, center=true, $fn=50); // cyz
    translate([+10,0,0]) cylinder(h=80, d=1.8, center=true, $fn=50); // cyz
    translate([+20,0,0]) cylinder(h=80, d=1.8, center=true, $fn=50); // cyz
    translate([-20,0,0]) cylinder(h=80, d=1.8, center=true, $fn=50); // cyz
    translate([0,+3.5,0]) cylinder(h=80, d=1.8, center=true, $fn=50); // cyz
    translate([0,-3.5,0]) cylinder(h=80, d=1.8, center=true, $fn=50); // cyz
    }
}

module senkloch(d=6, d2=10) {
    union() {
        translate([0,0,-10]) cylinder(d=d, h=20, center=true, $fn=150); // cyz
        translate([0,0,1]) cylinder(d1=d, d2=d2, h=2, center=true, $fn=150); // cyz
        translate([0,0,10+2]) cylinder(d=d2, h=20, center=true, $fn=150); // cyz
    }
}

module circle_measure(d=20, to_y=50) {
    h=5;
    w=5;


    translate([0,0,h/2])
    difference() {
        union() {

            translate([0,to_y,0]) cylinder(d=d+w+w, h=h, center=true, $fn=150);
            translate([0,to_y/2,0]) cube([12,to_y,h], center=true);
        }
        translate([5,5,1.5]) ZL() linear_extrude(h) text(str(d), size=10);
        translate([0,to_y,0]) cylinder(d=d, h=h*2, center=true, $fn=150);
        translate([0-80/2,to_y+80/2,0]) cube([80,80,4*h], center=true);
    }
}


module keg90() {
    XL() XL() translate([0,0,0]) cylinder(d1=20, d2=0, h=10, center=true, $fn=150); // cyz
}


module rfr(d=5, xc=20,yc=50) {


    translate([0,0,0]) cube([xc, yc, d], center=true);

    translate([+xc/2,+yc/2,0]) sphere(d=d, $fn=150);
    translate([-xc/2,+yc/2,0]) sphere(d=d, $fn=150);
    translate([+xc/2,-yc/2,0]) sphere(d=d, $fn=150);
    translate([-xc/2,-yc/2,0]) sphere(d=d, $fn=150);
    
    translate([0,-yc/2,0]) rotate([0,90,0]) cylinder(d=d, h=xc, center=true, $fn=150);
    translate([0,+yc/2,0]) rotate([0,90,0]) cylinder(d=d, h=xc, center=true, $fn=150);

    translate([-xc/2,0,0]) rotate([90,0,0]) cylinder(d=d, h=yc, center=true, $fn=150);
    translate([+xc/2,0,0]) rotate([90,0,0]) cylinder(d=d, h=yc, center=true, $fn=150);

}

module dome(a=10, h=10) {
    union() {

        intersection() {

            difference() {
                sphere(d=sqrt(a*a*2), $fn=200);
                translate([0,0,-a]) cube([2*a,2*a,2*a], center=true);
            }

            translate([0,0,0]) cube([a,a,a*4], center=true);
        }

        translate([0,0,-h/2]) cube([a,a,h], center=true);

    }
}

module radmittelzahnradachse() {
    difference(){
        union() {
            translate([0,0,-40+10]) gear(t=28, h=40, m=1.5);
        }
        translate([0,0,0]) cylinder(d=4.1, h=100, center=true, $fn=150); // cyz

        rotate([0,0,0*45]) translate([15,0,-2]) translate([0,0,0]) cylinder(d=1.88, h=100, center=true, $fn=50); // cyz
        rotate([0,0,1*45]) translate([15,0,-2]) translate([0,0,0]) cylinder(d=1.88, h=100, center=true, $fn=50); // cyz
        rotate([0,0,2*45]) translate([15,0,-2]) translate([0,0,0]) cylinder(d=1.88, h=100, center=true, $fn=50); // cyz
        rotate([0,0,3*45]) translate([15,0,-2]) translate([0,0,0]) cylinder(d=1.88, h=100, center=true, $fn=50); // cyz
        rotate([0,0,4*45]) translate([15,0,-2]) translate([0,0,0]) cylinder(d=1.88, h=100, center=true, $fn=50); // cyz
        rotate([0,0,5*45]) translate([15,0,-2]) translate([0,0,0]) cylinder(d=1.88, h=100, center=true, $fn=50); // cyz
        rotate([0,0,6*45]) translate([15,0,-2]) translate([0,0,0]) cylinder(d=1.88, h=100, center=true, $fn=50); // cyz
        rotate([0,0,7*45]) translate([15,0,-2]) translate([0,0,0]) cylinder(d=1.88, h=100, center=true, $fn=50); // cyz
    }
    
}


module cross_of_rods(d=4.1,l=100) {
    union() {

        translate([0,0,0]) rotate([0,90,0]) cylinder(d=d, h=l, center=true, $fn=50);
        translate([0,0,0]) rotate([90,0,0]) cylinder(d=d, h=l, center=true, $fn=50);
    }

}

module mod8connector() {
    difference(){
        union() {
            elf_brick(2,4,1,do78=1,top_nop=0);
        }
        LT(0.5,0.5  ,0.3) cut_spax2_deep();
        LT(0.5,0.5+1,0.3) cut_spax2_deep();
        LT(0.5,0.5+2,0.3) cut_spax2_deep();
        LT(0.5,0.5+3,0.3) cut_spax2_deep();

        LT(0.5+1,0.5  ,0.3) cut_spax2_deep();
        LT(0.5+1,0.5+1,0.3) cut_spax2_deep();
        LT(0.5+1,0.5+2,0.3) cut_spax2_deep();
        LT(0.5+1,0.5+3,0.3) cut_spax2_deep();
        
        LT(1,1,1) cut_spax2_deep();
        LT(1,2,1) cut_spax2_deep();
        LT(1,3,1) cut_spax2_deep();
    }

}


module mod_8_cable_fine(n=4, o=2, h=30) {
    difference() {

        union() {
            elf13_brick(n,2,1,do78=1);
            LT(1,0,0.3332) elf_brick(n-2,2,h/9.6,do78=1,top_nop=0,bottom_nop=0);
        }

        c=1.3;
        f=2.5;

        translate([0,0,0]) LT(n/2) translate([0,0,h/2+8]) cube([c,100,h], center=true);
        for (i=[0:o]) {
            translate([-i*f,0,0]) LT(n/2) translate([0,0,h/2+8]) cube([c,100,h], center=true);
            translate([+i*f,0,0]) LT(n/2) translate([0,0,h/2+8]) cube([c,100,h], center=true);
        }
    //translate([0,0,0]) LT(n/2) translate([0,0,h/2+8]) cube([c,100,h], center=true);
    //translate([-1*f,0,0]) LT(n/2) translate([0,0,h/2+8]) cube([c,100,h], center=true);
    //translate([+1*f,0,0]) LT(n/2) translate([0,0,h/2+8]) cube([c,100,h], center=true);
    //translate([-2*f,0,0]) LT(n/2) translate([0,0,h/2+8]) cube([c,100,h], center=true);
    //translate([+2*f,0,0]) LT(n/2) translate([0,0,h/2+8]) cube([c,100,h], center=true);

        LT(0.5,1) translate([0,0,-6]) elf_vert_bore_grid(1,2,0);
        LT(0.5+n-1,1) translate([0,0,-6]) elf_vert_bore_grid(1,2,0);
        LT(1,1) cut_spax2_deep();
        LT(n-1,1) cut_spax2_deep();
    }
}

module halfcy(d=10, h=25) {
    difference(){
        union() {
    translate([0,0,0]) cylinder(d=d, h=h, center=false, $fn=150); // cyz
}

translate([-d,0,-h]) cube([2*d,2*d,h*3], center=false);
}
}


module elf_vert_bore() {
    LT(0.5,0.5,0.8) translate([0,0,0]) cylinder(d=1.9, h=10, center=true, $fn=50); // cyz
}

module elf_vert_bore_grid(w=10,d=10,h=0) {
    raster_nx=w; raster_ny=d; raster_dx=8; raster_dy=8; for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) translate([raster_dx*raster_x, raster_dy*raster_y, 0])
    LT(-w/2, -d/2, h) elf_vert_bore();
}

module bldc16_bore(D=3.09) {
    a=16/2;
    h=5;
    d=30;
    union() {
        translate([-a,0,h/2]) cylinder(d=D, h=50, center=true, $fn=50); // cyz
        translate([+a,0,h/2]) cylinder(d=D, h=50, center=true, $fn=50); // cyz
        translate([0,-a,h/2]) cylinder(d=D, h=50, center=true, $fn=50); // cyz
        translate([0,+a,h/2]) cylinder(d=D, h=50, center=true, $fn=50); // cyz
    }
}


module bldc_pillars() {
    a=16.5;
    h=5;
    d=30;
    ZL45() difference() {
        union() {
            translate([-a,0,h/2]) cylinder(d=8, h=h, center=true, $fn=50); // cyz
            translate([+a,0,h/2]) cylinder(d=8, h=h, center=true, $fn=50); // cyz
            translate([0,-a,h/2]) cylinder(d=8, h=h, center=true, $fn=50); // cyz
            translate([0,+a,h/2]) cylinder(d=8, h=h, center=true, $fn=50); // cyz
            //difference() {
            //    translate([0,0,0]) cylinder(d=45, h=1.5, center=true, $fn=50); // cyz
            //    translate([0,0,0]) cylinder(d=43-20, h=2, center=true, $fn=50); // cyz
            //}
        }
        //translate([9.5,9.5,0]) rotate([0,0,-45]) translate([-5,0,-5]) linear_extrude(10) text("33", 7);
        translate([-a,0,h/2]) cylinder(d=3.1, h=50, center=true, $fn=50); // cyz
        translate([+a,0,h/2]) cylinder(d=3.1, h=50, center=true, $fn=50); // cyz
        translate([0,-a,h/2]) cylinder(d=3.1, h=50, center=true, $fn=50); // cyz
        translate([0,+a,h/2]) cylinder(d=3.1, h=50, center=true, $fn=50); // cyz
    }

}

module bldc_pillar_bores() {
    a=16.5;
    h=5;
    d=30;
    ZL45()
    union() {
        translate([-a,0,h/2]) cylinder(d=3.1, h=50, center=true, $fn=50); // cyz
        translate([+a,0,h/2]) cylinder(d=3.1, h=50, center=true, $fn=50); // cyz
        translate([0,-a,h/2]) cylinder(d=3.1, h=50, center=true, $fn=50); // cyz
        translate([0,+a,h/2]) cylinder(d=3.1, h=50, center=true, $fn=50); // cyz
    }
}


module nupsi_spax() {
    cl = 15.705380;
    d=7.5;
    d2=12;
    translate([0,0,0]) difference() {
        union() {

            translate([+cl/2,0,6/2]) cylinder(d=d-1, h=6, center=true, $fn=50);
            //translate([-cl/2,0,6/2]) cylinder(d=d-1, h=6, center=true, $fn=50);

            translate([+cl/2,0,2/2]) cylinder(d=d2, h=2, center=true, $fn=50);
            //translate([-cl/2,0,2/2]) cylinder(d=d2, h=2, center=true, $fn=50);
        }
        translate([+cl/2,0,0]) rotate([180,0,0]) cut_spax2();
            //translate([-cl/2,0,0]) rotate([180,0,0]) cut_spax2();
    }

}

module nupsi_m3() {
    cl = 15.705380;
    d=7.5;
    d2=12;
    translate([0,0,0]) difference() {
        union() {

            translate([+cl/2,0,6/2]) cylinder(d=d-1, h=6, center=true, $fn=50);
            //translate([-cl/2,0,6/2]) cylinder(d=d-1, h=6, center=true, $fn=50);

            translate([+cl/2,0,2/2]) cylinder(d=d2, h=2, center=true, $fn=50);
            //translate([-cl/2,0,2/2]) cylinder(d=d2, h=2, center=true, $fn=50);
        }
            translate([+cl/2,0,0]) rotate([180,0,0]) translate([0,0,0]) cylinder(d=3.5, h=100, center=true, $fn=50); // cyz
            //translate([-cl/2,0,0]) rotate([180,0,0]) translate([0,0,0]) cylinder(d=3.5, h=100, center=true, $fn=50); // cyz
        }

    }


    module nema17_quad(h=10) {
        translate([0,0,h/2]) rotate([0,0,0]) union() {
            translate([+31/2,+31/2,0]) cylinder(d=3.5, center=true, h=h, $fn=20);
            translate([-31/2,+31/2,0]) cylinder(d=3.5, center=true, h=h, $fn=20);
            translate([+31/2,-31/2,0]) cylinder(d=3.5, center=true, h=h, $fn=20);
            translate([-31/2,-31/2,0]) cylinder(d=3.5, center=true, h=h, $fn=20);
            //translate([0,0,0]) cylinder(d=28, center=true, h=100, $fn=200); // bohrung rund motor 28mm
        }

    }

    module nemasnap(do_bore=1) {
        x=3.6;
        h=30;
        union() {
            difference() {
            translate([0,0,0]) cylinder(d=5.18, h=h, center=true, $fn=150); // cyz
            translate([x+0.18,0,0]) cube([x,x,h+2], center=true);
        }
        if (do_bore==1) {
            translate([15,0,0]) rotate([0,90,0]) cylinder(d=2.7, h=30, center=true, $fn=50);
        }
    }

}

module nemasnap_spax(do_bore=1) {
    x=3.6;
    h=30;
    union() {
        difference() {
            translate([0,0,0]) cylinder(d=5.18, h=h, center=true, $fn=150); // cyz
            translate([x+0.18,0,0]) cube([x,x,h+2], center=true);
        }
        if (do_bore==1) {
            translate([15,0,0]) rotate([0,90,0]) cylinder(d=1.8, h=30, center=true, $fn=50);
        }
    }

}

module ddbore(h=10) {
    dd=33;
    union() {

translate([+dd/2,0,0]) cylinder(d=1.7, h=h, center=true, $fn=50); // cyz
translate([-dd/2,0,0]) cylinder(d=1.7, h=h, center=true, $fn=50); // cyz
translate([0,+dd/2,0]) cylinder(d=1.7, h=h, center=true, $fn=50); // cyz
translate([0,-dd/2,0]) cylinder(d=1.7, h=h, center=true, $fn=50); // cyz
}
}

module schelle4(h=12) {

    odi=8;
    idi=4.2;
    translate([0,0,h/2]) difference() {

        translate([0,0,0]) cylinder(d=odi, h=h, center=true, $fn=150);
        translate([0,0,0]) cylinder(d=idi, h=h+1, center=true, $fn=150);
        translate([5,0,0]) cube([10,3.45,100], center=true);
        translate([-5,0,0]) cube([3,10,100], center=true);
    }

}

module vax_leiste(n=10, d=4.18) {
    LT(0,2,1) XL()XL()difference() {
        elf_brick(n,2,1,top_nop=0, do78=1);
        for (i=[0:n]) {
            LT(i,1) translate([0,0,0]) cylinder(d=d, h=20, center=true, $fn=50);        

        }
    }
}

module my_gearbox(t=20) {
    difference() {
        gear(m=1.5,h=10,t=t);
        translate([0,0,0]) cylinder(d=4.15, h=30, center=true, $fn=50);
        LT(-0.5,0.5,0.9) linear_extrude(3) text("4", size=8, $fn=100);
        LT(-0.7,-1.35,0.9) linear_extrude(3) text(str(t), size=8, $fn=100);
    }
}

module my_gearbox6(t=20, h=10) {
    difference() {
        gear(m=1.5,h=h,t=t);
        translate([0,0,0]) cylinder(d=6.1, h=30, center=true, $fn=50);
        LT(-0.5,0.7,0.9) linear_extrude(3) text("6", size=8, $fn=100);
        LT(-0.7,-1.55,0.9) linear_extrude(3) text(str(t), size=8, $fn=100);
    }
}


//axle 6mm flat
module ax6f() {
    difference() {
        translate([0,0,0]) cylinder(d=6.15, h=50, center=true, $fn=100);
        translate([-5-3+0.5,0,0]) cube([10,10,60], center=true);
    }
}

//axle 5mm flat
module ax5f() {
    difference() {
        translate([0,0,0]) cylinder(d=5.2, h=50, center=true, $fn=100);
        translate([-5-2.5+0.55,0,0]) cube([10,10,60], center=true);
    }
}

module fatpipe(oD=30,iD=10,h=100,support4=0) {
    difference(){

        translate([0,0,0]) cylinder(d=oD, h=h, center=true, $fn=250);
        translate([0,0,0]) cylinder(d=iD, h=h+1, center=true, $fn=250);

        if (support4 > 0) {
            translate([0,0,0]) cube([support4,100,100], center=true);
            ZL() translate([0,0,0]) cube([support4,100,100], center=true);
        }

    }
}


module cpcube(x, y, z, px=0, py=0, pz=0, only_top=0) {
    intersection() {

        difference() {
            translate([0,0,0]) cube([x,y,z], center=true);
            if (px > 0) {
                translate([0,-y/2,+z/2]) rotate([45,0,0]) cube([x+1,px, px], center=true);
                translate([0,+y/2,+z/2]) rotate([45,0,0]) cube([x+1,px, px], center=true);
                translate([0,-y/2,-z/2]) rotate([45,0,0]) cube([x+1,px, px], center=true);
                translate([0,+y/2,-z/2]) rotate([45,0,0]) cube([x+1,px, px], center=true);
            }
            if (py > 0) {
                translate([+x/2,0,-z/2]) rotate([0,45,0]) cube([py,y+1,py], center=true);
                translate([-x/2,0,-z/2]) rotate([0,45,0]) cube([py,y+1,py], center=true);
                translate([+x/2,0,+z/2]) rotate([0,45,0]) cube([py,y+1,py], center=true);
                translate([-x/2,0,+z/2]) rotate([0,45,0]) cube([py,y+1,py], center=true);
            }
            if (py > 0) {
                translate([+x/2,+y/2,0]) rotate([0,0,45]) cube([pz,pz,z+1], center=true);
                translate([+x/2,-y/2,0]) rotate([0,0,45]) cube([pz,pz,z+1], center=true);
                translate([-x/2,+y/2,0]) rotate([0,0,45]) cube([pz,pz,z+1], center=true);
                translate([-x/2,-y/2,0]) rotate([0,0,45]) cube([pz,pz,z+1], center=true);
            }
        }
        if (only_top == 1) {
            translate([0,0,z/2]) cube([x+1,y+1,z], center=true);
        }
    }
}

module oha_huti(h=18) {
    difference() {

        translate([0,0,10]) cylinder(d=120, h=h, center=true, $fn=450);
        translate([0,0,5]) cylinder(d1=120, d2=30, h=h+0.01, center=true, $fn=450);
    }
}

module oha(screw=false) {

    difference() {

        gear(m=5, t=12, h=7.5);
        translate([0,0,-3]) oha_huti();
        translate([0,0,0]) cylinder(d=4.3, h=100, center=true, $fn=50);
        rotate([0,0,45+0*90]) translate([0,15,0]) cylinder(d=1.8, h=100, center=true, $fn=50);
        rotate([0,0,45+1*90]) translate([0,15,0]) cylinder(d=1.8, h=100, center=true, $fn=50);
        rotate([0,0,45+2*90]) translate([0,15,0]) cylinder(d=1.8, h=100, center=true, $fn=50);
        rotate([0,0,45+3*90]) translate([0,15,0]) cylinder(d=1.8, h=100, center=true, $fn=50);
        rotate([0,0,45+0*90]) translate([0,7.5,0]) cylinder(d=1.8, h=100, center=true, $fn=50);
        rotate([0,0,45+1*90]) translate([0,7.5,0]) cylinder(d=1.8, h=100, center=true, $fn=50);
        rotate([0,0,45+2*90]) translate([0,7.5,0]) cylinder(d=1.8, h=100, center=true, $fn=50);
        rotate([0,0,45+3*90]) translate([0,7.5,0]) cylinder(d=1.8, h=100, center=true, $fn=50);

        if (screw==true) {
            rotate([0,0,45+0*90]) translate([0,15,0]) cut_spax2_deep(4);
            rotate([0,0,45+1*90]) translate([0,15,0]) cut_spax2_deep(4);
            rotate([0,0,45+2*90]) translate([0,15,0]) cut_spax2_deep(4);
            rotate([0,0,45+3*90]) translate([0,15,0]) cut_spax2_deep(4);

        }

        rotate([0,0,0*90]) translate([0,15,0])sportplatz(h=50, l=15, d=8);
        rotate([0,0,1*90]) translate([0,15,0])sportplatz(h=50, l=15, d=8);
        rotate([0,0,2*90]) translate([0,15,0])sportplatz(h=50, l=15, d=8);
        rotate([0,0,3*90]) translate([0,15,0])sportplatz(h=50, l=15, d=8);
    //translate([0,0,0]) cube([20.2,20.2,100], center=true);
    //a=12;
    //rotate([0,0,45])union() {
//
//    //translate([+a,+a,0]) cylinder(d=6, h=100, center=true, $fn=50);
//    //translate([-a,-a,0]) cylinder(d=6, h=100, center=true, $fn=50);
//    //translate([+a,-a,0]) cylinder(d=6, h=100, center=true, $fn=50);
//    //translate([-a,+a,0]) cylinder(d=6, h=100, center=true, $fn=50);
    //}
    }
}



module abec_sattle() {
    h=16;
    cop=1;
    translate([0,0,h]) difference() {
        translate([0,0,-h/2]) cube([10,32,h], center=true);
        translate([0,0,cop]) rotate([0,90,0]) cylinder(d=22.2, h=7.2, center=true, $fn=150);
        translate([0,0,cop]) rotate([0,90,0]) cylinder(d=22.2-3, h=3*7.2, center=true, $fn=150);
    }

}

module cut_alu2020_twin(d=4.4) {
    oc=80;
    translate([+80,0,0]) cube([20.2, 20.2, 1000], center=true);
    translate([-80,0,0]) cube([20.2, 20.2, 1000], center=true);
    translate([+(10+70),0,0]) rotate([0,90,0]) cylinder(d=d, h=50, center=true, $fn=50);
    translate([-(10+70),0,0]) rotate([0,90,0]) cylinder(d=d, h=50, center=true, $fn=50);
    translate([+80,0,0]) rotate([90,0,0]) cylinder(d=d, h=50, center=true, $fn=50);
    translate([-80,0,0]) rotate([90,0,0]) cylinder(d=d, h=50, center=true, $fn=50);
}

module cut_alu2020_twinpillar() {
    oc=80;
    translate([+80,0,0]) cube([20.2, 20.2, 1000], center=true);
    translate([-80,0,0]) cube([20.2, 20.2, 1000], center=true);
    translate([+(10+80),0,0]) rotate([0,90,0]) cylinder(d=4.4, h=20, center=true, $fn=50);
    translate([-(10+80),0,0]) rotate([0,90,0]) cylinder(d=4.4, h=20, center=true, $fn=50);
}

module spray_plate() {
    h=15;
    intersection() {

        translate([0,0,0]) cube([32-1,15*8,20], center=true);
        difference() {

            translate([-2*8,-h/2*8,0]) el13_area(4,h);
            translate([0,0,2.5+1]) cube([33,88,5], center=true);

        }
    }
}

module dig0() {
    dig(h2=0);
}
module dig1() {
    dig(h1=0, h2=0, h3=0, lu=0, lo=0);
}
module dig2() {
    dig(lo=0, ru=0);
}
module dig3() {
    dig(lo=0, lu=0);
}
module dig4() {
    dig(h3=0, h1=0, lu=0);
}
module dig5() {
    dig(ro=0, lu=0);
}
module dig6() {
    dig(ro=0);
}
module dig7() {
    dig(h1=0, h2=0, lu=0);
}
module dig8() {
    dig();
}
module dig9() {
    dig(lu=0);
}
module digcomma() {
    dig(h1=0, h2=0, h3=0, lu=0, ru=0, lo=0, ro=0, ddot=1);
}
module digslash() {
    dig(h1=0, h2=0, h3=0, lu=0, ru=0, lo=0, ro=0, ddot=2);
}
module digbackslash() {
    dig(h1=0, h2=0, h3=0, lu=0, ru=0, lo=0, ro=0, ddot=3);
}
module digdash() {
    dig(h1=0, h2=1, h3=0, lu=0, ru=0, lo=0, ro=0, ddot=0);
}
module digplus() {
    dig(h1=0, h2=1, h3=0, lu=0, ru=0, lo=0, ro=0, ddot=4);
}
module digdot() {
    dig(h1=0, h2=0, h3=0, lu=0, ru=0, lo=0, ro=0, ddot=5);
    
}

module dig(a1=8, a2=12, w=2, h=100, h1=1,h2=1,h3=1,lu=1,ru=1,lo=1,ro=1,ddot=0) {
    translate([0,-a2-w*4,0]) cube([a1+w+w+w,w*2/3,h], center=true);
    if (ddot == 1) { // comma
        translate([0,-a2,0]) cube([w,10,h], center=true);
    }
    if (ddot == 2) { // slash
        translate([0,0,0]) rotate([0,0,-25]) cube([w,2*a2,h], center=true);
    }
    if (ddot == 3) { // backslash
        translate([0,0,0]) rotate([0,0,25]) cube([w,2*a2,h], center=true);
    }
    if (ddot == 4) { // vertical dash
        rotate([0,0,90]) translate([0,0,0]) cube([a1,w,h], center=true);
    }
    if (ddot == 5) { // vertical dash
        translate([0,-a2,0]) translate([0,0,0]) cylinder(d=w*2, h=h, center=true, $fn=50);
    }
    if (h1 == 1) {
        translate([0,-a2,0]) cube([a1,w,h], center=true);
    }
    if (h2 == 1) {
        translate([0,0,0]) cube([a1,w,h], center=true);
    }
    if (h3 == 1) {
        translate([0,+a2,0]) cube([a1,w,h], center=true);
    }
    if (lu == 1) {
        translate([-a2/2,-a2/2,0]) cube([w,a1,h], center=true);
    }
    if (ru == 1) {
        translate([+a2/2,-a2/2,0]) cube([w,a1,h], center=true);
    }
    if (lo == 1) {
        translate([-a2/2,+a2/2,0]) cube([w,a1,h], center=true);
    }
    if (ro == 1) {
        translate([+a2/2,+a2/2,0]) cube([w,a1,h], center=true);
    }
}


module cone_pinY(h1=6, h2=5, d1=3.5, d2=7) {
    translate([0,h1,0]) union() {
        translate([0,-h1/2,0]) rotate([90,0,0]) cylinder(d1=d2, d2=d1, h=h1, center=true, $fn=50);
        translate([0,h2/2,0]) rotate([90,0,0]) cylinder(d=d2, h=h2, center=true, $fn=50);
    }

}

module nema17_clamp(h=5, d=0, cb3=0, cb3vo=0) {
    difference() {
        intersection() {
            if (d > 0) {
                translate([0,0,0]) cylinder(d=d, h=h+1, center=true, $fn=150);
            }        
            union() {
                translate([5.1,5.1,0]) rotate([0,0,45]) translate([0,0,0]) cube([10,10,h], center=true);
                difference() {
                    translate([0,0,0]) cube([30,30,h], center=true);
                    translate([0,0,0]) cylinder(d=5.5, h=h+1, center=true, $fn=50);
                }
            }
        }
        if (cb3 > 0) {
            translate([0,0,cb3vo]) rotate([0,0,45]) translate([0,0,0]) rotate([0,90,0]) cylinder(d=2.6, h=180, center=false, $fn=50);
        }
    }
}

module alu2020_and_bore(l=200) {
    a=20.5;
    w=4;
    difference() {

        translate([0,0,0]) cube([a+w+w,l,a+w+w], center=true);
        translate([0,0,0]) cube([a,l+1,a], center=true);
    }
}

module lgb_profile_light(l=10) {
    //3.2, 1.7, 16.5
    h=16.5;
    h2=3;
    translate([0,0,h-h2/2]) cube([2.7,l,h2], center=true);
    translate([0,0,h/2]) cube([1.7,l,16.5], center=true);

}



module alu235(l=1000, center=true) {
    thickness=1.7;
    if (center) {
        difference() {
            cube([l, 23.5, 23.5], center=true);    
            cube([l+2, 23.5-thickness-thickness, 23.5-thickness-thickness], center=true);    
            for (i=[0:(l/20-1)]) {
                translate([-l/2+10+i*20,0,0]) rotate([0,0,90]) sportplatz(d=5, l=10, center=true);
            }
            for (i=[0:(l/50-1)]) {
                translate([-l/2+25+i*50,0,0]) rotate([90,0,0]) sportplatz(d=5, l=30, center=true);
                translate([-l/2+25+i*50,0,0]) rotate([90,0,0]) cylinder(d=8,h=30,$fn=50,center=true);
            }

        }
    }
    else {
//        if (l==1000) {
//            import("../stl/alu235_1000.stl");
//        }
//        else {
        translate([l/2, 23.5/2, 23.5/2]) alu235(l=l, center=true);
        //}
    }
}



module hutschiene_universal_bottom() {
    d=10;
    h=10;
    l=80;
    difference() {
        union() {
            cube([l, d, h], center=true);
            translate([0,-12+20,  0-3.5]) cube([l/2-5, 10, 3], center=true);
            translate([0,-12+23.5,3-3.5]) cube([l/2-5, 3, 3], center=true);
            translate([0,-6-12+23.5,3-3.5]) cube([l/2-5, 3, 3], center=true);
            //translate([-25,0,h]) cube([10, 3, h], center=true);
            //translate([+25,0,h]) cube([10, 3, h], center=true);
        }
        translate([-12,0,h]) cube([11, 4, h*5], center=true);
        translate([+12,0,h]) cube([11, 4, h*5], center=true);
        cylinder(d=7, h=100, center=true, $fn=100);
        translate([-25,0,0]) rotate([90,0,0]) cylinder(d=7, h=100, center=true, $fn=100);
        translate([+25,0,0]) rotate([90,0,0]) cylinder(d=7, h=100, center=true, $fn=100);
        translate([-35,0,0]) rotate([90,0,0]) cylinder(d=4, h=100, center=true, $fn=100);
        translate([+35,0,0]) rotate([90,0,0]) cylinder(d=4, h=100, center=true, $fn=100);
    }
}


module hutschiene_universal_top() {
    d=10;
    h=10;
    l=80;
    difference() {
        union() {
            cube([l, d, h], center=true);
            translate([0,-12+20,  0-3.5]) cube([20, 10, 3], center=true);
            translate([0,-12+23.5,3-3.5]) cube([20, 3, 3], center=true);
            translate([0,-6-12+23.5,3-3.5]) cube([20, 3, 3], center=true);
            translate([-12,0,h+15]) cube([10, 3, 60], center=true);
            translate([+12,0,h+15]) cube([10, 3, 60], center=true);
        }
        cylinder(d=8.5, h=100, center=true, $fn=100);
        translate([-25,0,0]) rotate([90,0,0]) cylinder(d=7, h=100, center=true, $fn=100);
        translate([+25,0,0]) rotate([90,0,0]) cylinder(d=7, h=100, center=true, $fn=100);
        translate([-35,0,0]) rotate([90,0,0]) cylinder(d=4, h=100, center=true, $fn=100);
        translate([+35,0,0]) rotate([90,0,0]) cylinder(d=4, h=100, center=true, $fn=100);
        translate([-25/2,0,0]) rotate([90,0,0]) cylinder(d=4, h=100, center=true, $fn=100);
        translate([+25/2,0,0]) rotate([90,0,0]) cylinder(d=4, h=100, center=true, $fn=100);
        translate([+12,0,51]) rotate([90,0,0]) cylinder(d=4, h=100, center=true, $fn=100);
        translate([-12,0,51]) rotate([90,0,0]) cylinder(d=4, h=100, center=true, $fn=100);

    }
}


module camhold() {
    geo_w=21;
    geo_h=14;
    d=2;
    difference() {
        union() {
            translate([0,0,-8]) cylinder(d=15, h=4, center=true, $fn=50);
            
            translate([-geo_w/2,-geo_h/2,0]) cylinder(d=d, h=10, center=true, $fn=20);
            translate([+geo_w/2,+geo_h/2,0]) cylinder(d=d, h=10, center=true, $fn=20);
            translate([-geo_w/2,+geo_h/2,0]) cylinder(d=d, h=10, center=true, $fn=20);
            translate([+geo_w/2,-geo_h/2,0]) cylinder(d=d, h=10, center=true, $fn=20);

            translate([-geo_w/2,-geo_h/2,-5]) cylinder(d=d+2, h=10, center=true, $fn=20);
            translate([+geo_w/2,+geo_h/2,-5]) cylinder(d=d+2, h=10, center=true, $fn=20);
            translate([-geo_w/2,+geo_h/2,-5]) cylinder(d=d+2, h=10, center=true, $fn=20);
            translate([+geo_w/2,-geo_h/2,-5]) cylinder(d=d+2, h=10, center=true, $fn=20);

            translate([0,0,-9]) cube([geo_w+5, geo_h+5, 2], center=true);
            translate([0,0,-8]) cube([40, 5, 4], center=true);
            translate([0,0,-8]) cube([5, 40, 4], center=true);


        }
        translate([0,0,0]) cylinder(d=7, h=114, center=true, $fn=50);
        translate([-15, -0,0]) cylinder(d=3.1, h=50, center=true, $fn=20);
        translate([+15, +0,0]) cylinder(d=3.1, h=50, center=true, $fn=20);
        translate([ -0,+15,0]) cylinder(d=3.1, h=50, center=true, $fn=20);
        translate([ +0,-15,0]) cylinder(d=3.1, h=50, center=true, $fn=20);
    }
}



module simatic() {
    union() {
        color("white") translate([10,-90,100]) rotate([90,0,0]) text("Siemens SIMATIC X86 24 Volt");
        color("red")
        difference() {
            translate([0,0,45]) cube([265,10,50]);
            translate([-1,5,50]) cube([267,10,40]);

        }

        color("red")
        difference() {
            union() {
                translate([0,-90,0]) cube([265,90,135]);
            }
            w=(265-26*2)/25;
            d=8;
            for (i=[0:24]) {
                translate([2+(w+2)*i,-d,-1]) cube([w, d+1, 137]);
            }
        }
    }
}



// Kugellager schematisch
module abec2278_real() {
    difference() {
        translate([0,0,0]) rotate([90,0,0]) cylinder(d=22, h=7, center=true, $fn=50);
        translate([0,0,0]) rotate([90,0,0]) cylinder(d=8, h=8, center=true, $fn=50);
    }
}

module abec2278_real_axle() {
    rotate([0,0,-90]) union() {
        translate([0,0,0]) rotate([90,0,0]) cylinder(d=7.5, h=80*2, center=true, $fn=50);
        difference() {
            translate([0,0,0]) rotate([90,0,0]) cylinder(d=22, h=7, center=true, $fn=50);
            translate([0,0,0]) rotate([90,0,0]) cylinder(d=8, h=8, center=true, $fn=50);
        }
    }
}

// Schneideer für Kugellager-Halterung
module abec2278() {
    union() {
        h1=70;
        translate([0,0,h1/2]) cube([22.3,7.3,h1], center=true);
        translate([0,0,0]) rotate([90,0,0]) cylinder(d=22, h=7, center=true, $fn=50);
        translate([0,0,0]) rotate([90,0,0]) cylinder(d=20, h=80, center=true, $fn=50);
        translate([0,0,0]) rotate([90,0,0]) cylinder(d=8, h=100, center=true, $fn=50);
        rotate([0,0,0]) translate([0,0,5]) rotate([0,90,0]) cylinder(d=2.7, h=100, center=false, $fn=50);
        rotate([0,-180,0]) translate([0,0,-5]) rotate([0,90,0]) cylinder(d=2.7, h=100, center=false, $fn=50);
        //rotate([0,-45,0]) translate([0,0,0]) rotate([0,90,0]) cylinder(d=4.4, h=100, center=false, $fn=50);
        //rotate([0,-45-90,0]) translate([0,0,0]) rotate([0,90,0]) cylinder(d=4.4, h=100, center=false, $fn=50);
    }
}

module abec2278_slot() {
    rotate([0,180,0]) union() {
        h1=70;
        translate([0,0,h1/2]) cube([22.3,7.3,h1], center=true);
        translate([0,0,0]) rotate([90,0,0]) cylinder(d=22, h=7, center=true, $fn=50);
        translate([0,0,0]) rotate([90,0,0]) cylinder(d=18+2, h=80, center=true, $fn=50);
        translate([0,0,0]) rotate([90,0,0]) cylinder(d=8, h=100, center=true, $fn=50);
        //rotate([0,-45,0]) translate([0,0,0]) rotate([0,90,0]) cylinder(d=4.4, h=100, center=false, $fn=50);
        //rotate([0,-45-90,0]) translate([0,0,0]) rotate([0,90,0]) cylinder(d=4.4, h=100, center=false, $fn=50);
    }
}


// Servo Hebel
module servo_crank(h=2, d=8, l=50) {
    translate([0,-l/2,0]) difference() {
        rotate([0,0,90]) sportplatz(l=l+25, d=20, h=h);
        translate([0,0-l/2,0]) rotate([0,0,0]) cylinder(d=d, h=3*h, center=true, $fn=40);

        x = l/2;

        translate([+5,+5+x,0]) cylinder(d=3, h=3*h, center=true, $fn=20);
        translate([-5,+5+x,0]) cylinder(d=3, h=3*h, center=true, $fn=20);
        translate([+5,-5+x,0]) cylinder(d=3, h=3*h, center=true, $fn=20);
        translate([-5,-5+x,0]) cylinder(d=3, h=3*h, center=true, $fn=20);
        translate([-0,-0+x,0]) cylinder(d=6, h=3*h, center=true, $fn=20);

    }

}

// Doppelflügel Servo Hebel
module servo_crank_twin(h=2, d=8, l=50) {
    union() {
        servo_crank(h=h, d=d, l=l);
        rotate([0,0,-180]) servo_crank(h=h, d=d, l=l);
    }
}



module rackgeneral() {

// hard disk 3.5 inch bottom mount plate
    carrier_distance = 60;
    carrier_l = 140;
    difference() {
        union() {
            translate([0,+58,2]) cube([70,10,4], center=true);
            translate([0,-58,2]) cube([70,10,4], center=true);
            rotate([0,0,90]) translate([0,-carrier_distance/2,4/2]) sportplatz(h=4, d=10, l=carrier_l);
            rotate([0,0,90]) translate([0,+carrier_distance/2,4/2]) sportplatz(h=4, d=10, l=carrier_l);

        // bores // rotate([0,0,90]) translate([+carrier_l/2-5,-carrier_distance/2,0]) cylinder(d=2, h=111, center=true, $fn=50);
        // bores // rotate([0,0,90]) translate([-carrier_l/2+5,-carrier_distance/2,0]) cylinder(d=2, h=111, center=true, $fn=50);
        // bores // rotate([0,0,90]) translate([+carrier_l/2-5,+carrier_distance/2,0]) cylinder(d=2, h=111, center=true, $fn=50);
        // bores // rotate([0,0,90]) translate([-carrier_l/2+5,+carrier_distance/2,0]) cylinder(d=2, h=111, center=true, $fn=50);
        }
        rotate([0,0,90]) translate([+carrier_l/2-5,-carrier_distance/2,0]) cylinder(d=6, h=11, center=true, $fn=50);
        rotate([0,0,90]) translate([-carrier_l/2+5,-carrier_distance/2,0]) cylinder(d=6, h=11, center=true, $fn=50);
        rotate([0,0,90]) translate([+carrier_l/2-5,+carrier_distance/2,0]) cylinder(d=6, h=11, center=true, $fn=50);
        rotate([0,0,90]) translate([-carrier_l/2+5,+carrier_distance/2,0]) cylinder(d=6, h=11, center=true, $fn=50);
    //rotate([0,0,90]) cut_hdd3p5floor();
    }
}




//DIN A5 Blatt
module din_a5(h=1, center=false) {
    a=210;
    b=297/2;
    if (center == true) {
        translate([0,0,-h/2]) cube([a,b,h], center=true);
    }
    else {
        translate([a/2,b/2,0]) translate([0,0,-h/2]) cube([a,b,h], center=true);
    }
}

//DIN A4 Blatt
module din_a4(h=1, center=false) {
    a=297;
    b=210;
    if (center == true) {
        translate([0,0,-h/2]) cube([a,b,h], center=true);
    }
    else {
        translate([a/2,b/2,0]) translate([0,0,-h/2]) cube([a,b,h], center=true);
    }
}


module hddplate() {

// hard disk 3.5 inch bottom mount plate
    carrier_distance = 60;
    carrier_l = 140;
    difference() {
        union() {
            translate([0,+48,2]) cube([70,10,4], center=true);
            translate([0,-48,2]) cube([70,10,4], center=true);
            rotate([0,0,90]) translate([0,-carrier_distance/2,4/2]) sportplatz(h=4, d=10, l=carrier_l);
            rotate([0,0,90]) translate([0,+carrier_distance/2,4/2]) sportplatz(h=4, d=10, l=carrier_l);

        // bores // rotate([0,0,90]) translate([+carrier_l/2-5,-carrier_distance/2,0]) cylinder(d=2, h=111, center=true, $fn=50);
        // bores // rotate([0,0,90]) translate([-carrier_l/2+5,-carrier_distance/2,0]) cylinder(d=2, h=111, center=true, $fn=50);
        // bores // rotate([0,0,90]) translate([+carrier_l/2-5,+carrier_distance/2,0]) cylinder(d=2, h=111, center=true, $fn=50);
        // bores // rotate([0,0,90]) translate([-carrier_l/2+5,+carrier_distance/2,0]) cylinder(d=2, h=111, center=true, $fn=50);
        }
        rotate([0,0,90]) translate([+carrier_l/2-5,-carrier_distance/2,0]) cylinder(d=6, h=11, center=true, $fn=50);
        rotate([0,0,90]) translate([-carrier_l/2+5,-carrier_distance/2,0]) cylinder(d=6, h=11, center=true, $fn=50);
        rotate([0,0,90]) translate([+carrier_l/2-5,+carrier_distance/2,0]) cylinder(d=6, h=11, center=true, $fn=50);
        rotate([0,0,90]) translate([-carrier_l/2+5,+carrier_distance/2,0]) cylinder(d=6, h=11, center=true, $fn=50);
        rotate([0,0,90]) cut_hdd3p5floor();
    }
}


// MiniITX Abstandshalter, alle 4 Stück
module mini_itx(h=18, wb=26) {
    translate([6.35,33.02,0]) abstandshalter_atx(h=h, wb=wb); // 1
    translate([6.35,165.1,0]) abstandshalter_atx(h=h, wb=wb); // 2
    translate([6.35+157,165.1,0]) abstandshalter_atx(h=h, wb=wb); // 3
    translate([6.35+157,10.16,0]) abstandshalter_atx(h=h, wb=wb); // 4
}

// Schraubsockel (einzeln) für ATX Mainboards
module abstandshalter_atx(h=13, wb) {
    difference() {
        translate([0,0,h/2]) cylinder(d1=wb, d2=6, h=h, center=true, $fn=50);
        translate([0,0,h/2]) cylinder(d=2.1, h=100, center=true, $fn=50);
    }
}


module cut_hdd3p5floor() {
    d1=4.3;
    w=95;
    h=44;
    translate([-w/2,+h/2,0]) cylinder(d=d1, h=100, center=true, $fn=50);
    translate([+w/2,+h/2,0]) cylinder(d=d1, h=100, center=true, $fn=50);
    translate([-w/2,-h/2,0]) cylinder(d=d1, h=100, center=true, $fn=50);
    translate([+w/2,-h/2,0]) cylinder(d=d1, h=100, center=true, $fn=50);
}


//4 Sockel für Raspberry Pi Halterung mit Spax 2mm Universal
module pi_pillars() {
    L=160;
//pi:49/58
    difference() {
        union() {
translate([-49/2,+58/2,7.5]) cylinder(d=6, h=15, center=true, $fn=50); // schraubsockel PI
translate([-49/2,-58/2,7.5]) cylinder(d=6, h=15, center=true, $fn=50); // schraubsockel PI
translate([+49/2,+58/2,7.5]) cylinder(d=6, h=15, center=true, $fn=50); // schraubsockel PI
translate([+49/2,-58/2,7.5]) cylinder(d=6, h=15, center=true, $fn=50); // schraubsockel PI



}
translate([-49/2,+58/2,0]) cylinder(d=2.1, h=100, center=true, $fn=50);
translate([-49/2,-58/2,0]) cylinder(d=2.1, h=100, center=true, $fn=50);
translate([+49/2,+58/2,0]) cylinder(d=2.1, h=100, center=true, $fn=50);
translate([+49/2,-58/2,0]) cylinder(d=2.1, h=100, center=true, $fn=50);

}

}



module m5_adapter_plate() {

// hard disk 3.5 inch bottom mount plate
    carrier_distance = 60;
    carrier_l = 140;
    difference() {
        union() {
            translate([0,+58/2,2]) cube([70,10,4], center=true);
            translate([0,-58/2,2]) cube([70,10,4], center=true);
            rotate([0,0,90]) translate([0,-carrier_distance/2,4/2]) sportplatz(h=4, d=10, l=carrier_l);
            rotate([0,0,90]) translate([0,+carrier_distance/2,4/2]) sportplatz(h=4, d=10, l=carrier_l);

        // bores // rotate([0,0,90]) translate([+carrier_l/2-5,-carrier_distance/2,0]) cylinder(d=2, h=111, center=true, $fn=50);
        // bores // rotate([0,0,90]) translate([-carrier_l/2+5,-carrier_distance/2,0]) cylinder(d=2, h=111, center=true, $fn=50);
        // bores // rotate([0,0,90]) translate([+carrier_l/2-5,+carrier_distance/2,0]) cylinder(d=2, h=111, center=true, $fn=50);
        // bores // rotate([0,0,90]) translate([-carrier_l/2+5,+carrier_distance/2,0]) cylinder(d=2, h=111, center=true, $fn=50);
        }
        rotate([0,0,90]) translate([+carrier_l/2-5,-carrier_distance/2,0]) cylinder(d=6, h=11, center=true, $fn=50);
        rotate([0,0,90]) translate([-carrier_l/2+5,-carrier_distance/2,0]) cylinder(d=6, h=11, center=true, $fn=50);
        rotate([0,0,90]) translate([+carrier_l/2-5,+carrier_distance/2,0]) cylinder(d=6, h=11, center=true, $fn=50);
        rotate([0,0,90]) translate([-carrier_l/2+5,+carrier_distance/2,0]) cylinder(d=6, h=11, center=true, $fn=50);
    //rotate([0,0,90]) cut_hdd3p5floor();
    }
}

module piplate2() {

// hard disk 3.5 inch bottom mount plate
    carrier_distance = 60;
    carrier_l = 140;
    difference() {
        union() {
            xyz=30;
            translate([+xyz,+xyz,5]) cube([10,10,10], center=true);
            translate([+xyz,-xyz,5]) cube([10,10,10], center=true);
            translate([-xyz,+xyz,5]) cube([10,10,10], center=true);
            translate([-xyz,-xyz,5]) cube([10,10,10], center=true);

            translate([0,+58/2,2]) cube([carrier_l+30,10,4], center=true);
            translate([0,-58/2,2]) cube([carrier_l+30,10,4], center=true);
            rotate([0,0,90]) translate([0,-carrier_distance/2,4/2]) sportplatz(h=4, d=10, l=carrier_l+30);
            rotate([0,0,90]) translate([0,+carrier_distance/2,4/2]) sportplatz(h=4, d=10, l=carrier_l+30);

        // bores // rotate([0,0,90]) translate([+carrier_l/2-5,-carrier_distance/2,0]) cylinder(d=2, h=111, center=true, $fn=50);
        // bores // rotate([0,0,90]) translate([-carrier_l/2+5,-carrier_distance/2,0]) cylinder(d=2, h=111, center=true, $fn=50);
        // bores // rotate([0,0,90]) translate([+carrier_l/2-5,+carrier_distance/2,0]) cylinder(d=2, h=111, center=true, $fn=50);
        // bores // rotate([0,0,90]) translate([-carrier_l/2+5,+carrier_distance/2,0]) cylinder(d=2, h=111, center=true, $fn=50);
        }
        rotate([0,0,90]) translate([+carrier_l/2-5,-carrier_distance/2,0]) cylinder(d=6, h=11, center=true, $fn=50);
        rotate([0,0,90]) translate([-carrier_l/2+5,-carrier_distance/2,0]) cylinder(d=6, h=11, center=true, $fn=50);
        rotate([0,0,90]) translate([+carrier_l/2-5,+carrier_distance/2,0]) cylinder(d=6, h=11, center=true, $fn=50);
        rotate([0,0,90]) translate([-carrier_l/2+5,+carrier_distance/2,0]) cylinder(d=6, h=11, center=true, $fn=50);
        rotate([0,0,90]) cut_hdd3p5floor();
    }
}





























module cut_hddmount() {

//translate([0,0,0]) cube([60,130,1], center=true);

// hard disk 3.5 inch bottom mount plate
    carrier_distance = 60;
    carrier_l = 140;
    rotate([0,0,90]) translate([+carrier_l/2-5,-carrier_distance/2,0]) cylinder(d=4.6, h=101, center=true, $fn=50);
    rotate([0,0,90]) translate([-carrier_l/2+5,-carrier_distance/2,0]) cylinder(d=4.6, h=101, center=true, $fn=50);
    rotate([0,0,90]) translate([+carrier_l/2-5,+carrier_distance/2,0]) cylinder(d=4.6, h=101, center=true, $fn=50);
    rotate([0,0,90]) translate([-carrier_l/2+5,+carrier_distance/2,0]) cylinder(d=4.6, h=101, center=true, $fn=50);


}


module cut_spax2x12(sink_in=false, h=15) {
    translate([0,0,-0.75+0.01]) cylinder(d1=2, d2=5, h=1.5, center=true, $fn=50);
    //translate([0,0,1.1]) cylinder(d=5, h=2.1, center=true, $fn=50);
    translate([0,0,-h]) cylinder(d=2, h=h, center=false, $fn=50);
    if (sink_in == true) {
        translate([0,0,5]) cylinder(d=5.5, h=10, center=true, $fn=50);
    }
}

module cut_spax2x12_tight(sink_in=false) {
    translate([0,0,-0.75+0.01]) cylinder(d1=2, d2=5, h=1.5, center=true, $fn=50);
    //translate([0,0,1.1]) cylinder(d=5, h=2.1, center=true, $fn=50);
    translate([0,0,-15]) cylinder(d=1.6, h=15, center=false, $fn=50);
    if (sink_in == true) {
        translate([0,0,5]) cylinder(d=5.5, h=10, center=true, $fn=50);
    }
}

module cut_spax_tight(h=300) {
    translate([0,0,0]) cylinder(d=1.6, h=h, center=false, $fn=50);
}

module cut_spax2(h=15) {
    translate([0,0,-0.75+0.01]) cylinder(d1=2, d2=5, h=1.5, center=true, $fn=50);
    //translate([0,0,1.1]) cylinder(d=5, h=2.1, center=true, $fn=50);
    translate([0,0,-h]) cylinder(d=2, h=h, center=false, $fn=50);
}

module cut_spax2_elf13(h=3.2-0.16) {
    translate([0,0,3.20]) LT(0,0,0) union() {
        translate([0,0,-0.75+0.01]) cylinder(d1=2, d2=5, h=1.5, center=true, $fn=50);
        translate([0,0,-h]) cylinder(d=2, h=h, center=false, $fn=50);
    }
}

module cut_spax2_deep(elevation=5) {
    translate([0,0,elevation])union() {

        translate([0,0,-0.75+0.01]) cylinder(d1=2, d2=5, h=1.5, center=true, $fn=50);
        translate([0,0,25]) cylinder(d=5.15, h=50, center=true, $fn=50); // d war mal 6
        translate([0,0,-15]) cylinder(d=2, h=15, center=false, $fn=50);
    }
}

module cut_spax5() {
    union() {

        translate([0,0,30/2]) cylinder(d=11, h=30, center=true, $fn=50);
        translate([0,0,-3.5/2+0.01]) cylinder(d1=3, d2=9, h=3.5, center=true, $fn=50);
    //translate([0,0,1.1]) cylinder(d=5, h=2.1, center=true, $fn=50);
        translate([0,0,-25]) cylinder(d=4.5, h=25, center=false, $fn=50);
    }
}


module din_rail(l=1000, center=false) {
    if (center==true) {
        translate([-l/2,-7.5/2,-35/2]) din_rail(l=l, center=false);
    }
    else {
        renderc=0.1;
        cutw=4;
        h=7.5;
        th=1;
        rotate([90,0,0])
        translate([0,0,-h])
        difference() {
            cube([l,35,7.5]);
            translate([-renderc,th+cutw,th]) cube([l+2*renderc,35-2*th-2*cutw,h-th+renderc]);
            translate([-renderc,-renderc,-renderc]) cube([l+2*renderc,cutw+renderc,7.5-th+renderc]);
            translate([-renderc,35-cutw,-renderc]) cube([l+2*renderc,cutw+renderc,7.5-th+renderc]);
            c=l/25-1;
            for (i=[1:c]) {

                translate([i*25,35/2,0]) sportplatz(d=5.2, l=18, center=true, h=h);
            }
        }

    }
}


module sportplatz(d=5, l=10, h=25, center=true) {
    union() {
        cube([l-d, d, h], center=true);
        translate([-l/2+d/2,0,0]) cylinder(d=d, h=h, $fn=50, center=true);
        translate([+l/2-d/2,0,0]) cylinder(d=d, h=h, $fn=50, center=true);
    }    
}

module servo() { 
    servo_carson_cs3(); 
}

module servo_carson_cs3(show_cross=true) {
    union() {
        // gehaeuse
        cube([40, 20, 33.3], center=false);
        
        // servo kreuz
        color("red") translate([10-21,6,42]) cube([42, 8, 2.5], center=false);
        color("red") translate([8+6,10-22.5,42]) rotate([0,0,90]) cube([45, 8, 2.5], center=false);
        
        // platte (rund) servodeckel
        translate([6+4,10,36.3-1]) cylinder(h=3, d=12, center=false, $fn=50);
        // achse
        color("black") translate([6+4,10,1]) cylinder(h=44, d=4, center=false, $fn=50);
        // platte oben
        translate([2,2,32.3]) cube([36, 16, 4], center=false);
        // kasten fuer kabel
        translate([-8,5.75,0]) cube([10, 8.5, 7], center=false);
        difference() {
            // befestigungsplatte
            translate([-55.6/2+40/2,0,25.4]) cube([55.6, 20, 3.6], center=false);
            // hauptbohrloecher
            translate([-4.5,+4.5,0]) cylinder(h=100, d=4.6, center=true, $fn=50);
            translate([-4.5,20-+4.5,0]) cylinder(h=100, d=4.6, center=true, $fn=50);
            translate([-4.5+40+4.5+4.5,+4.5,0]) cylinder(h=100, d=4.6, center=true, $fn=50);
            translate([-4.5+40+4.5+4.5,20-+4.5,0]) cylinder(h=100, d=4.6, center=true, $fn=50);
            translate([-15, 4.5-1.25,22]) cube([10,2.5,10], center=false);
            translate([-15, 20-4.5-1.25,22]) cube([10,2.5,10], center=false);
            translate([44, 4.5-1.25,22]) cube([10,2.5,10], center=false);
            translate([44, 20-4.5-1.25,22]) cube([10,2.5,10], center=false);
        }
    }
}

// fits perfect! bore is too small for M4 drill
module servo_mount(h=2, w=8, helpers=false, osd=0, osb=7.2, osc=0, d=3.3) {
    difference() {
        union() {
            translate([-10,-w,0]) cube([60,w,h]);
            translate([-10,0,0]) cube([9,20,h]);
            translate([41,0,0]) cube([9,20,h]);
            if (helpers == true) {
                color("red") translate([10,10,0]) cylinder(d=2, h=100, center=true, $fn=40);
                color("red") translate([30,10,0]) cylinder(d=2, h=100, center=true, $fn=40);
            }
            if (osd > 0) {
                translate([osc,0,0]) difference() {
                    translate([20,-w/2,h/2]) rotate([90,0,0]) sportplatz(h=w,l=osd+osb+6, d=osb+6);
                    translate([20-osd/2,0,h/2]) rotate([90,0,0]) cylinder(d=osb, h=100, center=true, $fn=40);
                    translate([20+osd/2,0,h/2]) rotate([90,0,0]) cylinder(d=osb, h=100, center=true, $fn=40);
                }
            }
        }
        translate([-5+0.5,   4.5+1,0]) cylinder(d=d, h=100, center=true, $fn=40);
        translate([-5+0.5,   4.5+11,0]) cylinder(d=d, h=100, center=true, $fn=40);
        translate([+5+40-0.5,4.5+1,0]) cylinder(d=d, h=100, center=true, $fn=40);
        translate([+5+40-0.5,4.5+11,0]) cylinder(d=d, h=100, center=true, $fn=40);
    }
}






























module fischert() {
    union() {
        translate([0,0,-1]) cube([15,30,2], center=true); // base plate

        a=2.8284; // cube diagonal 4, so 4**2 = a**2 + a**2, sqrt(8) = a
        cube([2.5,30,2.5], center=true);
        translate([0,0,-1]) translate([0,0,-0.5+2.5]) difference() {
            rotate([0, 45, 0]) cube([a, 30, a], center=true); // 3mm lower socket
            translate([0,0,(a/2)+0.5]) rotate([0, 0, 0]) cube([2*a, 31, a], center=true);
            translate([0,0,(a/2)-4]) rotate([0, 0, 0]) cube([2*a, 31, a], center=true);
        }
    }
}

module fischert15() {
    intersection() {
        rotate([90,0,0]) fischert();
        cube([15,15,15], center=true);
    }
}

module fischert_plate60120() {
    difference() {
        cube([60,120,7.5]);
        translate([31, 2, 7.5/2]) rotate([0, 90, 0]) cylinder(r=2, h=62, center=true, $fn=20);
        translate([31, 120-2, 7.5/2]) rotate([0, 90, 0]) cylinder(r=2, h=62, center=true, $fn=20);
        union () {
            for (i=[0:16]) {
                translate([0,i*(3.25+4),0]) translate([30,2,-15+(7.5/2)]) cylinder(r=2, h=30, center=false, $fn=20);
                
                if ((i-2)%2==0 && i != 0 && i != 16) translate([-15,i*(3.25+4)-2,0]) translate([30,2,-15+(7.5/2)]) cylinder(r=2, h=30, center=false, $fn=20);
                if ((i-2)%2==0 && i != 0 && i != 16) translate([-15,i*(3.25+4)+2,0]) translate([30,2,-15+(7.5/2)]) cylinder(r=2, h=30, center=false, $fn=20);
                if ((i-2)%2==0 && i != 0 && i != 16) translate([-15,i*(3.25+4),0]) translate([30,2,-15+(7.5/2)]) cylinder(r=2, h=30, center=false, $fn=20);
                
                if ((i-2)%2==0 && i != 0 && i != 16) translate([15,i*(3.25+4)-2,0]) translate([30,2,-15+(7.5/2)]) cylinder(r=2, h=30, center=false, $fn=20);
                if ((i-2)%2==0 && i != 0 && i != 16) translate([15,i*(3.25+4)+2,0]) translate([30,2,-15+(7.5/2)]) cylinder(r=2, h=30, center=false, $fn=20);
                if ((i-2)%2==0 && i != 0 && i != 16) translate([15,i*(3.25+4),0]) translate([30,2,-15+(7.5/2)]) cylinder(r=2, h=30, center=false, $fn=20);
            }
        }
        translate([-0.0001,0,0.0001]) union() {
            for (i=[0:7])
                translate([7.5,7.5+(i*15),7.5]) rotate([90, 0, 0]) rotate([0, 90, 0]) fiha_15();
        }
        translate([45.0001,0,0.0001]) union() {
            for (i=[0:7])
                translate([7.5,7.5+(i*15),7.5]) rotate([90, 0, 0]) rotate([0, 90, 0]) fiha_15();
        }
    }
}

// l in { 50, 60, 80, 90, 110, 125, 150, 170, 200, 235, 260, 450 }
module fischert_axleZ(l=50, center=true, drill_f=1.0) {
    cylinder(d=4*drill_f, h=l, center=center, $fn=20);
}

module fischert_axleY(l=50, center=true, drill_f=1.0) {
    rotate([-90,0,0]) fischert_axleZ(l=l, center=center, drill_f=drill_f);
}

module fischert_axleX(l=50, center=true, drill_f=1.0) {
    rotate([0,90,0]) fischert_axleZ(l=l, center=center, drill_f=drill_f);
}


module rampX(h=20, l=50, w=5, centerW=true) {
    if (centerW) {
        translate([0,w/2,0]) rotate([90,0,0]) linear_extrude(height=w) polygon(points=[[0,0], [l,0], [l,h]]);
    }
    else {
        translate([0,w/2,0]) rampX(h=h, l=l, w=w, centerW=true);
    }
}

module rampY(h=20, l=50, w=5,centerW=true) {
    rotate([0,0,90]) rampX(h=h,l=l,w=w,centerW=centerW);
}
module screw(head_d=13, head_h=9, thread_length=30, l=50, d=8, drill_f=1.0) {
    color("red") translate([0,0,-thread_length/2-(l-thread_length)]) cylinder(d=d*drill_f, h=thread_length, center=true, $fn=50); // thread
    translate([0,0,-(l-thread_length)/2]) cylinder(d=d*drill_f, h=l-thread_length, center=true, $fn=50); // nothread
    difference() {
        translate([0,0,head_h/2]) cylinder(d=head_d, h=head_h, center=true, $fn=50); // head
        translate([0,0,head_h+0.2*head_h]) cylinder(d=head_d*2/3, h=head_h, center=true, $fn=50); // head
    }
}

module nutM8() {
    h=7;
    m=8;
    mc=15;
    difference() {
        translate([0,0,-h/2]) cylinder(d=mc, h=h, $fn=6, center=true);
        translate([0,0,-h/2]) cylinder(d=m, h=h+1, $fn=50, center=true);
    }
}

module nutM3() {
    h=2.5;
    m=3;
    mc=6.1;
    difference() {
        translate([0,0,-h/2]) cylinder(d=mc, h=h, $fn=6, center=true);
        translate([0,0,-h/2]) cylinder(d=m, h=h+1, $fn=50, center=true);
    }
}

module screwM8L50(drill_f=1.0) {
    screw(drill_f=drill_f);
}

module screwM3L50(drill_f=1.0) {
    screw(head_d=6, head_h=3, thread_length=18, l=50, d=3, drill_f=drill_f);
}

module screwM3L20(drill_f=1.0) {
    screw(head_d=6, head_h=3, thread_length=20, l=20, d=3, drill_f=drill_f);
}

module screwBlock(a=8, d=4.5) {
    translate([0,0,a/4]) difference() {
        cube([a,a,a/2], center=true);
        cylinder(d=d, h=100, $fn=50, center=true);
    }
}



// Create a Frame out of cubes.
module simpleframe(oX=100, oY=50, pX=1, pZ=8, center=false) {
    if (center == false) {
        translate([oX/2,oY/2,pZ/2]) simpleframe(oX, oY, pX, pZ, center=true);
    }
    else {
        difference() {
            cube([oX, oY, pZ], center=true);
            cube([oX-2*pX, oY-2*pX, pZ+1], center=true);
        }
    }
}

module ofr(x=100, y=50, h=8, w=1, center=false) {
    if (center == false) {
        translate([x/2,y/2,h/2]) ofr(x, y, h, w, center=true);
    }
    else {
        difference() {
            cube([x, y, h], center=true);
            cube([x-2*w, y-2*w, h+1], center=true);
        }
    }
}

module ifr(x=100, y=50, h=8, w=1, center=false) {
    if (center == false) {
        translate([x/2+w,y/2+w,h/2]) ifr(x, y, h, w, center=true);
    }
    else {
        difference() {
            cube([x+2*w, y+2*w, h], center=true);
            cube([x, y, h+1], center=true);
        }
    }
}

// flattened corners
// distance from corner, corner bore diameter 0..
module ifrfc(x=150, y=90, h=50, w=1.5, center=false, dfc=20, cbd=9) {
    if (center == false) {
        translate([x/2+w,y/2+w,h/2]) ifrfc(x, y, h, w, center=true, dfc=dfc);
    }
    else {
        difference() {

            union() {

        //translate([0,0,0]) cube([dfc,dfc,h], center=true);
                translate([-x/2,-y/2,0]) rotate([0,0,0*90]) translate([0,0,-h/2]) linear_extrude(h) polygon(points=[[0,0],[dfc,0],[0,dfc]]);
                translate([+x/2,-y/2,0]) rotate([0,0,1*90]) translate([0,0,-h/2]) linear_extrude(h) polygon(points=[[0,0],[dfc,0],[0,dfc]]);
                translate([+x/2,+y/2,0]) rotate([0,0,2*90]) translate([0,0,-h/2]) linear_extrude(h) polygon(points=[[0,0],[dfc,0],[0,dfc]]);
                translate([-x/2,+y/2,0]) rotate([0,0,3*90]) translate([0,0,-h/2]) linear_extrude(h) polygon(points=[[0,0],[dfc,0],[0,dfc]]);


                difference() {
                    cube([x+2*w, y+2*w, h], center=true);
                    cube([x, y, h+1], center=true);
                }
            }
            if (cbd > 0) {
                translate([+x/2-dfc/4,+y/2-dfc/4,0]) cylinder(d=cbd, h=h+1, center=true, $fn=50);
                translate([-x/2+dfc/4,+y/2-dfc/4,0]) cylinder(d=cbd, h=h+1, center=true, $fn=50);
                translate([-x/2+dfc/4,-y/2+dfc/4,0]) cylinder(d=cbd, h=h+1, center=true, $fn=50);
                translate([+x/2-dfc/4,-y/2+dfc/4,0]) cylinder(d=cbd, h=h+1, center=true, $fn=50);
            }
        }
    }
}

module simplebox(oX=100, oY=50, oZ=20, wall=1, center=false) {
    if (center == false) {
        union() {
            simpleframe(oX, oY, wall, oZ, center=false);
            cube([oX, oY, wall], center=false);
        }
    }
    else {
        translate([-oX/2,-oY/2,-oZ/2]) simplebox(oX, oY, oZ, wall=wall, center=false);
    }
}

module pillar_helper(d=4, h=15, over_lap=1, for_cut=false) {
    union() {
        a=10;
        if (for_cut == false) translate([0,-(h+over_lap)/2,a/2]) cube([a, h+over_lap, a], center=true);
        if (for_cut == true) translate([0,0,a/2]) rotate([90,0,0]) cylinder(d=d, h=4*h, center=true);
    }
}
module reiner_one_shape(d=11, h=11, card=false, usb=false) {
    union() {
        if (card) {
            translate([(68-53.98)/2,114,2]) card_iso7816_card1();
            translate([(68-53.98)/2,114,3]) card_iso7816_card1();
        }
        if (usb) {
            translate([-5,30,h/2]) cube([10, 20, h], center=true);
        }
        difference() {
            cube([68, 114, h]);
            translate([7, 74, -1]) cube([55, 23, h+2]);
            translate([8+0*13.6, 9.5+0*13, 0]) translate([11/2, 11/2, 0]) cylinder(d=d, h=2*h+1, center=true, $fn=50); // ^
            translate([8+1*13.6, 9.5+0*13, 0]) translate([11/2, 11/2, 0]) cylinder(d=d, h=2*h+1, center=true, $fn=50); // 0
            translate([8+2*13.6, 9.5+0*13, 0]) translate([11/2, 11/2, 0]) cylinder(d=d, h=2*h+1, center=true, $fn=50); // ,
            translate([8+3*13.6, 9.5+0*13, 0]) translate([11/2, 11/2, 0]) cylinder(d=d, h=2*h+1, center=true, $fn=50); // OK
            translate([8+0*13.6, 9.5+1*13, 0]) translate([11/2, 11/2, 0]) cylinder(d=d, h=2*h+1, center=true, $fn=50); // 7
            translate([8+1*13.6, 9.5+1*13, 0]) translate([11/2, 11/2, 0]) cylinder(d=d, h=2*h+1, center=true, $fn=50); // 8
            translate([8+2*13.6, 9.5+1*13, 0]) translate([11/2, 11/2, 0]) cylinder(d=d, h=2*h+1, center=true, $fn=50); // 9
            translate([8+3*13.6, 9.5+1*13, 0]) translate([11/2, 11/2, 0]) cylinder(d=d, h=2*h+1, center=true, $fn=50); // SETTINGS
            translate([8+0*13.6, 9.5+2*13, 0]) translate([11/2, 11/2, 0]) cylinder(d=d, h=2*h+1, center=true, $fn=50); // 4
            translate([8+1*13.6, 9.5+2*13, 0]) translate([11/2, 11/2, 0]) cylinder(d=d, h=2*h+1, center=true, $fn=50); // 5
            translate([8+2*13.6, 9.5+2*13, 0]) translate([11/2, 11/2, 0]) cylinder(d=d, h=2*h+1, center=true, $fn=50); // 6
            translate([8+3*13.6, 9.5+2*13, 0]) translate([11/2, 11/2, 0]) cylinder(d=d, h=2*h+1, center=true, $fn=50); // CLR
            translate([8+0*13.6, 9.5+3*13, 0]) translate([11/2, 11/2, 0]) cylinder(d=d, h=2*h+1, center=true, $fn=50); // 1
            translate([8+1*13.6, 9.5+3*13, 0]) translate([11/2, 11/2, 0]) cylinder(d=d, h=2*h+1, center=true, $fn=50); // 2
            translate([8+2*13.6, 9.5+3*13, 0]) translate([11/2, 11/2, 0]) cylinder(d=d, h=2*h+1, center=true, $fn=50); // 3
            translate([8+3*13.6, 9.5+3*13, 0]) translate([11/2, 11/2, 0]) cylinder(d=d, h=2*h+1, center=true, $fn=50); // C
        }
    }
}

module card_grabber_snapper() {
    translate([0,0,10]) difference() {
        union() {
            translate([4,0,35]) cube([25, 70, 50], center=true);
            translate([26.25,0,60]) cube([69.5, 70, 20], center=true);

            
            translate([70,0,65]) cube([30, 40, 10], center=true);
            
            translate([40,-32, 51]) rotate([180,0,180]) rampX(l=30,h=30, w=2);
            translate([40,+32, 51]) rotate([180,0,180]) rampX(l=30,h=30, w=2);

            translate([80,-19, 65]) rotate([180,0,180]) rampX(l=20,h=15, w=2);
            translate([80,+19, 65]) rotate([180,0,180]) rampX(l=20,h=15, w=2);

        }
        translate([-11, 0,40]) cube([20,40,100], center=true); // cut U in snapper
        translate([24,-15,40]) translate([0,0,-1]) cylinder(d=4.5, h=52, $fn=50);
        translate([24,+15,40]) translate([0,0,-1]) cylinder(d=4.5, h=52, $fn=50);

        translate([56,-25,40]) translate([0,0,-1]) cylinder(d=4.5, h=52, $fn=50);
        translate([56,+25,40]) translate([0,0,-1]) cylinder(d=4.5, h=52, $fn=50);

        translate([68,-10,40]) translate([0,0,-1]) cylinder(d=3.5, h=52, $fn=50);
        translate([68,+10,40]) translate([0,0,-1]) cylinder(d=3.5, h=52, $fn=50);
        translate([68+10,-10,40]) translate([0,0,-1]) cylinder(d=3.5, h=52, $fn=50);
        translate([68+10,+10,40]) translate([0,0,-1]) cylinder(d=3.5, h=52, $fn=50);

    }


}

module card_grabber() {
    union() {
        difference() {
            translate([0,0,10]) rotate([180,0,0]) translate([-85,-53.98/2,-8]) difference() {
                translate([85,-5,8]) cube([20, 53.98+10, 10]);
                card_iso7816_card1(only_bad=true);
                translate([80,-10,0]) rotate([0,0,45]) cube([20,20,100], center=true);
                translate([80,53.98+10,0]) rotate([0,0,45]) cube([20,20,100], center=true);
            }
            translate([10,0,0]) cube([15,20,100], center=true);
        }
        translate([40,0,5]) cube([40,5,10], center=true);
        translate([40,-20,5]) cube([40,5,10], center=true);
        translate([40,+20,5]) cube([40,5,10], center=true);
        
        translate([56,-25,0]) difference() {
            cylinder(d=10, h=50, $fn=50);
            translate([0,0,-1]) cylinder(d=4.5, h=52, $fn=50);
        }
        translate([56,+25,0]) difference() {
            cylinder(d=10, h=50, $fn=50);
            translate([0,0,-1]) cylinder(d=4.5, h=52, $fn=50);
        }

        translate([24,-15,0]) difference() { // snapper ski front
            cylinder(d=10, h=30, $fn=50);
            translate([0,0,-1]) cylinder(d=4.5, h=52, $fn=50);
        }
        translate([24,+15,0]) difference() { // snapper ski back
            cylinder(d=10, h=30, $fn=50);
            translate([0,0,-1]) cylinder(d=4.5, h=52, $fn=50);
        }
        
        translate([25,-27,0]) screwBlock(a=10, d=3.5);
        translate([25,+27,0]) screwBlock(a=10, d=3.5);
        translate([47,-27,0]) screwBlock(a=10, d=3.5);
        translate([47,+27,0]) screwBlock(a=10, d=3.5);

        difference() {
            translate([60,0,25]) cube([2,50,50], center=true);
            translate([58,-12,40+2]) rotate([0,-90,0]) screwM3L20(drill_f=1.1);
            translate([58,+12,40+2]) rotate([0,-90,0]) screwM3L20(drill_f=1.1);
            translate([58,-12,28+2]) rotate([0,-90,0]) screwM3L20(drill_f=1.1);
            translate([58,+12,28+2]) rotate([0,-90,0]) screwM3L20(drill_f=1.1);
            translate([58,-12,16+2]) rotate([0,-90,0]) screwM3L20(drill_f=1.1);
            translate([58,+12,16+2]) rotate([0,-90,0]) screwM3L20(drill_f=1.1);
            translate([58,-12, 4+2]) rotate([0,-90,0]) screwM3L20(drill_f=1.1);
            translate([58,+12, 4+2]) rotate([0,-90,0]) screwM3L20(drill_f=1.1);
        }
        
        translate([20,0,9]) rampX(l=40,h=40, w=2);
        translate([20,-20,9]) rampX(l=40,h=40, w=2);
        translate([20,+20,9]) rampX(l=40,h=40, w=2);
    }
}

module card_iso7816_card1(h=0.8, l=85.6, w=53.98, chip=false, fix=true, only_bad=false, only_ceiling=false) {

    if (only_bad) {
        difference() {
            union() {
                translate([70,-5,-3]) cube([32,w+10, 10], center=false);
                translate([94,w/2-20,10]) cylinder(d1=15, d2=1, $fn=50, h=10, center=true);
                translate([94,w/2+20,10]) cylinder(d1=15, d2=1, $fn=50, h=10, center=true);
            }
            margin=1;
            translate([0,-margin/2,0]) card_iso7816_card1(h=10, fix=false, l=l, w=w+margin);
            d=5.5;
            translate([-d/2+l-8.1,17.4+d/2,0]) cylinder(d=d, h=20, center=true, $fn=50);
        }
    }
    else
    {
        if (only_ceiling) {

        }
        else {
            difference() {
                union() {
                    translate([0,w,0]) rotate([0,0,-90]) cube([w, l, h], center=false);
                    if (chip) {
                        color("yellow") translate([9,36-12.5,0.1]) cube([13.5,12.5,h], center=false);
                    }
                }
                if (fix) {
                    d=5.5;
                    translate([-d/2+l-8.1,17.4+d/2,0]) cylinder(d=d, h=20, center=true, $fn=50);
                }
            }
        }
    }
}

//module ski() {
//    difference() {
//        cube([75,16,40], center=false);
//        translate([8,8,0]) cylinder(h=100, d=8, center=true, $fn=50);
//        translate([24,0,8]) rotate([90,0,0]) cylinder(h=100, d=8, center=true, $fn=50);
//        translate([24,0,40-8]) rotate([90,0,0]) cylinder(h=100, d=8, center=true, $fn=50);
//        translate([75,0,20]) rotate([90,0,0]) cylinder(h=100, d=4, center=true, $fn=50);
//        translate([40,0,20]) rotate([90,0,0]) cylinder(h=100, d=4, center=true, $fn=50);
//    }
//    
//}
//ski();
//translate([150,16,0]) rotate([0,0,180]) ski();
module card_funnel_helper() {

    intersection() {
    // 0 0  50 0  50 30  0 2
        union() {
            translate([0,43+15/2,0]) rotate([90,0,0]) linear_extrude(h=84) polygon(points=[[0,0],[50,0],[50,30],[0,0.6]]);
            rotate([180,0,0]) translate([0,42+15/2,0]) rotate([90,0,0]) linear_extrude(h=84) polygon(points=[[0,0],[50,0],[50,30],[0,0.6]]);
        }

    // 0 0 50 0 50 15


        union() {
            color("red") translate([0,56/2,-50]) linear_extrude(h=100) polygon(points=[[0,0],[50,0],[50,15]]);
            color("red") rotate([180,0,0]) translate([0,56/2,-50]) linear_extrude(h=100) polygon(points=[[0,0],[50,0],[50,15]]);
            color("red") translate([25,0,0]) cube([50,56,84], center=true);
        }
    }
}


module funnel() {
    union() {

        difference() {
            color("green") translate([20,0,0]) cube([40,100,80], center=true);
            card_funnel_helper();
            translate([28,0,0]) cube([35,200,200], center=true);
        }
        translate([-7.5,0,2.5]) cube([15, 74, 3], center=true);
    }
}
// Nema 17 Stepper Motor Assistive Elements

// https://cdn-shop.adafruit.com/product-files/324/C140-A+datasheet.jpg

// axis pointing up/z
module nema17_blockX(drill=true, mount=0) {
    rotate([0,90,0]) nema17_blockZ(drill=drill, mount=mount);
}

module cutter_nema17_blockX(drill=false, mount=0) {
    rotate([0,90,0]) nema17_blockZ(drill=drill, mount=mount);
}

module nema17_blockY(drill=false, mount=0) {
    rotate([-90,0,0]) nema17_blockZ(drill=drill, mount=mount);
}

module nema17_blockZ(drill=false, mount=0) {
    if (mount == 0) {
        translate([0,0,-25]) union() {
            difference() {
                union () {
                    translate([0,0,-17]) cube([42.3, 42.3, 34], center=true);
                    translate([0,0,12.5]) cylinder(d=5, h=25, $fn=50, center=true);
                    translate([0,0,1]) cylinder(d=22, h=2, $fn=50, center=true);
                }

                translate([-31/2,-31/2,0]) cylinder(d=3, h=200, $fn=50, center=true); // front left
                translate([+31/2,-31/2,0]) cylinder(d=3, h=200, $fn=50, center=true); // front right
                translate([-31/2,+31/2,0]) cylinder(d=3, h=200, $fn=50, center=true); // back left
                translate([+31/2,+31/2,0]) cylinder(d=3, h=200, $fn=50, center=true); // back right
                a=7;
                translate([+42.3/2, -42.3/2,0]) rotate([0,0,45]) cube([a,a,100], center=true);
                translate([-42.3/2, -42.3/2,0]) rotate([0,0,45]) cube([a,a,100], center=true);
                translate([+42.3/2, +42.3/2,0]) rotate([0,0,45]) cube([a,a,100], center=true);
                translate([-42.3/2, +42.3/2,0]) rotate([0,0,45]) cube([a,a,100], center=true);
            }
            if (drill == true) {
                translate([0,0,12.5]) cylinder(d=5, h=250, $fn=50, center=true);
                translate([0,0,5]) cylinder(d=25, h=100, $fn=50, center=true);
                translate([-31/2,-31/2,0]) cylinder(d=3.5, h=200, $fn=50, center=true); // front left
                translate([+31/2,-31/2,0]) cylinder(d=3.5, h=200, $fn=50, center=true); // front right
                translate([-31/2,+31/2,0]) cylinder(d=3.5, h=200, $fn=50, center=true); // back left
                translate([+31/2,+31/2,0]) cylinder(d=3.5, h=200, $fn=50, center=true); // back right
            }
        }
    }

    if (mount > 0) {
        difference() {
            color("red") translate([0,0,mount/2-25]) cube([42.3, 42.3, mount], center=true);
            nema17_blockZ(drill=true, mount=0);
        }

    }

}

module nema17_mount() {

}


module gt2_belt_pulley(d1=20, h1=7, d2=40, h2=11, d3=36, h3=7, m=8, belt1=false, belt_angle1=0, belt_length1=100, belt2=false, belt_angle2=0, belt_length2=100) {
    translate([0,0,-h1-h2]) union() {

        difference() {
            union() {
            translate([0,0,(h1+h2)/2]) cylinder(d=d1, h=h1+h2, center=true, $fn=100); // achse mit schrauben
            translate([0,0,h1+h2/2]) cylinder(d=d2, h=h2, center=true, $fn=100); // laufrad ohne aussparung
            
        }
        difference() {
            translate([0,0,h3/2+h1+(h2-h3)/2]) cylinder(d=d2+1, h=h3, center=true, $fn=100); // aussparung aber größer als laufrad
            translate([0,0,h3/2+h1+(h2-h3)/2]) cylinder(d=d3, h=h3, center=true, $fn=100); // aussparung
        }
        cylinder(d=m, h=3*(h1+h2), center=true, $fn=50);
    }
    if (belt1) {
        //rotate([0,0,belt_angle1]) translate([belt_length1/2,d3/2+0.50,h3/2+h1+(h2-h3)/2]) cube([belt_length1, 1, 7], center=true);
        rotate([0,0,belt_angle1]) translate([belt_length1/2,d3/2+1+0.50,h3/2+h1+(h2-h3)/2]) cube([belt_length1, 1, 7], center=true);
        rotate([0,0,belt_angle1]) translate([0,d3/2+0.50,h3/2+h1+(h2-h3)/2]) union() {
            for (i=[1:belt_length1-1]) {
                if (i%2==0) translate([i,0,0]) cube([1, 1, 7], center=true);
            }
        }
    }
    if (belt2) {
        //rotate([0,0,belt_angle2]) translate([belt_length2/2,(-1)*(d3/2+0.50),h3/2+h1+(h2-h3)/2]) cube([belt_length2, 1, 7], center=true);
        rotate([0,0,belt_angle2]) translate([belt_length2/2,(-1)*(d3/2+1+0.50),h3/2+h1+(h2-h3)/2]) cube([belt_length2, 1, 7], center=true);
        rotate([0,0,belt_angle2]) translate([0,d3/2+0.50,h3/2+h1+(h2-h3)/2]) union() {
            for (i=[1:belt_length2-1]) {
                if (i%2==0) translate([i,-d3-1,0]) cube([1, 1, 7], center=true);
            }
        }
    }
}
}

module pulleyGT2M5T16 () {
    gt2_belt_pulley(d1=13, h1=5, d2=13, h2=9, d3=9, h3=7, m=5, belt1=true);
}

module pulleyGT2M8T60 () {
    gt2_belt_pulley();
}

module pulleyGT2M8T20 () {
    gt2_belt_pulley(d1=16, h1=6, d2=16, h2=10, d3=12, h3=7, m=8, belt1=true);
}

module gt2rack_twin(t=15, w=7, h=10, bore=3.5) {
    difference() {
        union() {
            gt2rack(t=t, w=w, h=h, center=false);
            translate([0,-h,w]) rotate([180,0,0]) gt2rack(t=t, w=w, h=h, center=false);
        }
        if (bore>0) {
            translate([h,-h/2,0]) cylinder(d=bore, h=3*w, $fn=50, center=true);
            translate([h*2,-h/2,0]) cylinder(d=bore, h=3*w, $fn=50, center=true);
            translate([2*t-h,-h/2,0]) cylinder(d=bore, h=3*w, $fn=50, center=true);
            translate([2*t-h*2,-h/2,0]) cylinder(d=bore, h=3*w, $fn=50, center=true);
        }    
    }
}

module gt2rack_twinmount() {

}

module gt2rack(t=15, w=7, h=5, center=true) {
    if (center) {
        rotate([90,0,0]) translate([-t/2*2,h/2,-w/2]) gt2rack(t=t, w=w, h=h, center=false);
    }
    else {
        union() {
            l=100;
            for (i=[0:t-1]) {
                translate([i*2,0,0]) linear_extrude(height=w, center=false) polygon(points=[ [0,0], [1.5,0], [0.81, 0.81], [1.5-0.81,0.81] ]);
            }
            translate([0,-h,0]) cube([2*t, h, w]);
        }    
    }
}
