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

/*
  This file is part of GRISCAD.

  GRISCAD is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

  You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
*/
