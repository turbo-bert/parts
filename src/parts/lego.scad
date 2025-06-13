c_lego_1he = 9.6;
//c_lego_1he = 11.3;

module naked_brick(x=1,y=1,z=1,do78=1) {
    X=x*8;
    Y=y*8;
    Z=z*c_lego_1he;

    if (do78 == 1) {
        translate([X/2,Y/2,Z/2]) intersection () {
            cube([X,Y,Z], center=true);
            cube([X-0.2,Y-0.2,Z], center=true);
        }
    }
    else {
        if (do78 == 2) {

        translate([X/2,Y/2,Z/2]) cube([X+0.2,Y+0.2,Z+0.2], center=true);
        }
        else {

        translate([X/2,Y/2,Z/2]) cube([X,Y,Z], center=true);
        }
    }

}

module thread_box_brick(text="") {
    w=14;
    d=2;


    difference(){
    union() {
        LT(-w/2, -d/2, -1) elf_brick(w,d,1,do78=1,top_nop=0);
        LT(w/2-1, -d/2, -1) elf_brick(5,d,1,do78=1,top_nop=0);
    }
    translate([0,0,0]) rotate([0,90,0]) cylinder(d=10, h=70, center=true, $fn=150);
    translate([0,0,-1.5]) cube([20,100,10], center=true);

    LT(+w/2-1-1, 0, -1) cut_spax2_deep();
    LT(+w/2-1-0.5+1, +0.5, -1) cut_spax2_deep();
    LT(+w/2-1-0.5+1, -0.5, -1) cut_spax2_deep();
    
    LT(-w/2+1+1, 0, -1) cut_spax2_deep();
    LT(-w/2+1+0.5-1, +0.5, -1) cut_spax2_deep();
    LT(-w/2+1+0.5-1, -0.5, -1) cut_spax2_deep();
    
    translate([62,-5.5,-2]) linear_extrude(5) text(text, size=12);
    }


}

module screwnop() {
    difference(){
        union() {

            elf13_brick(2,1,2,do78=1,top_nop=0);
        }
//LT(1.5,0.5) translate([0,0,0]) cylinder(d=2, h=30, center=true, $fn=50); // cyz
        LT(1.5,0.5) cut_spax2_deep();
    }
}


module mod8gen(n=8, schraub=0) {
    difference(){
        union() {
            elf_brick(n,2,1,do78=1);
        }
        translate([0,0,0]) LT(n/2,1,0) elf_vert_bore_grid(n,2);

        for (i=[0+schraub:n-2-schraub]) {
            LT(1+i,1) cut_spax2_deep();
        }
        if (schraub > 0) {
            for (i=[0:schraub-1]) {
                LT(1+i,1) translate([0,0,0]) cylinder(d=1.8, h=20, center=true, $fn=50); // cyz
                LT(n-1-i,1) translate([0,0,0]) cylinder(d=1.8, h=20, center=true, $fn=50); // cyz
            }
        }
        for (i=[0:n-1]) {
            LT(0.5+i,0,0.5) translate([0,0,0]) rotate([90,0,0]) cylinder(d=1.8, h=50, center=true, $fn=50);

        }
    }
}

module mod8_tower(x,y,h) {
    difference(){
        union() {
            elf_brick(x,y,h,do78=1);
        }

        for (vbx=[0:x-2]) {
            for (vby=[0:y-2]) {
            LT(1+vbx,1+vby) translate([0,0,0]) cylinder(d=1.7, h=10*h*2.5, center=true, $fn=50); // cyz
        }
    }
    
    LT(x/2,y/2,h-1) elf_vert_bore_grid(w=x,d=y,h=0);
}

}

module mod8_gblock(x=3, y=2, z=4) {
    difference(){
        union() {
            elf_brick(x,y,z,do78=1);
        }
        mod8_grit(x,y,z);
    }

}


module mod8_grit(x,y,h) {

    union() {

        if (x > 1 && y > 1) {
            for (vbx=[0:x-2]) {
                for (vby=[0:y-2]) {
                LT(1+vbx,1+vby) translate([0,0,0]) cylinder(d=1.7, h=10*h*2.5, center=true, $fn=50); // cyz
            }
        }
        for (z=[1:h-1]) {
            for (vbx=[0:x-2]) {
                for (vby=[0:y-2]) {
                    LT(1+vbx,1+vby,z) translate([0,0,0]) rotate([90,0,0]) cylinder(d=1.7, h=y*8*3, center=true, $fn=50);
                    LT(1+vbx,1+vby,z) translate([0,0,0]) rotate([0,90,0]) cylinder(d=1.7, h=x*8*3, center=true, $fn=50);
                }
            }
        }
    }
    LT(x/2,y/2,h-1) elf_vert_bore_grid(w=x,d=y,h=0);
}


}

