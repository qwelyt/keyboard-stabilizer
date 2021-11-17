$fn=30;

module ooo(r=0.5){
  offset(r)offset(-r*2)offset(r)children();
}

module costar(){
  module capPart(){
    linear_extrude(3.8)difference(){
      ooo()union(){
        square([7,3.3],center=true);
        translate([0.7,7/2,0])square([1.4,7],center=true);
      }
      square([5,1.3],center=true);
    }

    
    
  }
  module platePart(){
    linear_extrude(3.2)
    difference(){
      ooo(){
        square([14,2.2],center=true);
        translate([14/2-2/2,0,0]){
          square([2,7],center=true);
          translate([1,-7.2/2+2.5/2,0])square([6,2.5],center=true);
          
        }
        
        translate([-14/2+2/2,0,0]){
          square([2,7],center=true);
          translate([-4/4,-7/2+2/2,0])square([4,2],center=true);
        }
      }
      translate([14/2+0.8,-7/2+2.5/2+1,0])square([1.5,2],center=true);
    }
  }
  
  capPart();
  translate([0,-3,0])rotate([0,0,180])platePart();
}

costar();
