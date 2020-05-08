pragma solidity >=0.4.24;
 
 contract ExampleEnum {
     
     enum names {GIGI, Ishant, Maybe, Selena}
     
     function getEnum(uint8 arg) public pure returns (string memory){
         
         if(arg == uint8(names.GIGI)) return "GIGI" ;
         if(arg == uint8(names.Ishant)) return "Ishant";
         
         if(arg == uint8(names.Maybe)) return   "Maybe";
         if(arg == uint8(names.Selena))return "Selena";  
     } 
 }