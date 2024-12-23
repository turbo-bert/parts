module pacalog_1(h=10, b=2.7) {
    difference() {
        elf_brick(3,2,h);
        translate([8,8,0]) cylinder(d=b, h=1000, center=true, $fn=50);
        translate([8*2,8,0]) cylinder(d=b, h=1000, center=true, $fn=50);
    }
}

module pacalog_2() {
    pacalog_1(h=1, b=3.6);
}

module pacalog_3() {
    translate([6*8,2*8,0]) rotate([0,0,90]) difference() {
        union() {
            translate([-16,0,0]) elf_brick(4,6,4);
            translate([16+8/2-1,16+8,9.6/2*2]) cube([8,16,9.6*2], center=true); // -1 ist weils sonst zu eng wurde it der achse
        }
        translate([8,16+8,0]) cylinder(d=2.7, h=100, center=true, $fn=50);
        
        translate([8,16+8-15,0]) cylinder(d=2.7, h=100, center=true, $fn=50);
        translate([8,16+8+15,0]) cylinder(d=2.7, h=100, center=true, $fn=50);

        translate([8-16,16+8-15,0]) cylinder(d=2.7, h=100, center=true, $fn=50);
        translate([8-16,16+8+15,0]) cylinder(d=2.7, h=100, center=true, $fn=50);
        

        translate([0,16+8,5+9.6]) rotate([0,90,0]) cylinder(d=4.3, h=100, center=true, $fn=50);
        translate([8,16,18]) cylinder(d1=0, d2=5, h=3, center=true, $fn=50);
    }

}



module pacalog_4() {
    LT(4) rotate([0,0,90]) difference() {
        union() {
            elf_brick(2,4,2);
            translate([16+8/2-1,16,9.3/2]) cube([8,16,9.3], center=true); // -1 ist weils sonst zu eng wurde it der achse
        }
        translate([8,16,0]) cylinder(d=3, h=100, center=true, $fn=50);
        translate([0,16,5]) rotate([0,90,0]) cylinder(d=3.3, h=100, center=true, $fn=50);
        translate([8,16,18]) cylinder(d1=0, d2=5, h=3, center=true, $fn=50);
    }

}

module pacalog_5() {
    LT(4) ZL() difference() {

        elf_brick(2,4,1);
        translate([8,16,5/2+6.3]) cylinder(d=12, h=5, center=true, $fn=50);
        translate([8,16,0]) cylinder(d=4, h=100, center=true, $fn=50);

    }

}

module pacalog_6() {
    rimh=7;
    rimd=25;
    glen=15;
    //ZR() YL() 
    difference() {
        union() {
            translate([0,0,-rimh/2]) cylinder(d=rimd, h=rimh, center=true, $fn=150);
            gear(m=1.5, h=glen, t=10);
        }
        translate([0,0,0]) cylinder(d=6.2, h=100, center=true, $fn=50);
        translate([0,0,-rimh/2]) rotate([0,90,0]) cylinder(d=2.8, h=100, center=true, $fn=50);
        translate([0,0,-rimh/2]) rotate([90,0,0]) cylinder(d=2.8, h=100, center=true, $fn=50);
        translate([19+2,0,0]) cube([20,20,20], center=true);
    }

}

module pacalog_6_v0() {
    rimh=8;
    ZR() YL() difference() {
        union() {
            translate([0,0,-rimh/2]) cylinder(d=20, h=rimh, center=true, $fn=150);
            gear(m=1.5, h=30, t=7);
        }
        translate([0,0,0]) cylinder(d=5.2, h=100, center=true, $fn=50);
        translate([0,0,-rimh/2]) rotate([0,90,0]) cylinder(d=2.8, h=100, center=true, $fn=50);
        translate([0,0,-rimh/2]) rotate([90,0,0]) cylinder(d=2.8, h=100, center=true, $fn=50);
        translate([19,0,0]) cube([20,20,20], center=true);
    }

}

