include <GRISCAD/debug.scad>

module arrow(direction=[1, 0, 0],
             start=[0, 0, 0],
             scale=1,
             arrow_shaft_length=10,
             arrow_shaft_radius=.5,
             arrow_head_h=2.5,
             arrow_head_r=1.25) {
    assert(norm(direction) != 0, "Parameter direction for arrow must be non-zero");
    unit_direction = direction/norm(direction);
    zaxis=[0, 0, 1];
    axis=(zaxis == unit_direction) ? zaxis : cross(zaxis, unit_direction);
    angle=(zaxis == unit_direction) ? 0 : acos(zaxis*unit_direction);
    translate(start) {
        scale(DEBUG_DELTA(scale)) {
            rotate(angle, axis) {
                union() {
                    cylinder(h=arrow_shaft_length,
                             r=arrow_shaft_radius,
                             $fn=32);
                    translate([0, 0, arrow_shaft_length]) {
                        cylinder(h=arrow_head_h,
                                 r1=arrow_head_r,
                                 r2=0, $fn=32);
                    }
                }
            }
        }
    }
}
