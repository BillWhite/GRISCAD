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

/*
  This file is part of GRISCAD.

  GRISCAD is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

  You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
*/