module pacalog_7() {
    LT(6) ZL() difference() {
        union() {
            translate([0,0,0]) elf_brick(2,6,4);
            translate([16+8/2-1,16+8,9.6/2*2]) cube([8,16,9.6*2], center=true); // -1 ist weils sonst zu eng wurde it der achse
        }
        translate([8,16+8,0]) cylinder(d=2.7, h=100, center=true, $fn=50);
        
        translate([8,16+8-15,0]) cylinder(d=2.7, h=100, center=true, $fn=50);
        translate([8,16+8+15,0]) cylinder(d=2.7, h=100, center=true, $fn=50);

        translate([8-16,16+8-15,0]) cylinder(d=2.7, h=100, center=true, $fn=50);
        translate([8-16,16+8+15,0]) cylinder(d=2.7, h=100, center=true, $fn=50);
        

        translate([0,16+8,5+9.6]) rotate([0,90,0]) cylinder(d=4.3, h=100, center=true, $fn=50);
        translate([8,16,18]) cylinder(d1=0, d2=5, h=3, center=true, $fn=50);
    }

}

module pacalog_8() {
    rotate([-90,0,0]) translate([0,30*0,0]) difference() {
        gear(m=1.5,h=30,t=67);
        translate([0,0,0]) cylinder(d=4.3, h=111, center=true, $fn=50);
        speiche(h=100, r_from=15, r_to=42, cut_deg=22, space_deg=8, limit=100);
    }

}

module pacalog_9() {
    wu = 11;
    wo = 5;
    h=4;
    n=3;
    l=15*n;
    translate([0,wu/2,0]) ZL() rotate([90,0,0]) 
    difference() {
        linear_extrude(height=l) polygon(points=[[0,0], [wu/2,0], [wo/2,h],[-wo/2,h],[-wu/2,0]]);
        for (i=[0:n-1]) {
            translate([0,0,15/2+15*i]) rotate([90,0,0]) cylinder(d=4.6, h=100, center=true, $fn=50);
        }
    }

}

// teller säule, 30mm h=10mm
module pacalog_10() {
    h1=10+2;
    h2=5;
    rotate([0*180,0,0]) difference() {
        union() {
            translate([0,0,-h1/2]) cylinder(d=30-1, h=h1, center=true, $fn=150);
            translate([0,0,+h2/2]) cylinder(d=50-1, h=h2, center=true, $fn=150);

        }

        translate([0,0,0]) cylinder(d=8.7, h=100, center=true, $fn=50);
    }
}
module pacalog_10_cut(ew=0.3) {
    h1=10.5;
    h2=20;
    translate([0,0,h1]) rotate([0*180,0,0]) difference() {
        union() {
            translate([0,0,-h1/2]) cylinder(d=30+ew, h=h1, center=true, $fn=150);
            translate([0,0,+h2/2]) cylinder(d=50+ew, h=h2, center=true, $fn=150);

        }

        //translate([0,0,0]) cylinder(d=8.7, h=100, center=true, $fn=50);
    }
}

module pacalog_11() {
    rotate([180,0,0]) difference() {
        elf_area(7,6,1,center=true);
        translate([0,0,0]) cylinder(d=7.3, h=111, center=true, $fn=50);
    }

}

module pacalog_12() {
    h=12;
    w=20+1;
    LT(3,3) translate([0,w/2,0]) ZL() ZL()  difference() {
        translate([0,w/2,0]) union() {
            translate([0,12,9.6/2]) elf_brick(6,3,center=true);
            translate([0,-w/2,h/2]) cube([6*8,w,h], center=true);
        }
        translate([-15,0,0]) cylinder(d=6, h=100, center=true, $fn=50);
        translate([+15,0,0]) cylinder(d=6, h=100, center=true, $fn=50);
        translate([0,0,0]) cylinder(d=6, h=100, center=true, $fn=50);
    }

}

module pacalog_13() {
    a=13;
    b=6;
    hx=9.5-2;
    translate([0,0,2]) LT(6.5,3) difference() {
        union() {
            w=40;
            translate([0,0,hx/2]) cube([w,w,hx], center=true);
            translate([-a/2*8,-b/2*8,0]) el13_area(a,b,2);
        }
        translate([0,0,0]) cylinder(d=30+1, h=100, center=true, $fn=150);
    }
}

