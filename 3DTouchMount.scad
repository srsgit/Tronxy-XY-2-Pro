// Tronxy XY-2 Pro 3D/BL Touch Mount
//
// replacement mount to fit a 3D Touc/BL Touch to a Tronxy XY-2 Pro

$fn = 36;

THICKNESS                  = 3.0;
HOTEND_HOLE_DIA            = 3.2;
BL_TOUCH_HOLE_DIA          = 3.2;

BL_TOUCH_HOLE_SPACING     = 18.0;
BL_TOUCH_LENGTH_STOWED    = 41.8;
BL_TOUCH_TOP_WIDTH        = BL_TOUCH_HOLE_SPACING + 8.0;
BL_TOUCH_TOP_DEPTH        = 11.6;
BL_TOUCH_Z_OFFSET_STOWED  =  2.5;
BL_TOUCH_X_OFFSET         =  4.0;
BL_TOUCH_Y_OFFSET         =  9.0;

BL_TOUCH_TAB_WIDTH        = BL_TOUCH_TOP_WIDTH;
BL_TOUCH_TAB_DEPTH        = BL_TOUCH_Y_OFFSET 
                              + BL_TOUCH_TOP_DEPTH/2
                              + THICKNESS; 

HOTEND_HOLE_HEIGHT        = 31.5;
HOTEND_HOLE_SPACING       = 11.0;
HOTEND_TAB_WIDTH          = HOTEND_HOLE_SPACING + 12;
HOTEND_TAB_DEPTH          = BL_TOUCH_Z_OFFSET_STOWED +                          + BL_TOUCH_LENGTH_STOWED 
                              - HOTEND_HOLE_HEIGHT + 6;
                              
CABLE_SLOT_WIDTH          = 12.0;
CABLE_SLOT_DEPTH          = 4.0;


// Base (tab against holend casing)
//
difference () {
  translate([-HOTEND_TAB_WIDTH/2, 0, -THICKNESS]) 
    cube([HOTEND_TAB_WIDTH, HOTEND_TAB_DEPTH + THICKNESS, THICKNESS],     center = false);

  //mounting hole
  translate([-HOTEND_HOLE_SPACING/2, 6, -THICKNESS/2])
    cylinder(h=THICKNESS, d=HOTEND_HOLE_DIA, center=true);

  //mounting hole
  translate([HOTEND_HOLE_SPACING/2, 6, -THICKNESS/2])
    cylinder(h=THICKNESS, d=HOTEND_HOLE_DIA, center=true);
}

// Top (BLTouch mounting)
//
difference () {
  translate([-BL_TOUCH_TAB_WIDTH/2 + BL_TOUCH_X_OFFSET, 
              HOTEND_TAB_DEPTH + THICKNESS, -THICKNESS])
    rotate([90,0,0]) {
      difference() {
        // top plate
        cube([BL_TOUCH_TAB_WIDTH, BL_TOUCH_TAB_DEPTH, THICKNESS], 
              center = false);
      
        //mounting hole
        translate([-BL_TOUCH_HOLE_SPACING/2
                     + BL_TOUCH_TAB_WIDTH/2,
                    BL_TOUCH_Y_OFFSET + THICKNESS, 
                    THICKNESS/2])
          cylinder(h=THICKNESS, d=HOTEND_HOLE_DIA, center=true);
        
        //mounting hole
        translate([BL_TOUCH_HOLE_SPACING/2 
                     + BL_TOUCH_TAB_WIDTH/2, 
                    BL_TOUCH_Y_OFFSET + THICKNESS, 
                    THICKNESS/2])
          cylinder(h=THICKNESS, d=HOTEND_HOLE_DIA, center=true);

        //cable slot
        translate([BL_TOUCH_TAB_WIDTH/2 - CABLE_SLOT_WIDTH/2, 
                   THICKNESS,
                   0])
          cube([CABLE_SLOT_WIDTH,CABLE_SLOT_DEPTH,THICKNESS], center=false);
      }
    }
}

