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
    w=4.1;
//    #translate([2,0,-0.35])cube([1,1,4.15]);
//    #translate([-3,0,1.5])cube([1,1,2.3]);
    difference(){
      union(){
        translate([0,0,(11.1-3.6)/2])
        linear_extrude(3.6)
        union(){
          square([1, 3.7],center=true);
          square([3.7,1],center=true);
        }
        cube([5.45,w,7.6],center=true);
        
        translate([0,w/2-1/2,-11.1/4-1/2])
          cube([7.5,1,1],center=true);
        translate([0,-w/2+1/2,-11.1/4-1/2])
          cube([7.5,1,1],center=true);
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
  w=6.6;
  lt=8.2;
  lb=12.6;
  
  sliderCutW=5;
  sliderCutL=6.7;
  
//  wireSize=1.6;
  wireSize=1.1;
      
    
  module mountPart() {
    #cube([14.05,1,1],center=true);

    module wireHolder(){
      translate([(3.2-wireSize)/2,0,0])cube([2-wireSize,1,3],center=true);
    }
    module wing(){
      hull(){
        cube([2,0.55,0.1],center=true);
        translate([0.49,0,-4.54])cube([1,0.55,0.1],center=true);
      }
    }
    

    
    difference(){
      union(){
        cube([lt,w,11],center=true);
        cube([15.5,w,1.6],center=true);
//        translate([1,0,-(6.2/2.58)])
        translate([1,0,-11/4.59])
          hull(){
            translate([0,0,6.2/2])cube([lb,w,0.2],center=true);
            translate([0.2,0,-6.2/2])cube([lb-0.4,w,0.01],center=true);
          }
      }
      
      
      union(){// sliderhole
        cube([sliderCutL,sliderCutW,12],center=true);
        translate([0,0,(11-3.7)/2]){
          cube([4.2,sliderCutL+1,3.71],center=true);
          cube([sliderCutW+4,2.5,3.71],center=true);
        }
      }
      
      
      // Bottom cut
      translate([1,0,-3])
        cube([15,4.5,11/2],center=true);
      
      // Backcut
      translate([-11/2,0,0]){
        cube([2.8,4.2,11],center=true);
        translate([3/2,0,0])
          cube([3,2.5,5],center=true);
      }
      
    
      // Front hook cut
      translate([15/2-(3-2.5)/2,0,-1.65])
        cube([3,7,1.7],center=true);
//      #translate([15/2-1.7/2,0,-1.65])
//        cube([1.7,7,1.7],center=true);
    
      // Front top cut
      translate([lb/2,0,0])
        cube([3.9,3.4,1.7],center=true);
    }
    
    
    translate([0,0,-11/2+1/2]){
      
      union(){// Front stab holder
        translate([5.65,0,0])
          cube([2.8,6,1],center=true);
        
        translate([7,0,0])
          cube([5.4,3.5,1],center=true);
        
        translate([9,0,0.8])difference(){
          cube([1.5,w,2.6],center=true);
          translate([-1.7/2,0,0.5])
            rotate([90,0,0])
              cylinder(d=wireSize+0.1,h=7,center=true);
        }
        
        // Extra wire holder
        translate([lb/2,0,1]){
          
          translate([0,w/2-1/2,0])wireHolder();
          translate([0,-w/2+1/2,0])wireHolder();
        }
        
        
      }
    
      
      
      
      // Peg part
      translate([-lb/2.89,0,0]){
        cube([1,w,1],center=true);
        translate([0,0,7.2/2-1/2])cube([1,2,7.2],center=true);
        
        peg=1.9;
        hull(){
          translate([0,0,3/2])cube([1,2,4],center=true);
          translate([-peg/2,0,4.5/2])cube([peg,2,0.1],center=true);
        }
      }
    }
    
    #translate([-0.85,-3.57,-0.91])wing();
    #translate([-0.85,3.57,-0.91])wing();
    #translate([-3.5,-3,-0.91])cube([3.4,1,0.1],center=true);
    #translate([-2.7,-3,-6])cube([3.75,1,1],center=true);
    #translate([0.65,-3,-3.2])cube([1,1,4.65],center=true);
    
//    translate([16/2,0,-3.5])
//    rotate([90,0,0]){
//      translate([0,0,w/2])cylinder(d=1.6,h=2,center=true);
//      translate([0,0,-w/2])cylinder(d=1.1,h=2,center=true);
//    }
  }
  
  translate([0,sep,0])crossPart();
  mountPart();

}

//kostar();
sherryPlateMount();