module elf78(x=2,y=4,h=1) {
    w=0.2;
    translate([w/2,w/2,w/2]) cube([x*8-w,y*8-w,c_lego_1he*h-w], center=false);
}

module LT(x=0,y=0,z=0) {
    translate([x*8,y*8,z*c_lego_1he]) children();
}

module ZL() {
    rotate([0,0,90]) children();
}
module ZL45() {
    rotate([0,0,45]) children();
}

module ZR() {
    rotate([0,0,-90]) children();
}
module ZR45() {
    rotate([0,0,-45]) children();
}

module YL() {
    rotate([0,-90,0]) children();
}

module YL45() {
    rotate([0,-45,0]) children();
}

module XL() {
    rotate([90,0,0]) children();
}

module XL45() {
    rotate([45,0,0]) children();
}

module XLN45() {
    rotate([-45,0,0]) children();
}

module XR() {
    rotate([-90,0,0]) children();
}

module YR() {
    rotate([0,90,0]) children();
}
module YR45() {
    rotate([0,45,0]) children();
}
module YL45() {
    rotate([0,-45,0]) children();
}

module brick1square(a=8) {
    el_brickarea(1,a,1);
    translate([(a-1)*8,0,0]) el_brickarea(1,a,1);
    el_brickarea(a,1,1);
    translate([0,(a-1)*8,0]) el_brickarea(a,1,1);
}


module lego_m8_nut(x=0,y=0,z=0,he=2) {
    difference() {
        translate([x*8,y*8,z*9.6]) lego_boxarea(2,2,he);
        translate([8*(x+1),8*(y+1),z*9.6]) cylinder(d=7.4, h=3*10*he, center=true, $fn=50);
    }

}


module lego_spax1he2() {
    union() {
        translate([0,0,10-5]) translate([0,0,0]) cylinder(d=6, h=10, center=true, $fn=50);
        translate([0,0,10]) cut_spax2x12();
    }
}



// Easy Lego Frame
module el_frame(x=20, y=13, h=2, w=2) {
    el_brickarea(x=x, y=w, h=h);
    el_brickarea(x=w,y=y, h=h);
    translate([8*x-8*w,0,0]) el_brickarea(x=w,y=y, h=h);
    translate([0,8*y-8*w,0]) el_brickarea(x=x, y=w, h=h);
}

module elf_frame(x=20, y=13, h=2, w=2) {
    elf_brick(x=x, y=w, h=h);
    elf_brick(x=w,y=y, h=h);
    translate([8*x-8*w,0,0]) elf_brick(x=w,y=y, h=h);
    translate([0,8*y-8*w,0]) elf_brick(x=x, y=w, h=h);
}

module elf13_frame(x=20, y=13, h=2, w=2) {
    elf13_brick(x=x, y=w, h=h);
    elf13_brick(x=w,y=y, h=h);
    translate([8*x-8*w,0,0]) elf13_brick(x=w,y=y, h=h);
    translate([0,8*y-8*w,0]) elf13_brick(x=x, y=w, h=h);
}


module lego1_stl() {
    x="parts/lego/1x1x1HE.stl";
    import(x, convexity=3);
}

module lego1(a=8) {
    difference() {
        union() {
            translate([0,0,9.6/2]) cube([a, a, c_lego_1he], center=true); // klotz
            translate([0,0,11.3/2]) cylinder(d=5.3, h=11.3, center=true, $fn=50); // nopp oben, 5.1 lose
        }
        translate([0,0,1-0.3]) cylinder(d=5.2, h=3, center=true, $fn=50); // nopp unten
    }
}

module lego1_box(a=8) {
    translate([0,0,9.6/2]) cube([a, a, c_lego_1he], center=true); // klotz
}

