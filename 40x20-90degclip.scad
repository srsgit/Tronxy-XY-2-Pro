// 40x20 profile ribbon cable clip 90 degree
//
// Tronxy XY-2 Pro ribbon cable clip
// Holds main ribbon cable vertical after it exits control box

TOLERANCE       = 0.2;
CABLE_WIDTH     = 45.0;
CABLE_THICKNESS = 2.0;
CLIP_WIDTH      = CABLE_WIDTH + 4.0;
PROFILE_HEIGHT  = 40.0 + TOLERANCE;
PROFILE_CLIP    =  6.8 + TOLERANCE;
CLIP_OVERHANG   =  1.5;

THICKNESS       =1.5;

outer_cube = [ CLIP_WIDTH, 
               PROFILE_CLIP   + THICKNESS * 2,
               PROFILE_HEIGHT + THICKNESS * 2 ];

inner_cube = [ CLIP_WIDTH, 
               PROFILE_CLIP,
               PROFILE_HEIGHT ];
              
slot_cube  = [ CLIP_WIDTH, 
               THICKNESS,
               PROFILE_HEIGHT - CLIP_OVERHANG * 2 ];
               
outer_cable_cube = [ CLIP_WIDTH, 
                     CABLE_THICKNESS + THICKNESS,
                     PROFILE_HEIGHT + THICKNESS * 2 ];
               
inner_cable_cube = [ CLIP_WIDTH - THICKNESS, 
                     CABLE_THICKNESS,
                     PROFILE_HEIGHT + THICKNESS * 2 ];
                     
rib_cube         = [ CLIP_WIDTH, 
                     THICKNESS,
                     THICKNESS ];

difference() {
  union() {
    difference() { cube( outer_cube, center = false);
                   translate([0, THICKNESS, THICKNESS])
                     cube( inner_cube, center = false);
               
                   translate([0, 
                              PROFILE_CLIP + THICKNESS,
                              CLIP_OVERHANG + THICKNESS])
                     cube( slot_cube, center = false);
    };
    
    difference() { translate([0,
                              -(CABLE_THICKNESS + THICKNESS),
                              0])
                     cube( outer_cable_cube, center = false);
                   translate([THICKNESS * 4,
                              -CABLE_THICKNESS,
                              0])
                     cube( inner_cable_cube, center = false);
    };

    translate([0,
               -(CABLE_THICKNESS + THICKNESS + THICKNESS),
               0])
      cube( rib_cube, center = false);  

    translate([0,
               -(CABLE_THICKNESS + THICKNESS + THICKNESS),
               PROFILE_HEIGHT/2 + THICKNESS/2])
      cube( rib_cube, center = false);   

    translate([0,
               -(CABLE_THICKNESS + THICKNESS + THICKNESS),
               PROFILE_HEIGHT + THICKNESS])
      cube( rib_cube, center = false);   
  }; 
  translate([-5,0, PROFILE_HEIGHT/2 + THICKNESS/2])
    rotate([90,0,0])
      cylinder(h=10, d=35, center=true); 

  translate([CLIP_WIDTH + 5, 0, PROFILE_HEIGHT/2 + THICKNESS/2])
    rotate([90,0,0])
      cylinder(h=10, d=35, center=true); 
}


