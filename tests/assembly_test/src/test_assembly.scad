include <GRISCAD/assemblies.scad>

assembly(debug=true,
         normal=[-1, 1, 1],
         infinity=DEBUG_DELTA(50),
         offset=0,
         show_cutting_space=false,
         arrow=true) {
    translate([0, 0, 2]) {
        difference() {
            cube([20, 20, 4], center=true, $fn=32);
            cube([10, 10, 2], center=true, $fn=32);
        }
    }
    translate([0, 0, 4]) {
        difference() {
            cylinder(h=20, r=5, $fn=32);
            translate([0, 0, 5]) {
                cylinder(h=10, r=2.5, $fn=32);
            }
        }
    }
}

