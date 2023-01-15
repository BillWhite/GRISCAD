/***********************************************************************
 *
 * Functions for assemblies.
 *
 * The idea here is that one can include assemblies.scad, and
 * make assemblies, where an assembly is a single part made up of
 * other parts. This is not all that interesting on its own. But,
 * in addition, we can (1) define a cutting plane which cuts the
 * assembly and only shows part, and (2) draw an arrow to show the
 * direction the normal to the cut object.
 *
 * 1.) functions
 *     The function DEBUG_DELTA(coord) returns a 3 dimensional
 *     vector [coord, coord, coord]. It's useful for use in the
 *     parameter infinity below.
 * 2.) module assembly.
 *     Use the module assembly() to create the assembly. The children
 *     are the constituent objects. The result is the union of the
 *     children. For example,
 *        assembly() {
 *            cube([10,10,4]);
 *            translate([0, 0, 4]) {
 *                cylinder(10);
 *            }
 *        }
 *     makes a kind of a tower. The result is the union of the
 *     children.
 *
 *     The module assembly takes these parameters:
 *        debug               A boolean, which is true to debug
 *                            with a cutting plane. The default is
 *                            is false.
 *        normal              A non-zero vector pointing in the
 *                            direction of the plane to be cut out.
 *                            The cutting plane will be the face
 *                            with x=infinity. The normal to this
 *                            face will be this vector. The
 *                            default is [1, 0, 0], which points
 *                            out of the positive X axis.
 *        infinity            A vector with three large coordinates.
 *                            The cutting plane is one face of a
 *                            large cube of this size. DEBUG_DELTA
 *                            is useful here. The default is
 *                            DEBUG_DELTA(1000).
 *        offset              A value to offset the cutting plane.
 *                            Positive values will be offset along
 *                            the normal. Negative values will be 
 *                            offset in the opposite direction. The
 *                            default is 0.
 *        show_cutting_space  Sometimes it's useful to see the cutting
 *                            cube. If this is true only the cutting
 *                            cube will be displayed. The default is
 *                            false.
 *        arrow               If show_cutting_cube is true, and arrow
 *                            true, then an arrow will be drawn in
 *                            the normal direction from the center of
 *                            the cutting cube face. The default is
 *                            false.
 *        only_preview        Normally this debugging only affects
 *                            previews, and only_preview is true.
 *                            If only_preview is false, then debugging
 *                            affects rendered and exported designs.
 *                            the default is true.
 *
 * 3.) module arrow.
 *     The module arrow is independently useful. It draws an arrow
 *     given a direction and a beginning point. The parameters are:
 *         direction         The direction of the vector. This must be
 *                           non-zero.
 *         start             The starting point of the vector.
 *         arrow_shaft_h     The length of the arrow shaft.
 *         arrow_shaft_r     The radius of the arrow shaft.
 *         arrow_head_h      The length of the arrow head.
 *         arrow_head_r      The radius of the base of the arrow head.
 *
 ***********************************************************************/
include <GRISCAD/debug.scad>
include <GRISCAD/arrow.scad>

module cutting_space(infinity=DEBUG_INFINITY, 
                     normal=DEBUG_NORMAL,
                     offset=0,
                     arrow=false,
                     arrow_scale=1) {
    space_offset=[infinity[1]/2, 0, 0];
    assert(norm(normal) != 0, "Normal vector cannot be zero");
    unit_normal=normal/norm(normal);
    voffset=offset*unit_normal;
    unit_face=[-1, 0, 0];
    axis = (unit_normal == unit_face)
        ? [0, 0, 1]
        : cross(unit_face, unit_normal);
    angle=acos(unit_face*unit_normal);
    translate(voffset) {
        rotate(a=angle, v=axis) {
            union() {
                translate(space_offset) {
                    cube(infinity, center=true);
                }
                if (arrow) {
                    arrow(direction=unit_face,
                          start=offset*unit_face,
                          scale=arrow_scale);
                }
            }
        }
    }
}

module assembly(debug=false,
                normal=DEBUG_NORMAL,
                offset=DEBUG_OFFSET,
                only_preview=true,
                show_cutting_space=false,
                arrow=false,
                arrow_scale=1,
                infinity=DEBUG_INFINITY) {
    adebug=($preview) ? debug : !only_preview;
    if (adebug) {
        if (show_cutting_space) {
            cutting_space(infinity=infinity,
                          normal=normal,
                          offset=offset,
                          arrow=arrow,
                          arrow_scale=arrow_scale);
        } else {
            difference() {
                union() { children(); }
                cutting_space(infinity, normal, offset);
            }
        }
    } else {
        union() { children(); }
    }
}

/*
  This file is part of GRISCAD.

  GRISCAD is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

  You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
*/
