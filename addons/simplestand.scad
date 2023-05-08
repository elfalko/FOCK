$fn=50;
tenting_angle=15;

m2_screws=[[27,9],[27,45],[115.1,47.1]];
m3_screws=[[50.6,60.5],[55.4,-2.2],[97.1,65.6],[115.1,-14.75]];


foot_v2(33);

module foot_v2(l){
    difference(){

        translate([149,46,0])
        rotate([0,180+tenting_angle,0]){

            translate(m2_screws[2]) cylinder(h=l,d=10);
            translate(m3_screws[2]) cylinder(h=l,d=10);
            translate(m3_screws[3]) cylinder(h=l,d=10);
            translate([0,0,5]){
                hull(){
                    translate(m2_screws[2]) cylinder(h=l,d=10);
                    translate(m3_screws[2]) cylinder(h=l,d=10);
                }
                hull(){
                    translate(m2_screws[2]) cylinder(h=l,d=10);
                    translate(m3_screws[3]) cylinder(h=l,d=10);
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

module assembly(){
    translate([149,46,0])
    rotate([0,180+tenting_angle,0]){
        pcb_underside();
        translate([0,0,-10]){ 
            scale([1,1,5]) pcb();
            myscrews(12,3,4);
        }
        myscrews(12,1.5,3);
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