module lego1_easy(a=8, he=1) {
    difference() {
        union() {
            translate([0,0,he*9.6/2]) cube([a, a, c_lego_1he*he], center=true); // klotz
            translate([0,0,((he-1)*9.6)+11.3/2]) cylinder(d=5.3-0.1, h=11.3, center=true, $fn=50); // nopp oben, 5.1 lose
        }
        translate([0,0,1-0.3]) cylinder(d=5.2+0.1, h=3, center=true, $fn=50); // nopp unten
    }
}


module lego1_ffeasy(a=8, he=1) {
    difference() {
        union() {
            translate([0,0,he*9.6/2]) cube([a, a, c_lego_1he*he], center=true); // klotz
            //translate([0,0,((he-1)*9.6)+11.3/2]) cylinder(d=5.3-0.1, h=11.3, center=true, $fn=50); // nopp oben, 5.1 lose
        }
        translate([0,0,1-0.3]) cylinder(d=5.2+0.1, h=3, center=true, $fn=50); // nopp unten
        translate([0,0,3/2+9.6-3+0.7]) cylinder(d=5.2+0.1, h=3, center=true, $fn=50); // nopp unten
    }
}

module lego1_flat(a=8, he=1) {
    difference() {
        union() {
            translate([0,0,he*9.6/2]) cube([a, a, c_lego_1he*he], center=true); // klotz
            //translate([0,0,((he-1)*9.6)+11.3/2]) cylinder(d=5.3-0.1, h=11.3, center=true, $fn=50); // nopp oben, 5.1 lose
        }
        translate([0,0,1-0.3]) cylinder(d=5.2+0.3, h=3.3, center=true, $fn=50); // nopp unten
        //translate([0,0,3/2+9.6-3+0.7]) cylinder(d=5.2+0.1, h=3, center=true, $fn=50); // nopp unten
    }
}

module lego1_v2(a=8, he=1, top_nop=1, bottom_nop=1) {
    difference() {
        union() {
            translate([0,0,he*9.6/2]) cube([a, a, c_lego_1he*he], center=true); // klotz
            if (top_nop == 1) {
                translate([0,0,((he-1)*9.6)+11.3/2]) cylinder(d=5.3-0.18, h=11.3, center=true, $fn=50); // nopp oben, 5.1 lose
            }
        }
        if (bottom_nop == 1) {
            translate([0,0,1-0.3]) cylinder(d=5.2+0.23, h=3.3, center=true, $fn=50); // nopp unten
        }
        //translate([0,0,3/2+9.6-3+0.7]) cylinder(d=5.2+0.1, h=3, center=true, $fn=50); // nopp unten
    }
}

module lego13_v2(a=8, he=1, top_nop=1, bottom_nop=1) {
    difference() {
        union() {
            translate([0,0,he*9.6/2/3]) cube([a, a, c_lego_1he*he/3], center=true); // klotz
            hnew=3.2*he+1.7;
            if (top_nop == 1) {
                    translate([0,0,hnew/2]) cylinder(d=5.3-0.18, h=hnew, center=true, $fn=50); // nopp oben, 5.1 lose
                }
            }
            if (bottom_nop == 1) {

        translate([0,0,1-0.3]) cylinder(d=5.2+0.23, h=3.3, center=true, $fn=50); // nopp unten
    }
    
}
}

module lego1_easy_nonop(a=8, he=1) {
    difference() {
        union() {
            translate([0,0,he*9.6/2]) cube([a, a, c_lego_1he*he], center=true); // klotz
        }
        translate([0,0,1-0.3]) cylinder(d=5.2+0.1, h=3, center=true, $fn=50); // nopp unten
    }
}




module el13_area(x=2,y=2,xtra=0) {
    // auto raster BEGIN =========================
    raster_nx=x;
    raster_ny=y;
    raster_dx=8;
    raster_dy=8;
    for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
        translate([raster_dx*raster_x, raster_dy*raster_y, 0])
        lego1_3_easy();
    }
    // auto raster END =========================
    if (xtra > 0) {
        translate([0,0,-xtra]) cube([8*x,8*y,xtra], center=false);
    }
}

module el13_brickarea(x=2,y=2) {
    // auto raster BEGIN =========================
    raster_nx=x;
    raster_ny=y;
    raster_dx=8;
    raster_dy=8;
    for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
        translate([raster_dx*raster_x, raster_dy*raster_y, 0])
        difference() {
            lego1_3_easy();
            translate([4,4,1-0.3]) cylinder(d=5.2+0.1, h=3, center=true, $fn=50); // nopp unten

        }
    }
    // auto raster END =========================
    
}