module pacalog_14() {
    rotate([180,0,0]) difference() {
        gear(m=1.5, t=16, h=15);
        translate([0,0,0]) cylinder(d=6.1, h=111, center=true, $fn=50);
        rotate([0,0,0*120]) translate([7,0,5-1]) cylinder(d=1.8, h=100, center=true, $fn=50);
        rotate([0,0,1*120]) translate([7,0,5-1]) cylinder(d=1.8, h=100, center=true, $fn=50);
        rotate([0,0,2*120]) translate([7,0,5-1]) cylinder(d=1.8, h=100, center=true, $fn=50);

    }

}
module pacalog_15() {
    // bohrung 5.3
    a=12.4;
    b=33.3;
    h1=10; // breite des zahnrades
    h2=5; // tiefe ausschnitt
    h3=15; // höhe m8 gewinde



//    intersection() {
    rotate([180,0,0]) union() {

        difference() {
            //gear(m=1.5, h=8, t=83);
            union() {
                gear(m=1.5, h=h1, t=78);

            }
            translate([0,0,0]) cylinder(d=5.3, h=100, center=true, $fn=50);
            rotate([0,0,0*45]) translate([35,0,0]) sportplatz(d=15,l=30);
            rotate([0,0,1*45]) translate([35,0,0]) sportplatz(d=15,l=30);
            rotate([0,0,2*45]) translate([35,0,0]) sportplatz(d=15,l=30);
            rotate([0,0,3*45]) translate([35,0,0]) sportplatz(d=15,l=30);
            rotate([0,0,4*45]) translate([35,0,0]) sportplatz(d=15,l=30);
            rotate([0,0,5*45]) translate([35,0,0]) sportplatz(d=15,l=30);
            rotate([0,0,6*45]) translate([35,0,0]) sportplatz(d=15,l=30);
            rotate([0,0,7*45]) translate([35,0,0]) sportplatz(d=15,l=30);

            rotate([0,0,0*45+45/2]) translate([45,0,0]) translate([0,0,0]) cylinder(d=16, h=100, center=true, $fn=50);
            rotate([0,0,1*45+45/2]) translate([45,0,0]) translate([0,0,0]) cylinder(d=16, h=100, center=true, $fn=50);
            rotate([0,0,2*45+45/2]) translate([45,0,0]) translate([0,0,0]) cylinder(d=16, h=100, center=true, $fn=50);
            rotate([0,0,3*45+45/2]) translate([45,0,0]) translate([0,0,0]) cylinder(d=16, h=100, center=true, $fn=50);
            rotate([0,0,4*45+45/2]) translate([45,0,0]) translate([0,0,0]) cylinder(d=16, h=100, center=true, $fn=50);
            rotate([0,0,5*45+45/2]) translate([45,0,0]) translate([0,0,0]) cylinder(d=16, h=100, center=true, $fn=50);
            rotate([0,0,6*45+45/2]) translate([45,0,0]) translate([0,0,0]) cylinder(d=16, h=100, center=true, $fn=50);
            rotate([0,0,7*45+45/2]) translate([45,0,0]) translate([0,0,0]) cylinder(d=16, h=100, center=true, $fn=50);

            translate([0,0,h2/2+h1-h2]) cube([a,b,h2], center=true);
        }
        difference() {

            translate([0,0,h2/2+h1-h2]) cube([a,b/3,h2], center=true);
            translate([0,0,0]) cylinder(d=5.3, h=100, center=true, $fn=50);
        }
        difference() {

            translate([0,0,-h3/2]) cylinder(d=15, h=h3, center=true, $fn=50);
            translate([0,0,-h3/2]) cylinder(d=7.6, h=h3, center=true, $fn=50);
        }
    }
//        translate([40,0,0]) cube([100,20,22], center=true);
//    }
    //a=59.6+4-4;
//
    //translate([0,0,0]) cube([a+a,2,100], center=true);



}

