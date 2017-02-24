/**
 * Servo outline library
 *
 * Authors:
 *   - Eero 'rambo' af Heurlin 2010-
 *  -  Oliv4945 - Add Turnigy TSS11-MGB servo. 24/02/17
 * License: LGPL 2.1
 */

use <triangles.scad>

/**
 * Align DS420 digital servo
 *
 * @param vector position The position vector
 * @param vector rotation The rotation vector
 * @param boolean screws If defined then "screws" will be added and when the module is differenced() from something if will have holes for the screws
 * @param number axle_lenght If defined this will draw "backgound" indicator for the main axle
 */
module alignds420(position, rotation, screws = 0, axle_lenght = 0)
{
	translate(position)
	{
		rotate(rotation)
	    {
			union()
			{
				// Main axle
				translate([0,0,17])
				{
					cylinder(r=6, h=8, $fn=30);
					cylinder(r=2.5, h=10.5, $fn=20);
				}
				// Box and ears
				translate([-6,-6,0])
				{
					cube([12, 22.8,19.5], false);
					translate([0,-5, 17])
					{
						cube([12, 7, 2.5]);
					}
					translate([0, 20.8, 17])
					{
						cube([12, 7, 2.5]);
					}
				}
				if (screws > 0)
				{
					translate([0,(-10.2 + 1.8),11.5])
					{
						# cylinder(r=1.8/2, h=6, $fn=6);
					}
					translate([0,(21.0 - 1.8),11.5])
					{
						# cylinder(r=1.8/2, h=6, $fn=6);
					}

				}
				// The large slope
				translate([-6,0,19])
				{
					rotate([90,0,90])
					{
						triangle(4, 18, 12);
					}
				}

				/**
				 * This seems to get too complex fast
				// Small additional axes
				translate([0,6,17])
				{
					cylinder(r=2.5, h=6, $fn=10);
					cylinder(r=1.25, h=8, $fn=10);
				}
				// Small slope
				difference()
				{
					translate([-6,-6,19.0])
					{
						cube([12,6.5,4]);
					}
					translate([7,-7,24.0])
					{
						rotate([-90,0,90])
						{
				            triangle(3, 8, 14);
						}
					}

				}
				*/
				// So we render a cube instead of the small slope on a cube
				translate([-6,-6,19.0])
				{
					cube([12,6.5,4]);
				}
			}
			if (axle_lenght > 0)
			{
				% cylinder(r=0.9, h=axle_lenght, center=true, $fn=8);
			}
		}
	}
}

/**
 * Futaba S3003 servo
 *
 * @param vector position The position vector
 * @param vector rotation The rotation vector
 */
module futabas3003(position, rotation)
{
	translate(position)
	{
		rotate(rotation)
	    {
			union()
			{
				// Box and ears
				translate([0,0,0])
				{
					cube([20.1, 39.9, 36.1], false);
					translate([1.1, -7.6, 26.6])
					{
                        difference() {
						    cube([18, 7.6, 2.5]);
                            translate([4, 3.5, 0]) cylinder(100, 2);
                            translate([14, 3.5, 0]) cylinder(100, 2);
                        }
					}

					translate([1.1, 39.9, 26.6])
					{
                        difference() {
                            cube([18, 7.6, 2.5]);
                            translate([4, 4.5, 0]) cylinder(100, 2);
                            translate([14, 4.5, 0]) cylinder(100, 2);
                        }
                    }
				}

				// Main axle
				translate([10, 30, 36.1])
				{
					cylinder(r=6, h=0.4, $fn=30);
					cylinder(r=2.5, h=4.9, $fn=20);
				}
			}
		}
	}
}


/**
 * Turnigy TSS-11MGB servo
 *
 * @param vector position The position vector
 * @param vector rotation The rotation vector
 */
module turnigyTSS11MGB(position, )
{
translate([6.05, 5.5, 0])
	{
	    {
			union()
			{
				// Main axle
				translate([0,0,25.8-1])
				{
					cylinder(r=12/2, h=3.8+1, $fn=30);
					cylinder(r=3.8/2, h=2.5+3.8+1, $fn=20);
				}
				// Box and ears
                    translate([-6.05,-5.5,0]) 
                        union() {
                            cube([12.1, 23.4,24], false);
                            translate([0,-4.7, 19.5]) {
                                difference() {  // Ear 1
                                    cube([12.1, 4.7, 1.55]);
                                     translate([6.05, 4.7/2, -1])
                                        cylinder(r=2/2, h=6, $fn=20);
                                }
                            }
                            translate([0,23.4, 19.5]) {
                                difference() {  // Ear 2
                                    cube([12.1, 4.7, 1.55]);
                                     translate([6.05, 4.7/2, -1])
                                        cylinder(r=2/2, h=6, $fn=20);
                                }
                            }
                    // Screw holes
              //      translate([0,(-5.5 - 4.7/2),18])
               //        #cylinder(r=2/2, h=6, $fn=20);
                   // translate([0,23.4-5.5+4.7/2,18])
                       // # cylinder(r=2/2, h=6, $fn=20);
                }

				// The large slope
				translate([-6.05,0,24])
				{
					rotate([90,0,90])
					{
						triangle(1.8, 23.4-5.5, 12.1);
					}
				}

				// So we render a cube instead of the small slope on a cube
				translate([-6.1,-5.5,24])
				{
					cube([12.1,5.5,1.8]);
				}
			}
		}
	}
}

// Tests:
module test_alignds420(){alignds420(screws=1);}
turnigyTSS11MGB();
//test_alignds420();