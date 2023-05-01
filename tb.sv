// This is a basic implementation of coverage model 
// which shows diffenreces between randc and rand functions
// uncomment for coverage bin applications to distinct coverage
// bins implementation
class my_class;
    rand bit [2:0] addr;
    randc bit [2:0] data;
    
    function void display();
      $display("[%t] address = 0x%h data = 0x%h", $time, addr, data);
      endfunction//display function
  endclass
  
  module tb;
  
    my_class my_inst;
    
  //   covergroup cover_group;
  //     c1: coverpoint my_inst.addr {
  //     	bins one = {1};
  //     	bins five = {5};
  //     }
  //     c2: coverpoint my_inst.data
  //     {
  //       bins zero = {0};
  //       bins three = {3};
  //     }
  //   endgroup: cover_group
    
    covergroup cover_group;
      c1: coverpoint my_inst.addr;
      c2: coverpoint my_inst.data;
    endgroup: cover_group
    
    initial begin
      
      cover_group cover_group_inst = new();
      my_inst = new();
      
      repeat(8) begin
        my_inst.randomize();
        my_inst.display();
        cover_group_inst.sample();
      end
      $display ("Coverage = %0.2f %%",  cover_group_inst.get_coverage());
    end
   
  endmodule