module pacalog_16() {
    k=20; // kill
    w=1.5; // hakendurchgang
    dddd = 8.3; // abstand zur schwelle
    abstand = 2; // schwellenanddicke
    schwellen_innen_abstand = 7;
    hh=3.5; // höhe der halterung
    difference() {
        union() {
            translate([+24.2,0,0]) pacalog_17(l=50);
            translate([-24.2,0,0]) pacalog_17(l=50);
            translate([0,0,c_lego_1he/2]) lego_boxarea(x=10,y=2,h=1,center=true);
        }
        translate([0,25,0]) cube([100,50,100], center=true);
        translate([-24,-18,-k/2+10]) cube([15,15,k], center=true);
        translate([+30,-4,4]) cut_spax2x12(); /////////////////////////////// Spaxbohrungen
        translate([+30,-4,5+4]) cylinder(d=6, h=10, center=true, $fn=50); //// Spaxbohrungen
        translate([-30,-4,4]) cut_spax2x12(); /////////////////////////////// Spaxbohrungen
        translate([-30,-4,5+4]) cylinder(d=6, h=10, center=true, $fn=50); //// Spaxbohrungen
    }
    translate([0,-(25+dddd)/2,hh/2]) cube([10,25+dddd,hh], center=true);
    translate([0,-(25+dddd+abstand)/2,hh/2]) cube([w,25+dddd+abstand,hh], center=true);
    translate([0,schwellen_innen_abstand/2-25-schwellen_innen_abstand-dddd-abstand,hh/2]) cube([10,schwellen_innen_abstand,hh], center=true); // in schelle halter
}

module pacalog_17(l=10) {
    //3.2, 1.7, 16.5
    h=16.5;
    h2=3;
    translate([0,0,h-h2/2]) cube([2.7,l,h2], center=true);
    translate([0,0,h/2]) cube([1.7,l,16.5], center=true);


}

// deprecated
module pacalog_18() {
    r1=25;
    h1=6;
    r3=10.5/2;
    h3=6+10;
    r2=29;
    h2=1.5;
    kd=5.3; // kugel duschmesser
    kdd=5.3/2; // kugel durchmesser tiefe einborhung
    difference() {
        union() {
            translate([0,0,h1/2]) cylinder(d=2*r1, h=h1, center=true, $fn=150);
            translate([0,0,h3/2]) cylinder(d=2*r3, h=h3, center=true, $fn=150);
            translate([0,0,-h2/2]) cylinder(d=2*r2, h=h2, center=true, $fn=150);
        }
        translate([0,0,0]) cylinder(d=8.3, h=100, center=true, $fn=50);
        rotate([0,0,0*60]) translate([9,0,0]) cylinder(d=3.3, h=100, center=true, $fn=50);
        rotate([0,0,1*60]) translate([9,0,0]) cylinder(d=3.3, h=100, center=true, $fn=50);
        rotate([0,0,2*60]) translate([9,0,0]) cylinder(d=3.3, h=100, center=true, $fn=50);
        rotate([0,0,3*60]) translate([9,0,0]) cylinder(d=3.3, h=100, center=true, $fn=50);
        rotate([0,0,4*60]) translate([9,0,0]) cylinder(d=3.3, h=100, center=true, $fn=50);
        rotate([0,0,5*60]) translate([9,0,0]) cylinder(d=3.3, h=100, center=true, $fn=50);
        //rotate([0,0,0*120]) translate([10,0,-kd/2-h2+kdd]) sphere(d=kd, $fn=100);
        //rotate([0,0,1*120]) translate([10,0,-kd/2-h2+kdd]) sphere(d=kd, $fn=100);
        //rotate([0,0,2*120]) translate([10,0,-kd/2-h2+kdd]) sphere(d=kd, $fn=100);
        //translate([0,0,5+6-2]) speiche(r_from=12,r_to=20, cut_deg=30, space_deg=30, h=10);
    }


}
module pacalog_19() {
    difference() {

        union () {

            translate([40,0,0]) cylinder(d=23.25, h=2.33, center=true, $fn=50);
            translate([0,0,0]) cylinder(d=23.25, h=2.33, center=true, $fn=50);
            l=40;
            translate([l/2,0,0]) sportplatz(h=2.33, d=9, l=l);
        }
        //translate([6,-6,-5]) ZL() linear_extrude(10) text("1",15);
        translate([7,-6.5,-5]) ZL() linear_extrude(10) text("€",15);
        translate([40,0,0]) cylinder(d=16, h=2.33+1, center=true, $fn=50);
    }
}
module pacalog_20() {
    //LT(4) ZL() 
    difference() {
        elf_brick(2,2,1);
        translate([8,8,5/2+6.3]) cylinder(d=12, h=5, center=true, $fn=50);
        translate([8,8,0]) cylinder(d=4, h=100, center=true, $fn=50);
    }

}
module pacalog_21() {
    h=7;


