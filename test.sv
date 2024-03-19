class test extends uvm_test;
  
  `uvm_component_utils(test)
  
  environment env;
  sequence_a seq_a;
  sequence_b seq_b;
  
  function new(string name = "test", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = environment::type_id::create("env",this);
    
    seq_a = sequence_a::type_id::create("seq_a");
    seq_b = sequence_b::type_id::create("seq_b");
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq_a.start(env.agt_a.seqr_a);
    seq_b.start(env.agt_b.seqr_b);
    phase.drop_objection(this);
  endtask
  
endclass


