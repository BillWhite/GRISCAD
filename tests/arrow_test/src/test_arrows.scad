include <GRISCAD/arrow.scad>

union() {
    color("red") {
        arrow(direction=[1, 1, 1], 
              scale=1, 
              start=[0, 0, 0]);
    }
    color("blue") {
        arrow(direction=[1, 0, 0],
            start=[1, 0, 0]);
    }
    color("yellow") {
        arrow(direction=[-1, 0, 1],
            start=[2, 0, 0]);
    }
}