    //LT(5,1.5) translate([0,0,3]) ZL()
    difference() {
        union() {
            translate([0,-6,h/2-3]) simpleframe(38, 16, 2, h, center=true);
            LT(0,2.5,0.5) elf_brick(3,5,1,center=true);
            LT(0,2.5,0.5) translate([0,0,-3]) elf_brick(3,5,1,center=true);
        }

        LT(+0.5,1) translate([0,0,0]) cylinder(d=2.65, h=100, center=true, $fn=50);
        LT(-0.5,1) translate([0,0,0]) cylinder(d=2.65, h=100, center=true, $fn=50);
        LT(+0.5,2) translate([0,0,0]) cylinder(d=2.65, h=100, center=true, $fn=50);
        LT(-0.5,2) translate([0,0,0]) cylinder(d=2.65, h=100, center=true, $fn=50);
        LT(+0.5,3) translate([0,0,0]) cylinder(d=2.65, h=100, center=true, $fn=50);
        LT(-0.5,3) translate([0,0,0]) cylinder(d=2.65, h=100, center=true, $fn=50);
        LT(+0.5,4) translate([0,0,0]) cylinder(d=2.65, h=100, center=true, $fn=50);
        LT(-0.5,4) translate([0,0,0]) cylinder(d=2.65, h=100, center=true, $fn=50);
    }

}
module pacalog_22() {
    translate([0,0,0]) cube([10,70,1], center=true);
}



module pacalog_23() {
    w=10;
    

    difference() {

        translate([-w/2,0,0]) YR() ZL() linear_extrude(w) polygon([[0, 0], [30, 0], [30, 2], [5, 2], [6, 10], [5, 10], [0, 2]]);
        translate([0,22,2.3]) cube([20,15,3], center=true);
        translate([-11.5,0,0]) rotate([0,0,-65]) cube([20,20,20], center=true);
        translate([+11.5,0,0]) rotate([0,0,+65]) cube([20,20,20], center=true);
    }


