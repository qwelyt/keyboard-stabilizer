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

module cherryPlateMount(){
  module crossPart() {
//    #translate([2,0,-0.35])cube([1,1,4.15]);
//    #translate([-3,0,1.5])cube([1,1,2.3]);
    difference(){
      union(){
        translate([0,0,(11.1-3.6)/2])
        linear_extrude(3.6)
        union(){
          square([1.1, 3.9],center=true);
          square([3.9,1.2],center=true);
        }
        cube([5.5,4.25,7.6],center=true);
        
        translate([0,4.25/2-1/2,-11.1/4-1/2])cube([8,1,1],center=true);
        translate([0,-4.25/2+1/2,-11.1/4-1/2])cube([8,1,1],center=true);
      }
      translate([2,0,-10/2+2.2])cube([4,2.2,5],center=true);
      translate([0,0,-10/2+3.2])cube([6,2.2,3],center=true);
      hull(){
        translate([-2.8,0,1.5])cube([0.1,2.2,0.01],center=true);
        translate([5.5/4,0,-3.8])cube([5.5/2,2.2,0.01],center=true);
      }
      hull(){
        translate([-2.8,0,1.5])cube([0.1,2.2,0.01],center=true);
        translate([0,0,-3.3])cube([5.5,2.2,0.01],center=true);
      }
    }
    
    
    
  }
  
  module mountPart() {
    difference(){
      cube([8.2,6.5,11],center=true);
      cube([6.2,4.5,12],center=true);
      translate([0,0,(11-3.7)/2])cube([4.2,7,3.71],center=true);
      translate([0,0,(11-3.7)/2])cube([9,2.5,3.71],center=true);
      
      #cube([8.75,4.5,11/2],center=true);
    }
    
  }
  
  translate([0,0,-15])crossPart();
  mountPart();
}

//costar();
cherryPlateMount();
