// Mobile Phone Holder


// General Thickness
T = 3.0;
// General Width
W = 5.0;


// Internal diameter of Circle.
Di = 23.5;
// Length of horizontal arms
A = 20.0;
// Length of bottom arms
B = 94.5;
// Height of Top holder
Ht = 20.0;
// Height of bottom holder
Hb = 12.0;
// Grapping length of top arms
Gt = 5.0;
// Grapping length of bottom bars
Gb = 6.0;
// Circle accuracy
$fn = 60;

mph();


module mph() {
  linear_extrude(T)
    difference() {
      circle(d=Di+W+W);
      circle(d=Di);
    }
  harm2();
  mirror([1,0,0])harm2();
  bot();
  mirror([1,0,0]) bot();
  translate([-Di/2-W,Di/2+W+B+T-W,0])
    linear_extrude(T)
      square([W+Di+W,W]);
    
  module bot() {
    translate([Di/2,0,0]) {
      linear_extrude(T)   square([W,Di/2+W+B+T]);
      translate([0,Di/2+W+B,0]) {
        linear_extrude(T+Hb+T)
          square([W,T]);
        translate([0,-Gb,T+Hb])
          linear_extrude(T)
            square([W,Gb+T]);
      }
    }
  }
  
  module harm2() {
    harm();
    mirror([0,1,0]) harm();
    translate([Di/2+W+A+T-W,-Di/2-W,0])
      linear_extrude(T)
        square([W,W+Di+W]);
  }
  module harm() {
    translate([0,Di/2,0]) {
      linear_extrude(T)
        square([Di/2+W+A+T,W]);
      translate([Di/2+W+A,0,0]) {
        linear_extrude(Ht+T+T)
          square([T,W]);
        translate([-Gt,0,T+Ht])
          linear_extrude(T)
            square([Gt+T,W]);
      }
    }
  }
}
// mph
