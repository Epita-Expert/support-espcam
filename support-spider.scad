$fn = 100;
margin = 0.125;

shell_holed_foot_base_radius = 3.5;
shell_holed_foot_hole_radius = 2.5;
shell_holed_foot_base_height = 50;
shell_holed_foot_hole_height = 5.0 + margin;

motherboard_holes_spacing = 47.0;

/* Set to true to visualize motherboard footprint, set to false before generating and exporting your custom shell */
check_footprint = false;

/* Four feet (for most shells) */
four_feet(motherboard_holes_spacing, shell_holed_foot_base_radius, shell_holed_foot_hole_radius, shell_holed_foot_base_height, shell_holed_foot_hole_height);

///////////////////////////////////////////////////////
/*    Feet description for building custom shell     */
///////////////////////////////////////////////////////

// Foot with hole to plug above screw head
module holed_foot(base_radius, hole_radius, base_height, hole_height) {
    difference() {
        // Base
        cylinder(r=base_radius+2*margin, h = base_height);
        // Hole
        translate([0,0,-margin]) {
            cylinder(r=hole_radius+2*margin, h = hole_height+2*margin);
        }
    }
}

// Two feet positionnement to hold a custom shell
module two_feet(feet_spacing, holed_foot_base_radius, holed_foot_hole_radius, holed_foot_base_height, holed_foot_hole_height) {        

    translate([-feet_spacing/2.0,-feet_spacing/2.0,-margin]) {
        holed_foot(holed_foot_base_radius, holed_foot_hole_radius, holed_foot_base_height, holed_foot_hole_height);
    }
    
    translate([feet_spacing/2.0,feet_spacing/2.0,-margin]) {
        holed_foot(holed_foot_base_radius, holed_foot_hole_radius, holed_foot_base_height, holed_foot_hole_height);
    }
}

// Four feet positionnement to hold a custom shell
module four_feet(feet_spacing, holed_foot_base_radius, holed_foot_hole_radius, holed_foot_base_height, holed_foot_hole_height) {
        
    translate([-feet_spacing/2.0,-feet_spacing/2.0,-margin]) {
        holed_foot(holed_foot_base_radius, holed_foot_hole_radius, holed_foot_base_height, holed_foot_hole_height);
    }
    
    translate([feet_spacing/2.0,-feet_spacing/2.0,-margin]) {
        holed_foot(holed_foot_base_radius, holed_foot_hole_radius, holed_foot_base_height, holed_foot_hole_height);
    }

    translate([feet_spacing/2.0,feet_spacing/2.0,-margin]) {
        holed_foot(holed_foot_base_radius, holed_foot_hole_radius, holed_foot_base_height, holed_foot_hole_height);
    }
    
    translate([-feet_spacing/2.0,feet_spacing/2.0,-margin]) {
        holed_foot(holed_foot_base_radius, holed_foot_hole_radius, holed_foot_base_height, holed_foot_hole_height);
    }
}

///////////////////////////////////////////////////////
/*      Mother board footprint for visualisation     */
///////////////////////////////////////////////////////

footprint_mother_board_width = 55.0;
footprint_mother_board_lenght = 60.0;
footprint_mother_board_height = 2.0;
footprint_arduino_width = 18.0;
footprint_arduino_lenght = 43.0;
footprint_arduino_height = 13.0;

footprint_left_components_width = 13.0;
footprint_left_components_lenght = 41.0;
footprint_left_components_height = 13.0;

footprint_right_components_width = 15.0;
footprint_right_components_lenght = 30.0;
footprint_right_components_height = 13.0;
    
footprint_pinheaders_width = 33.0;
footprint_pinheaders_lenght = 8.0;
footprint_pinheaders_height = 22.0;

footprint_power_block_width = 10.0;
footprint_power_block_lenght = 8.0;
footprint_power_block_height = 10.0;

footprint_switch_width = 8.0;
footprint_switch_lenght = 8.0;
footprint_switch_height = 12.0;