    translate([0,40,0]) difference() {

        translate([0,0,1]) cube([22,22,2], center=true);    
        LT(+0.5,+0.5) translate([0,0,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
        LT(-0.5,+0.5) translate([0,0,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
        LT(+0.5,-0.5) translate([0,0,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
        LT(-0.5,-0.5) translate([0,0,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
    }
}

module pacalog_24() {
    difference() {
        elf_brick(3,2,1);

        translate([8,8,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
        translate([16,8,0]) cylinder(d=3.8, h=100, center=true, $fn=50);

        translate([12,8,5+9.6-4]) sportplatz(d=9, l=18, h=10);
    }
}

module pacalog_25() {
    difference() {

        LT(0,0,-1) elf_brick(14,13,1);
        LT(7, 6.5) cylinder(d=7.4, h=100, center=true, $fn=50);

        translate([0,0,5]) cube([300,300,10], center=true);
        translate([8*1,8,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
        translate([8*2,8,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
        translate([8*3,8,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
        translate([8*4,8,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
        translate([8*5,8,0]) cylinder(d=3.8, h=100, center=true, $fn=50);

        translate([8*9,8,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
        translate([8*10,8,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
        translate([8*11,8,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
        translate([8*12,8,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
        translate([8*13,8,0]) cylinder(d=3.8, h=100, center=true, $fn=50);


        translate([8*1,8*12,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
        translate([8*2,8*12,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
        translate([8*3,8*12,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
        translate([8*4,8*12,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
        translate([8*5,8*12,0]) cylinder(d=3.8, h=100, center=true, $fn=50);

        translate([8*9,8 *12,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
        translate([8*10,8*12,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
        translate([8*11,8*12,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
        translate([8*12,8*12,0]) cylinder(d=3.8, h=100, center=true, $fn=50);
        translate([8*13,8*12,0]) cylinder(d=3.8, h=100, center=true, $fn=50);


    }
}
module pacalog_26() {
    YL() difference() {
        racktooth(m=1.5, h=5, n=20);
        translate([0,10*1,3]) rotate([0,90,0]) cylinder(d=3.2, h=100, center=true, $fn=50);
        translate([0,10*2,3]) rotate([0,90,0]) cylinder(d=3.2, h=100, center=true, $fn=50);
        translate([0,10*3,3]) rotate([0,90,0]) cylinder(d=3.2, h=100, center=true, $fn=50);
        translate([0,10*4,3]) rotate([0,90,0]) cylinder(d=3.2, h=100, center=true, $fn=50);
        translate([0,10*5,3]) rotate([0,90,0]) cylinder(d=3.2, h=100, center=true, $fn=50);
        translate([0,10*6,3]) rotate([0,90,0]) cylinder(d=3.2, h=100, center=true, $fn=50);
        translate([0,10*7,3]) rotate([0,90,0]) cylinder(d=3.2, h=100, center=true, $fn=50);
        translate([0,10*8,3]) rotate([0,90,0]) cylinder(d=3.2, h=100, center=true, $fn=50);
        translate([0,10*9,3]) rotate([0,90,0]) cylinder(d=3.2, h=100, center=true, $fn=50);
    }

}
module pacalog_27() {
tw=9; // teller width
difference() {

    LT(-17/2,-tw/2) elf_brick(17,tw,2,top_nop=0,bottom_nop=0);
    translate([0,0,-0.1]) pacalog_10_cut();

    translate([+50,0,25]) cube([20.2,150,20.2], center=true);
    translate([-50,0,25]) cube([20.2,150,20.2], center=true);

    translate([+64,    0*15, 0]) cylinder(d=2.5, h=100, center=true, $fn=50);
    translate([+64-28, 0*15, 0]) cylinder(d=2.5, h=100, center=true, $fn=50);
    translate([-64,    0*15, 0]) cylinder(d=2.5, h=100, center=true, $fn=50);
    translate([-64+28, 0*15, 0]) cylinder(d=2.5, h=100, center=true, $fn=50);

    translate([+64,    1*15, 0]) cylinder(d=2.5, h=100, center=true, $fn=50);
    translate([+64-28, 1*15, 0]) cylinder(d=2.5, h=100, center=true, $fn=50);
    translate([-64,    1*15, 0]) cylinder(d=2.5, h=100, center=true, $fn=50);
    translate([-64+28, 1*15, 0]) cylinder(d=2.5, h=100, center=true, $fn=50);

    translate([+64,    2*15, 0]) cylinder(d=2.5, h=100, center=true, $fn=50);
    translate([+64-28, 2*15, 0]) cylinder(d=2.5, h=100, center=true, $fn=50);
    translate([-64,    2*15, 0]) cylinder(d=2.5, h=100, center=true, $fn=50);
    translate([-64+28, 2*15, 0]) cylinder(d=2.5, h=100, center=true, $fn=50);

    translate([+64,    -1*15, 0]) cylinder(d=2.5, h=100, center=true, $fn=50);
    translate([+64-28, -1*15, 0]) cylinder(d=2.5, h=100, center=true, $fn=50);
    translate([-64,    -1*15, 0]) cylinder(d=2.5, h=100, center=true, $fn=50);
    translate([-64+28, -1*15, 0]) cylinder(d=2.5, h=100, center=true, $fn=50);

    translate([+64,    -2*15, 0]) cylinder(d=2.5, h=100, center=true, $fn=50);
    translate([+64-28, -2*15, 0]) cylinder(d=2.5, h=100, center=true, $fn=50);
    translate([-64,    -2*15, 0]) cylinder(d=2.5, h=100, center=true, $fn=50);
    translate([-64+28, -2*15, 0]) cylinder(d=2.5, h=100, center=true, $fn=50);

    translate([+50,-18,0]) ZL() sportplatz(h=50, d=5.2, l=20);
    translate([-50,-18,0]) ZL() sportplatz(h=50, d=5.2, l=20);
    translate([+50,+18,0]) ZL() sportplatz(h=50, d=5.2, l=20);
    translate([-50,+18,0]) ZL() sportplatz(h=50, d=5.2, l=20);

}


}
module pacalog_28() {
tw=1; // teller width
translate([-30,4,0]) difference() {
    translate([30,0,0]) LT(0,-tw/2) elf_brick(5,tw,1,top_nop=0,bottom_nop=0);
    translate([+50,0,15]) cube([20.2,150,20.2], center=true);
    translate([+64,    0*15, 0]) cylinder(d=3.5, h=100, center=true, $fn=50);
    translate([+64-28, 0*15, 0]) cylinder(d=3.5, h=100, center=true, $fn=50);
}
}
module pacalog_29() {
    difference() {
        elf_brick(2,7);
        LT(1,2) ZL() sportplatz(d=4,l=45);
    }

}


//! micro servo mount horizontal
module pacalog_30() {
    difference() {
        union() {
            LT(-2,-4) elf13_brick(3,8,1,center=false);

            bd=27.8; // bore distance
            bw=1.7; // bore width
            cw=24; // cut width == servo lengh
            translate([4,0,17]) YR() translate([8,0,0]) difference() {
                translate([-2-2,0,0]) cube([22,31+5,8], center=true);
                translate([-8,0,0]) cube([16,cw,9], center=true);
                translate([-8,+bd/2,0]) cylinder(d=bw, h=100, center=true, $fn=50);
                translate([-8,-bd/2,0]) cylinder(d=bw, h=100, center=true, $fn=50);
            }
        }

        LT(0,-3,0.3333) cut_spax2x12();
        LT(0,+3,0.3333) cut_spax2x12();

        LT(-1,-1,0.3333) cut_spax2x12();
        LT(-1,+1,0.3333) cut_spax2x12();
    }

}

module pacalog_32() {
    LT(2,2) 
    difference() {
        union() {
            difference() {
                union() {
                    elf13_brick(8,3);
                    LT(-2,-2) elf13_brick(3,5);
                    LT(-2+9,-2) elf13_brick(3,5);
                }
                translate([32,-10,0]) cube([55,30,10], center=true);
            }
            translate([-10+30+30+2,-1,0]) ZL()ZL()servo_mount(h=10, d=2.7);
        }
        LT(-1,-1,0.3333) cut_spax2x12();
        LT(-1+10,-1,0.3333) cut_spax2x12();
        LT(-1,+2,0.3333) cut_spax2x12();
        LT(-1+10,+2,0.3333) cut_spax2x12();
        LT(-1+5,+2,0.3333) cut_spax2x12();
        LT(-1+5-1,+2,0.3333) cut_spax2x12();
        LT(-1+5+1,+2,0.3333) cut_spax2x12();
        LT(-1+5-3,+2,0.3333) cut_spax2x12();
        LT(-1+5+3,+2,0.3333) cut_spax2x12();
    }
}
module pacalog_33() {
    difference() {
        elf_brick(2,2,bottom_nop=0,top_nop=0);
        translate([0,0,2]) LT(1,1) translate([0,0,0]) cylinder(d=2.5, h=100, center=true, $fn=50);
        translate([0,0,2]) LT(1,1) translate([0,0,0]) cylinder(d=4.85, h=10, center=true, $fn=50);
        translate([8,0,2.4]) rotate([90,0,0]) cylinder(d=1.7, h=100, center=true, $fn=50);
    }
    difference() {

        LT(2) elf13_brick(4,2);
        LT(3,1,0.3333) cut_spax2x12();
        LT(4,1,0.3333) cut_spax2x12();
        LT(5,1,0.3333) cut_spax2x12();
    }
}
module pacalog_34() {}
module pacalog_35() {}
module pacalog_36() {}
module pacalog_37() {}
module pacalog_38() {}
module pacalog_39() {}
module pacalog_40() {}
module pacalog_41() {}
module pacalog_42() {}
module pacalog_43() {}
module pacalog_44() {}
module pacalog_45() {}
module pacalog_46() {}
module pacalog_47() {}
module pacalog_48() {}
module pacalog_49() {}
module pacalog_50() {}
module pacalog_51() {}
module pacalog_52() {}
module pacalog_53() {}
module pacalog_54() {}
module pacalog_55() {}
module pacalog_56() {}
module pacalog_57() {}
module pacalog_58() {}
module pacalog_59() {}
module pacalog_60() {}
module pacalog_61() {}
module pacalog_62() {}
module pacalog_63() {}
module pacalog_64() {}
module pacalog_65() {}
