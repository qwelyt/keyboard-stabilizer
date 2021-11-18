$fn=30;
sep=3;

module ooo(r=0.5){
  offset(r)offset(-r*2)offset(r)children();
}

module kostar(){
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
  translate([0,-sep,0])rotate([0,0,180])platePart();
}

module sherryPlateMount(){
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
      union(){
        cube([8.2,6.5,11],center=true);
        translate([0,0,-0.1])cube([15.5,6.5,1.6],center=true);
        translate([1,0,-(6.2/2.58)])cube([12.1,6.5,6.2],center=true);
      }
      cube([6.2,4.5,12],center=true);
      translate([0,0,(11-3.7)/2])cube([4.2,7,3.71],center=true);
      translate([0,0,(11-3.7)/2])cube([9,2.5,3.71],center=true);
      
      translate([1,0,-3])cube([15,4.5,11/2],center=true);
      translate([-11/2,0,0])cube([2.8,4.2,11],center=true);
      translate([-8/2,0,0])cube([3,2.5,5],center=true);
    
        translate([15/2-1.7/2,0,-1.75])cube([1,7,1.7],center=true);
      
      translate([12.2/2,0,0])cube([4,3.4,1.7],center=true);
    }
    
    translate([0,0,-11/2+1/2]){
      translate([5.65,0,0])cube([2.8,6,1],center=true);
      translate([7,0,0])cube([5.4,3.5,1],center=true);
      translate([9,0,0.8])difference(){
        cube([1.5,6.5,2.6],center=true);
        translate([-1.7/2,0,0.5])rotate([90,0,0])cylinder(d=1.7,h=7,center=true);
      }
      
      
      
      translate([-9.1/2,0,0]){
        cube([1,6,1],center=true);
        translate([0,0,7.2/2-1/2])cube([1,2,7.2],center=true);
        
        hull(){
          translate([0,0,3/2])cube([1,2,4],center=true);
          translate([-1,0,4.5/2])cube([1,2,0.1],center=true);
        }
      }
    }
    
  }
  
  translate([0,sep,0])crossPart();
  mountPart();
}

kostar();
//sherryPlateMount();