module elf13_brickarea(x=2,y=2) {
    // auto raster BEGIN =========================
    raster_nx=x;
    raster_ny=y;
    raster_dx=8;
    raster_dy=8;
    for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
        translate([raster_dx*raster_x, raster_dy*raster_y, 0])
        difference() {
            //TODO:bob
            //lego1_3_easy();
            //lego1_v2();
            //translate([4,4,1-0.3]) cylinder(d=5.2+0.1, h=3, center=true, $fn=50); // nopp unten

        }
    }
    // auto raster END =========================
    
}

module lego1_3_easy(a=8, he=1) {
    translate([4,4,0]) union() {
            translate([0,0,he*9.6/2/3]) cube([a, a, c_lego_1he*he/3], center=true); // klotz
            translate([0,0,(11.3-9.6)/2+(c_lego_1he*he/3)]) cylinder(d=5.3-0.1, h=11.3-9.6, center=true, $fn=50); // nopp oben, 5.1 lose
        }
    }

    module lego2() {
        lego1(a=8);
        translate([1*8,0,0]) lego1(a=8);
        translate([2*8,0,0]) lego1(a=8);
    }

    module lego3() {
// auto raster BEGIN =========================
    }




    module el_brickarea(x=2, y=2, h=1, center=false, nonop=false) {
        if (center) {
            translate([-x/2*8,-y/2*8,-c_lego_1he*h/2]) el_brickarea_noc_(x=x,y=y,h=h,nonop=nonop);
        }
        else {
            el_brickarea_noc_(x=x,y=y,h=h,nonop=nonop);
        }
    }



    module el_brickarea_noc_(x=2, y=2, h=1,nonop=false) {

        translate([4,4,0]) union() {

// auto raster BEGIN =========================
            raster_nx=x;
            raster_ny=y;
            raster_dx=8;
            raster_dy=8;
            for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
                translate([raster_dx*raster_x, raster_dy*raster_y, 0])
                if (nonop==true) {

                    translate([0,0,0]) lego1_easy_nonop(a=8,he=h);
                }
                else {
                    translate([0,0,0]) lego1_easy(a=8,he=h);
                }
            }
// auto raster END =========================
        }

    }


    module el_ffbrickarea(x=2, y=2, h=1, center=false) {
        if (center) {
            translate([-x/2*8,-y/2*8,-c_lego_1he*h/2]) el_ffbrickarea_noc_(x=x,y=y,h=h);
        }
        else {
            el_ffbrickarea_noc_(x=x,y=y,h=h);
        }
    }

    module elf_area(x=2, y=2, h=1, center=false) {
        if (center) {
            translate([-x/2*8,-y/2*8,-c_lego_1he*h/2]) elf_area_(x=x,y=y,h=h);
        }
        else {
            elf_area_(x=x,y=y,h=h);
        }
    }


    module elf_area_(x=2, y=2, h=1) {

        translate([4,4,0]) union() {

// auto raster BEGIN =========================
            raster_nx=x;
            raster_ny=y;
            raster_dx=8;
            raster_dy=8;
            for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
                translate([raster_dx*raster_x, raster_dy*raster_y, 0])
                translate([0,0,0]) lego1_flat(a=8,he=h);
            }
// auto raster END =========================
        }

    }



    module elf_brick(x=2, y=2, h=1, center=false, top_nop=1, bottom_nop=1, do78=0) {
        if (center) {
            translate([-x/2*8,-y/2*8,0*-c_lego_1he*h/2]) elf_brick_(x=x,y=y,h=h, top_nop=top_nop, bottom_nop=bottom_nop, do78=do78);
        }
        else {
            elf_brick_(x=x,y=y,h=h, top_nop=top_nop, bottom_nop=bottom_nop, do78=do78);
        }
    }


    module elf_brick_(x=2, y=2, h=1, top_nop, bottom_nop, do78=0) {

        if (do78 == 1) {
            intersection() {
                LT(0,0,-1) elf78(x=x,y=y,h=h+2);
// auto raster BEGIN =========================
                translate([4,4,0]) union() {
                    raster_nx=x;
                    raster_ny=y;
                    raster_dx=8;
                    raster_dy=8;
                    for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
                        translate([raster_dx*raster_x, raster_dy*raster_y, 0])
                        translate([0,0,0]) lego1_v2(a=8,he=h, top_nop=top_nop, bottom_nop=bottom_nop);
                    }
                }
// auto raster END =========================
            }
        }
        else {

// auto raster BEGIN =========================
            translate([4,4,0]) union() {
                raster_nx=x;
                raster_ny=y;
                raster_dx=8;
                raster_dy=8;
                for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
                    translate([raster_dx*raster_x, raster_dy*raster_y, 0])
                    translate([0,0,0]) lego1_v2(a=8,he=h, top_nop=top_nop, bottom_nop=bottom_nop);
                }
            }
