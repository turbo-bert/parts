// file parts/gear.scad

// Stirn-Zahnrad ohne Torque für Modul 1, 1.5, 2, 3, 4, 5, 6, 7, 8. Zähne 10-249.
module gear(m=8, h=10, t=5) {
    //x=str("parts/gear/m8/gear-modul8-",str(t),".svg");
    linear_extrude(height=h) import(str("parts/gear/m",str(m),"/gear-modul",str(m),"-t",str(t),".svg"), center=true);

}

module rackn(n=20, h=10, m=1.5) {
    cutmm=0.2;
    difference() {
        racktooth(h=h, m=m, vert=0, n=n);
    translate([0,0,0]) cube([100,cutmm*2,h*2+1], center=true);
    translate([0,n*3.141592654*m,0]) cube([100,cutmm*2,h*2+1], center=true);
        translate([3,0*m*3.141592654+0.5*m*3.141592654,0]) cylinder(d=1.7, h=h*3, center=true, $fn=50);
        translate([3,2*m*3.141592654+0.5*m*3.141592654,0]) cylinder(d=1.7, h=h*3, center=true, $fn=50);
        translate([3,(n-1)*m*3.141592654+0.5*m*3.141592654,0]) cylinder(d=1.7, h=h*3, center=true, $fn=50);
        translate([3,(n-3)*m*3.141592654+0.5*m*3.141592654,0]) cylinder(d=1.7, h=h*3, center=true, $fn=50);
    }

}


module racktooth(h=5, m=1.5, vert=1, n=1) {

    if (vert==0) {

        for (i=[0:n-1]) {
            translate([0,i*m*3.141592654,0])
            translate([0,0.5*m*3.141592654,0]) intersection() {
            if (m==1.5) { // 10mm
                translate([-20+6,0,0]) gear(m=m, t=30, h=h);
            }
            if (m==5) { // 20mm
                translate([-80+20,0,0]) gear(m=m, t=30, h=h);
            }
            translate([50,0,h/2]) cube([100,m*3.141592654,h+1], center=true);
        }
    }

}
else {
    for (i=[0:n-1]) {
        translate([0,i*m*3.141592654,0])
        translate([h,0,0]) rotate([0,-90,0]) racktooth(h=h, m=m, vert=0);
    }
}

}




//module tooth_gear(m=8,h=10) {
//intersection() {
//    
//       translate([2*m,0,0]) cube([3*m,m*2,4*h], center=true);
//       gear(m=m, t=5, h=h) ;
//}
//}
//

module speiche(h=10, r_from=15, r_to=30, cut_deg=15, space_deg=5, limit=100) {
    step_rot=cut_deg+space_deg;
    steps=360/(cut_deg+space_deg);
    union() {
        for (i=[0:steps-1]) {
            if (i<limit) {
                rotate([0,0,i*step_rot]) difference() {
                    cylinder(d=2*r_to,h=h,center=true,$fn=120);
                    translate([0,-(r_to*2+2)/2,0]) cube([r_to*2+2,r_to*2+2,h+2], center=true);
                    rotate([0,0,-180+cut_deg]) translate([0,-(r_to*2+2)/2,0]) cube([r_to*2+2,r_to*2+2,h+2], center=true);
                    cylinder(d=2*r_from,h=h+2,center=true,$fn=120);
                }
            }
        }
    }
}
