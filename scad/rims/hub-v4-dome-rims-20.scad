// Parameters
disk_diameter = 20;     // Diameter of the base disk in mm
disk_height = 7;       // Height of the base disk in mm (adjusted to match rim total height)
handle_diameter = 8;    // Diameter of the handle cylinder
handle_height = 12;     // Height of the handle cylinder
resolution = 100;       // Resolution for curved surfaces ($fn value)

// Phillips head parameters
phillips_height = 4;    // Height of the Phillips head protrusion
phillips_width_base = 3.8;  // Width of each arm at the base
phillips_width_top = 3.0;   // Width of each arm at the top (smaller for taper)
phillips_diameter_base = 9.8;  // Diameter of the Phillips head at the base
phillips_diameter_top = 8.0;   // Diameter of the Phillips head at the top (smaller for taper)

// Rim parameters
rim_notch_depth = 1.5;         // How deep the notch goes into the rim
rim_notch_height = 5.0;       // Height of the notch section
rim_bottom_lip_diameter = disk_diameter -1;  // Smaller diameter at bottom for tire mounting
rim_bottom_lip_height = 1.0;   // Height of the smaller bottom lip
rim_top_lip_height = 1.0;      // Height of the top lip

// Improved dome cutout parameters
bottom_cavity_diameter = 14;   // Diameter of the cavity at the bottom
mid_cavity_diameter = 14;      // Diameter in the middle where dome starts curving
top_cavity_diameter = 4;       // Maximum diameter at the top of the cavity
parallel_height = 3;           // Height of the parallel section before dome curvature
dome_height = 4;               // Height of the domed section
wall_thickness = 1.5;          // Minimum wall thickness

// Module to create a tapered Phillips head shape
module tapered_phillips_head(diameter_base, diameter_top, width_base, width_top, height) {
    taper_ratio = width_top / width_base;
    
    union() {
        // First arm of the X - tapered
        translate([0, 0, disk_height]) {
            linear_extrude(height = height, scale = [diameter_top/diameter_base, width_top/width_base], center = false) {
                translate([-diameter_base/2, -width_base/2, 0])
                    square([diameter_base, width_base]);
            }
        }
        
        // Second arm of the X - tapered (rotated 90 degrees)
        translate([0, 0, disk_height]) {
            linear_extrude(height = height, scale = [width_top/width_base, diameter_top/diameter_base], center = false) {
                translate([-width_base/2, -diameter_base/2, 0])
                    square([width_base, diameter_base]);
            }
        }
    }
}

// Module to create a wheel rim with outside notch for TPU tire
module wheel_rim_with_outside_notch() {
    union() {
        // Bottom section with smaller diameter for tire mounting
        cylinder(h = rim_bottom_lip_height, d = rim_bottom_lip_diameter, $fn = resolution);
        
        // Middle section with notch for tire
        translate([0, 0, rim_bottom_lip_height])
            cylinder(h = rim_notch_height, d = disk_diameter - 2 * rim_notch_depth, $fn = resolution);
        
        // Top lip to secure the tire
        translate([0, 0, rim_bottom_lip_height + rim_notch_height])
            cylinder(h = rim_top_lip_height, d = disk_diameter, $fn = resolution);
    }
}

// Improved module to create a dome-shaped cutout that starts parallel
// and then curves into a dome deeper in
module improved_dome_cutout() {
    // Bottom parallel section
    translate([0, 0, 0])
        cylinder(h = parallel_height, d = bottom_cavity_diameter, $fn = resolution);
    
    // Transition to domed section
    translate([0, 0, parallel_height])
        cylinder(h = dome_height, d1 = mid_cavity_diameter, d2 = top_cavity_diameter, $fn = resolution);
}

// Main component construction
difference() {
    union() {
        // Create the wheel rim with outside notch
        wheel_rim_with_outside_notch();
        
        // Tapered Phillips head protrusion on top of the disk
        tapered_phillips_head(
            phillips_diameter_base, 
            phillips_diameter_top, 
            phillips_width_base, 
            phillips_width_top, 
            phillips_height
        );
    }
    
    // Cut out the improved dome shape from the inside of the disc
    improved_dome_cutout();
}