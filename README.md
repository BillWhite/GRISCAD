## Overview
This is a library of tools I use to debug OpenScad projects. See below for installation.

## Modules
### `assembly`
An assembly is the union of its children. However, there are parameters which
can help to see the internal structure of the assembly.

The parameters specify a cutting plane which cuts the assembly in two parts. The 
cutting plane is given by a normal vector from the origin and an offset along the
normal vector. So, if the normal vector is [1, 1, 1] and the offset is 20, the cutting
plane will be the in the octant with all positive coordinates, 20mm from the
origin. This is defined by the set `{p ∈ R³ | p · [1, 1, 1] = 20}`. The 
geometry drawn will actually be `{p ∈ R³ | p · [1, 1, 1] <= 20}`.

#### Parameters
The parameters define whether and how to draw the cutting plane. The plane is
one side of an infinite cube, for some small, finite value of infinity. Many of
these are to visualize the cutting space itself.  Usually these parameters
are given by name.
1. `debug` (default=`false`)
   If this is `true` the cutting plane cuts the assembly.
1. `normal` (default=`[1, 0, 0]`)
   The vector pointing away from the cut object. This is `[1, 1,1]` in the example
   above.`
1. `offset` (default=`0`)
   The offset away from the origin. This is 20 in the example above.
1. `only_preview` (default=`true`)
   Only draw the cutting plane when previewing. For rendering act as if
   `debug=false`.
1. `show_cutting_space` (default=`false`)
   Draw only the cutting cube. This is for debugging.
1. `arrow` (default=false)
   If this is true, and if `show_cutting_space` is true, draw an
   arrow normal to the cutting plane. This is for debugging the
   cutting space.
1. `arrow_scale` (default=`1`)
1. `infinity` (default=`1000`)
   The value for infinity. Usually `1000mm`.

## Installation
Clone this project into your OpenScad library folder. For Linux this is `$HOME/.local/share/OpenScad/libraries`. Then include the top level files, for example, with:
```
include <GRISCAD/assemblies.scad>
```

## Example of Use.

```
include <GRISCAD/assemblies.scad>

assembly(debug=true,
         normal=[1, 1, 1],
         offset=0) {
    difference() {
        cube(20, 1, center=true);
        sphere(5);
    }
};
```
This will show a cube with a sphere inside it. If you preview it you
will see part of the sphere cut away. If you render it will see the
entire cube, but there will be a hole inside it.

