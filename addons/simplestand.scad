$fn=50;
tenting_angle=15;

m2_screws=[[27,9],[27,45],[115.1,47.1]];
m3_screws=[[50.6,60.5],[55.4,-2.2],[97.1,65.6],[115.1,-14.75]];


//foot_v2(33);
gripper(5);

module gripper(l){
    difference(){
        translate([149,46,0])
        rotate([0,180,0]) union(){
            l_screw = l;
            for(screw=m3_screws){
                translate(screw) cylinder(h=l_screw,d1=8,d2=5);
            }
            translate([0,0,5]){
                for(screw=m3_screws){
                    hull(){
                        translate(screw) cylinder(h=l_screw,d=5);
                        translate([75,25]) cylinder(h=l,d=5);
                    }
                }
            }
        }
        

        #assembly(0,0);
    }
}

module foot_v3(l){
// idea: same as two, but foldable
}


module foot_v2(l){
    difference(){

        translate([149,46,0])
        rotate([0,180+tenting_angle,0]) union(){


//            translate([m2_screws[2],2]) cylinder(h=12,d1=10,d2=3);
            translate(m3_screws[2]) cylinder(h=l,d1=8,d2=3);
            translate(m3_screws[3]) cylinder(h=l,d1=8,d2=3);
            translate([0,0,5]){
                hull(){
                    translate(m2_screws[2]) cylinder(h=l,d=3);
                    translate(m3_screws[2]) cylinder(h=l,d=3);
                }
                hull(){
                    translate(m2_screws[2]) cylinder(h=l,d=3);
                    translate(m3_screws[3]) cylinder(h=l,d=3);
                }
            }
        }
        

        #assembly();
        ground();
    }
}

module foot_v1(){
    difference(){
        translate([25,20,0]) rotate([0,15,0]) cube([15,80,35]);
        assembly();
        ground();
    }
}

module assembly(angle=tenting_angle,screws=1){
    translate([149,46,0]) rotate([0,180+angle,0]){
        pcb_underside();
        translate([0,0,-10]){ 
            scale([1,1,5]) pcb();
            if(screws==1){
                myscrews(12,3,4);
            }
        }
        if(screws==1){ myscrews(12,1.5,3); }
    }
}


module ground(){
    translate([0,0,-20])
    cube([200,200,20]);
}



module pcb(){
import("../output/cases/pcb.stl", convexity=3);
}

module pcb_underside(){
import("../output/cases/pcb_underside.stl", convexity=3);
}

module pcb_screws(){
import("../output/cases/screws.stl", convexity=3);
}


// just where PCB screws are but variable for better cutout
module myscrews(l,d1,d2){
    for(s=m2_screws) translate(s) cylinder(h=l,d=d1);
    for(s=m3_screws) translate(s) cylinder(h=l,d=d2);
}