// auto raster END =========================
        }

    }

    module elf13_brick(x=2, y=2, h=1, center=false, top_nop=1, bottom_nop=1, do78=0) {
        if (center) {
            translate([-x/2*8,-y/2*8,0*-c_lego_1he*h/2]) elf13_brick_(x=x,y=y,h=h,top_nop=top_nop, bottom_nop=bottom_nop,do78=do78);
        }
        else {
            elf13_brick_(x=x,y=y,h=h,top_nop=top_nop, bottom_nop=bottom_nop,do78=do78);
        }
    }


    module elf13_brick_(x=2, y=2, h=1,top_nop, bottom_nop,do78=0) {

        if (do78 == 1) {
            intersection() {
                LT(0,0,-1) elf78(x=x,y=y,h=2);
                // auto raster BEGIN =========================
                translate([4,4,0]) union() {
                    raster_nx=x;
                    raster_ny=y;
                    raster_dx=8;
                    raster_dy=8;
                    for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
                        translate([raster_dx*raster_x, raster_dy*raster_y, 0])
                        translate([0,0,0]) lego13_v2(a=8,he=h,top_nop=top_nop, bottom_nop=bottom_nop);
                    }
                }
                // auto raster END =========================
            }

        }
        else {
            // auto raster BEGIN =========================
            translate([4,4,0]) union() {
                raster_nx=x;
                raster_ny=y;
                raster_dx=8;
                raster_dy=8;
                for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
                    translate([raster_dx*raster_x, raster_dy*raster_y, 0])
                    translate([0,0,0]) lego13_v2(a=8,he=h,top_nop=top_nop, bottom_nop=bottom_nop);
                }
            }
            // auto raster END =========================
        }



    }

    module el_ffbrickarea_noc_(x=2, y=2, h=1) {

        translate([4,4,0]) union() {

// auto raster BEGIN =========================
            raster_nx=x;
            raster_ny=y;
            raster_dx=8;
            raster_dy=8;
            for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
                translate([raster_dx*raster_x, raster_dy*raster_y, 0])
                translate([0,0,0]) lego1_ffeasy(a=8,he=h);
            }
// auto raster END =========================
        }

    }





    module lego_brickarea_noc_(x=2, y=2, h=1) {
        translate([4,4,0]) union() {

// auto raster BEGIN =========================
            raster_nx=x;
            raster_ny=y;
            raster_dx=8;
            raster_dy=8;
            for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
                for (i=[0:h-1]) {
                    translate([raster_dx*raster_x, raster_dy*raster_y, 0])
                    translate([0,0,i*c_lego_1he]) lego1_stl();
                }
            }
// auto raster END =========================
        }

    }

    module lego_boxarea_noc_(x=2, y=2, h=1) {
        translate([4,4,0]) union() {

// auto raster BEGIN =========================
            raster_nx=x;
            raster_ny=y;
            raster_dx=8;
            raster_dy=8;
            for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
                for (i=[0:h-1]) {
                    translate([raster_dx*raster_x, raster_dy*raster_y, 0])
                    translate([0,0,i*c_lego_1he]) lego1_box();
                }
            }
// auto raster END =========================
        }

    }

    module lego_brickarea(x=2, y=2, h=1, center=false) {
        if (center) {
            translate([-x/2*8,-y/2*8,-c_lego_1he*h/2]) lego_brickarea_noc_(x=x,y=y,h=h);
        }
        else {
            lego_brickarea_noc_(x=x,y=y,h=h);
        }
    }

    module lego_boxarea(x=2, y=2, h=1, center=false) {
        if (center) {
            translate([-x/2*8,-y/2*8,-c_lego_1he*h/2]) lego_boxarea_noc_(x=x,y=y,h=h);
        }
        else {
            lego_boxarea_noc_(x=x,y=y,h=h);
        }
    }