footprint_capablock_width = 10.0; 
footprint_capablock_lenght = 22.0;
footprint_capablock_height = 11.0;

/* Visualize if checks activated */
if (check_footprint) {
    translate([0, 6.5/2.0,  0]) {
        motherboard_footprint(footprint_mother_board_width, footprint_mother_board_lenght, footprint_mother_board_height, footprint_arduino_width, footprint_arduino_lenght, footprint_arduino_height, footprint_left_components_width, footprint_left_components_lenght, footprint_left_components_height, footprint_power_block_width, footprint_power_block_lenght, footprint_power_block_height, footprint_switch_width, footprint_switch_lenght, footprint_switch_height, footprint_pinheaders_width, footprint_pinheaders_lenght, footprint_pinheaders_height, footprint_capablock_width, footprint_capablock_lenght, footprint_capablock_height);
    }
}

/* Footprint of the motherboard */
module motherboard_footprint(mother_board_width, mother_board_lenght, mother_board_height, arduino_width, arduino_lenght, arduino_height, left_components_width, left_components_lenght, left_components_height, power_block_width, power_block_lenght, power_block_height, switch_width, switch_lenght, switch_height, pinheaders_width, pinheaders_lenght, pinheaders_height, capablock_width, capablock_lenght, capablock_height) {       
    // Mother board
    color("blue")
    translate([-mother_board_width/2.0,-mother_board_lenght/2.0,-mother_board_height]) {
        cube([mother_board_width, mother_board_lenght,mother_board_height]);
    }
    // Arduino
    color("green")
    translate([-arduino_width/2.0,mother_board_lenght/2.0-arduino_lenght,0]) {
        cube([arduino_width,arduino_lenght,arduino_height]);
    }
    // Power block    
    color("red")
    translate([-arduino_width/2.0-power_block_width,mother_board_lenght/2.0-power_block_lenght,0]) {
        cube([power_block_width, power_block_lenght, power_block_height]);
    }
    // Switch
    color("orange")
    translate([-arduino_width/2.0-switch_width,mother_board_lenght/2.0-power_block_lenght-2.0-switch_lenght,0]) {
        cube([switch_width, switch_lenght, switch_height]);
    }
    // Servo-Motors pin headers
    color("black")
    translate([-pinheaders_width/2.0,-mother_board_lenght/2.0,0]) {
        cube([pinheaders_width, pinheaders_lenght, pinheaders_height]);
    }
    // Capacitor left block
    color("cyan")
    translate([-arduino_width/2.0-capablock_width-3,mother_board_lenght/2.0-power_block_lenght-2.0-switch_lenght-1.0-capablock_lenght,0]) {
        cube([capablock_width, capablock_lenght, capablock_height]);
    }
    // Capacitor right block
    color("cyan")
    translate([mother_board_width/2.0-capablock_width-2.0,-mother_board_lenght/2.0+pinheaders_lenght+1,0]) {
        cube([capablock_width, capablock_lenght, capablock_height]);
    }    
}


///////////////////////////////////////////////////////
/*              Custom shells description            */
///////////////////////////////////////////////////////

// power supply block
length_espCam_back = 29;
width_espCam_back = 4;

// without power supply block :)
length_espCam_front = 26;
width_espCam_front = 2.5;

space_between = 7;

// Put your custom functions here
difference() {
    translate([-27,-27, shell_holed_foot_base_height - 2]) {
        minkowski() {
            cube([55,55,2]);
            cylinder(r=2,h=2,$fn=50);
        }
    }
    translate([-15,0, shell_holed_foot_base_height - 2.1]) {
        minkowski() {
            cube([length_espCam_back, width_espCam_back, 2 + 10]);
            cylinder(r=1,h=2+0.1,$fn=50);
        }
    }
    translate([-13.3,-4.5 - space_between, shell_holed_foot_base_height - 2.1]) {
        minkowski() {
            cube([length_espCam_front, width_espCam_front, 2 + 10]);
            cylinder(r=1,h=2+0.1,$fn=50);
        }
    }
}

