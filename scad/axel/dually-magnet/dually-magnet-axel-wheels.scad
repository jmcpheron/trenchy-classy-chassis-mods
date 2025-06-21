// Parameters
axle_length = 34;
axle_diameter = 8.2;
outer_rim_diameter = 15;
rim_depth = 5.4;
transition_height = 3;
resolution = 100;

// Magnet pocket parameters
magnet_diameter = 5.2;      // 5mm magnet with clearance - adjustable
magnet_thickness = 3.2;     // 3mm magnet with clearance - adjustable
pocket_inset = 0.8;         // Distance from rim edge to pocket
pocket_depth = magnet_thickness;         // Depth of magnet pockets

// Center the whole part on the origin
translate([0, 0, -axle_length/2]) {
    difference() {
        union() {
            // Main axle shaft
            cylinder(h = axle_length, d = axle_diameter, $fn = resolution);
            
            // Bottom rim with transition
            cylinder(h = rim_depth, d = outer_rim_diameter, $fn = resolution);
            translate([0, 0, rim_depth])
                cylinder(h = transition_height, d1 = outer_rim_diameter, d2 = axle_diameter, $fn = resolution);
            
            // Top rim with transition
            translate([0, 0, axle_length - rim_depth - transition_height])
                cylinder(h = transition_height, d1 = axle_diameter, d2 = outer_rim_diameter, $fn = resolution);
            translate([0, 0, axle_length - rim_depth])
                cylinder(h = rim_depth, d = outer_rim_diameter, $fn = resolution);
        }
        
        // Bottom magnet pocket
        translate([0, 0, pocket_inset])
            cylinder(h = pocket_depth + 0.1, d = magnet_diameter, $fn = resolution);
        
        // Top magnet pocket
        translate([0, 0, axle_length - pocket_depth - pocket_inset])
            cylinder(h = pocket_depth + 0.1, d = magnet_diameter, $fn = resolution);
    }
}