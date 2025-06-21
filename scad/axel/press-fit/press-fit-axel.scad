// Parameters
axle_length = 33;
axle_diameter = 8.2;
outer_rim_diameter = 16;    // Rim diameter
rim_depth = 6;
transition_height = 3;      // Height of the transition/fillet
hole_diameter = 6;          // Diameter of the central hole
resolution = 100;           // Resolution for curved surfaces ($fn value)

// Phillips head parameters
phillips_depth = 2;         // Depth of the Phillips head cutout
phillips_width = 4;         // Width of each slot in the X
phillips_diameter = 10;      // Diameter of the Phillips head cutout

// Derived values
total_height = axle_length;

// Module for creating a Phillips head cutout
module phillips_head(diameter, width, depth, top_position) {
    if (top_position) {
        // Phillips head at the top
        union() {
            // First slot of the X
            translate([0, 0, total_height - depth/2])
                cube([diameter, width, depth], center=true);
            
            // Second slot of the X (rotated 90 degrees)
            translate([0, 0, total_height - depth/2])
                cube([width, diameter, depth], center=true);
        }
    } else {
        // Phillips head at the bottom
        union() {
            // First slot of the X
            translate([0, 0, depth/2])
                cube([diameter, width, depth], center=true);
            
            // Second slot of the X (rotated 90 degrees)
            translate([0, 0, depth/2])
                cube([width, diameter, depth], center=true);
        }
    }
}

// Center the whole part on the origin
translate([0, 0, -total_height/2]) {
    difference() {
        union() {
            // Main axle shaft
            cylinder(h = total_height, d = axle_diameter, $fn=resolution);
            
            // Bottom rim (flat on print plate, no transition on bottom)
            translate([0, 0, 0]) {
                // Rim cylinder
                cylinder(h = rim_depth, d = outer_rim_diameter, $fn=resolution);
                
                // Transition from rim to axle (only on the inner side)
                translate([0, 0, rim_depth])
                    cylinder(h = transition_height, d1 = outer_rim_diameter, d2 = axle_diameter, $fn=resolution);
            }
            
            // Top rim (flat on top, no transition on top)
            translate([0, 0, total_height - rim_depth]) {
                // Transition from axle to rim (only on the inner side)
                translate([0, 0, -transition_height])
                    cylinder(h = transition_height, d1 = axle_diameter, d2 = outer_rim_diameter, $fn=resolution);
                    
                // Rim cylinder
                cylinder(h = rim_depth, d = outer_rim_diameter, $fn=resolution);
            }
        }
        
        // Central hole through the entire axle
        cylinder(h = total_height + 0.2, d = hole_diameter, $fn=resolution, center = false);
        
        // Phillips head cutout on the top
        phillips_head(phillips_diameter, phillips_width, phillips_depth, true);
        
        // Phillips head cutout on the bottom
        phillips_head(phillips_diameter, phillips_width, phillips_depth, false);
    }
}