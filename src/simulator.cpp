#include "simulator/simulator.h"
#include <cstring>
#include <fstream>
#include <sstream>
#include <string>
#include <iostream>
#include <bitset>
#include <random>
#include <iomanip>
#include "../../../../../../../usr/include/c++/8/iomanip"



// init memory, pc, register
Simulator::Simulator(MemoryManager* memory) {
  this->memory=memory;
  this->pc=0;
  for (int i=0; i<32;i++) this->reg[i]=0;
}

//memo destructor suffices
Simulator::~Simulator() {
}

// init register, init memory (set to 0) according to stack base address and max size
void Simulator::init_stack(uint32_t base_addr, uint32_t max_size) {
  // stack: 0x80000000-0x7FC00000, allocate 1 byte to each address
  this->reg[sp]        = base_addr;
  this->stack_base     = base_addr;
  this->max_stack_size = max_size;
  // set each address to 0, add page if there is none
  for (uint32_t addr = base_addr; addr > base_addr - max_size; addr--) {
    if (!this->memory->is_page_exit(addr)) {
      this->memory->add_page(addr);
    }
    this->memory->set_byte(addr, 0);
  }
}

void Simulator::simulate() {
/*
Now pc is at the entry point of memory, which is the start of the execution


fetch 32-bit instruction from memory
> refresh f_reg_new and f_reg
> pass pc,offest, and 32-bit inst

decode it by RV32I isa
> refresh d_reg_new and d_reg
> pass insttype, rs1, rs2, dst, op1, op2, pc, and offset

execute by insttype
> refresh e_reg_new and e_reg
> pass *out->output value, pc, offset, memo length regarding load and store op, 
  read or write flags

memory read or write by 8, 16, or 32 bits
> refresh m_reg_new and m_reg
> pass pc, offset, read or write flags

write back
> write on regs except reg zero
*/

  // initialize pipeline registers

  // insert Bubble to later pipeline stages when fetch the first instruction

  // main simulation loop


if (single_step&&pipeline_mode){pipelineSingleStep();}

else if (single_step){simulateSingleStep();}

else if(dump_asm){

  std::ofstream outputFile("dump_asm.txt");//
  if (!outputFile.is_open()) {
        std::cerr << "Failed to open dump_asm.txt." << std::endl;
        exit(-1);
    }

  


  while (true) {
    // set $zero to 0, some instruction might set this register to non-zero
    this->reg[zero]=0; 
    // check stack overflow
    if (reg[sp]<(this->stack_base-this->max_stack_size)){
      printf("-----------------------------------\n");
      printf("sp : 0x%X\n",this->reg[sp]);
      error("stack overflow - sp is under 0x0x7FC00000",this->pc);}

/* mem check : f_reg = 17->20 Bytes
std::cout << "Size of bool: " << sizeof(bool) << " byte(s)" << std::endl;
std::cout << "Size of inst: " << sizeof(Instruction) << " byte(s)" << std::endl;
std::cout << "Size of ui32: " << sizeof(uint32_t) << " byte(s)" << std::endl;
std::cout << "Size of in32: " << sizeof(int32_t) << " byte(s)" << std::endl;
*/

    //5-stage streamline flag refresh
    memset(&this->f_reg, 0, sizeof(this->f_reg));
    memset(&this->f_reg_new, 0, sizeof(this->f_reg_new));
    memset(&this->d_reg, 0, sizeof(this->d_reg));
    memset(&this->d_reg_new, 0, sizeof(this->d_reg_new));
    memset(&this->e_reg, 0, sizeof(this->e_reg));
    memset(&this->e_reg_new, 0, sizeof(this->e_reg_new));
    memset(&this->m_reg, 0, sizeof(this->m_reg));
    memset(&this->m_reg_new, 0, sizeof(this->m_reg_new));

    // Write pc to the file
    pc_outstream << "0x" << std::hex << std::uppercase << std::setfill('0') << std::setw(8) << this->pc<<"  ";
    std::string currentPC = pc_outstream.str();
    outputFile << currentPC;
    pc_outstream.str("");

    this->fetch();
    this->f_reg=this->f_reg_new;
    this->decode();
    this->d_reg=this->d_reg_new;
    this->excecute();
    this->e_reg=this->e_reg_new;
    this->memory_access();
    this->m_reg=this->m_reg_new;
    this->write_back();

    outputFile<<this->command_line_outstream.str();
    this->command_line_outstream.str("");
  }
  outputFile.close();
}

else if(pipeline_mode){simulatePipeline();}

else if (history_mode){
  while(true){
    mainloop();
    this->history.cycle_count++;
    this->history.inst_count++;}
  }

else{while(true){
  mainloop();
}
}

}

// update pc and f_reg_new
void Simulator::fetch() {
  //check fetch addr
  if(this->pc % 2 != 0){
    error("Wrong fetching addr",this->pc);
  }
  
  uint32_t inst = this->memory->get_int(this->pc);
  uint32_t inst_len = 4;

  if(pipeline_mode&&single_step){
    // printf("fetching 0x%08X\n",this->pc);

    // std::bitset<8> binary_1(inst>>24);
    // std::bitset<8> binary_2(inst>>16);
    // std::bitset<8> binary_3(inst>>8);
    // std::bitset<8> binary_4(inst);
    // std::cout << "fetched  0b" << binary_1<<" "<< binary_2<<" "<< binary_3<<" "<< binary_4<<" " << std::endl;
    // printf("-------------Fetch_Done------------\n");
  }

  // this->f_reg_new.stall = false;
  // this->f_reg_new.bubble = false;
  this->f_reg_new.inst=inst;
  this->f_reg_new.len=inst_len;
  this->f_reg_new.pc=this->pc; //this instruction
  this->pc=this->pc + inst_len; //next instruction
  


}


void Simulator::decode() {

// if (this->f_reg.stall>0) {
//   printf("decode stalled\n");
//   this->pc = this->pc-4;return;}

// if (this->f_reg.bubble) { //bubbled or getnothing
//     printf("d_reg  bubbled by f_reg\n");
//     this->d_reg_new.bubble = true;
//     return;}

// if (this->f_reg.inst == 0) { //bubbled or getnothing
//     printf("d_reg bubbled by empty fetch\n");
//     this->d_reg_new.bubble = true;
//     return;}


uint32_t inst               = f_reg.inst;
uint32_t pc                 = f_reg.pc;
uint32_t inst_len           = f_reg.len;
Instruction instruction_name = Instruction::UNKNOWN;

if(inst_len == 4){

  std::string operName = "";
  std::string instType = "";
  std::string rdName   = "";
  std::string rs1Name  = "";
  std::string rs2Name  = "";
  std::string immVal   = "";
  
  uint32_t opcode  = inst & 0x7F; // opcode[6:0]
  uint32_t funct3  = (inst >> 12) & 0x7; // func3[14:12]
  uint32_t funct7  = (inst >> 25) & 0x7F; // func7[31:25]
  uint32_t funct10 = uint32_t(funct3|(funct7<<3)); // funct7 + funct3
  uint32_t rd  = (inst >> 7) & 0x1F; // rd[11:7]
  uint32_t rs1 = (inst >> 15) & 0x1F; // reg1[19:15]
  uint32_t rs2 = (inst >> 20) & 0x1F; // reg2[24:20]

  //immediate i-type :  inst[31:20]
  int32_t imm_i = int32_t(inst) >> 20;
  //immediate s-type :  inst[31:25][11:7]
  int32_t imm_s = int32_t(((inst >> 7) & 0x1F) | ((inst >> 20) & 0xFE0)) << 20 >> 20;
  //immediate s-type : inst[31][7][30:25][11:8]
  int32_t imm_b = int32_t(((inst >> 7) & 0x1E) | ((inst >> 20) & 0x7E0) |((inst << 4) & 0x800) | ((inst >> 19) & 0x1000))<< 19 >>19;
  //immediate u-type :  inst[31:12]  
  int32_t imm_u = int32_t(inst) >> 12;
  //immediate j-type : inst[31][19:12][20][30:21]
  int32_t imm_j = int32_t(((inst >> 21) & 0x3FF) | ((inst >> 10) & 0x400) |((inst >> 1) & 0x7F800) | ((inst >> 12) & 0x80000))<< 12 >>11;




  if(pc == this->breakpoint){
  std::bitset<8> binary_11(inst>>24);
  std::bitset<8> binary_21(inst>>16);
  std::bitset<8> binary_31(inst>>8); 
  std::bitset<8> binary_41(inst);
  std::cout << "decoded  0b" << binary_11<<" "<< binary_21<<" "<< binary_31<<" "<< binary_41<<" " << std::endl;
  std::bitset<7> binary_opcode(opcode);
  std::cout << "opcode   0b" << binary_opcode<< std::endl;
  std::bitset<3> binary_funct3(funct3);
  std::cout << "funct3   0b" << binary_funct3<< std::endl;
  std::bitset<7> binary_funct7(funct7);
  std::cout << "funct7   0b" << binary_funct7<< std::endl;
  std::bitset<10> binary_funct10(funct10);
  std::cout << "funct10  0b" << binary_funct10<< std::endl;
  std::bitset<5> binary_rd(rd);
  std::cout << "rd       0b" << binary_rd<< std::endl;
  std::bitset<5> binary_rs1(rs1);
  std::cout << "rs1      0b" << binary_rs1<< std::endl;
  std::bitset<5> binary_rs2(rs2);
  std::cout << "rs2      0b" << binary_rs2<< std::endl;
  // std::bitset<12> binary_imm_i(imm_i);
  // std::cout << "imm_i    0b" << binary_imm_i<< std::endl;
  // std::bitset<12> binary_imm_s(imm_s);
  // std::cout << "imm_s    0b" << binary_imm_s<< std::endl;
  // std::bitset<12> binary_imm_b(imm_b);
  // std::cout << "imm_b    0b" << binary_imm_b<< std::endl;
  // std::bitset<20> binary_imm_u(imm_u);
  // std::cout << "imm_u    0b" << binary_imm_u<< std::endl;
  // std::bitset<20> binary_imm_j(imm_j);
  // std::cout << "imm_j    0b" << binary_imm_j<< std::endl;
  printf("-----------------------------------\n");
  }
//these flags indicating the opcode case identification - jump error for undefined cases
  bool isError1 = false;
  bool isError2 = false;
// opcode decoder is specifically designed based on RV32I manual, other extention can be developed, please refer to "The RISC-V Instruction Set ManualVolume I: User-Level ISA", 2017
  switch(opcode)
  {
    case OP_REG: // 0110011 
      instType = "R";  
      switch (funct10)
      {
      case 0b0000000000:
        operName = "ADD";
        instruction_name = ADD;
        break;
      case 0b0100000000:
        operName = "SUB";
        instruction_name = SUB;
        break;  
      case 0b0000000001:
        operName = "SLL";
        instruction_name = SLL;
        break;
      case 0b0000000010:
        operName = "SLT";
        instruction_name = SLT;
        break;
      case 0b0000000011:
        operName = "SLTU";
        instruction_name = SLTU;
        break;
      case 0b0000000100:
        operName = "XOR";
        instruction_name = XOR;
        break;
      case 0b0000000101:
        operName = "SRL";
        instruction_name = SRL;
        break;
      case 0b0100000101:
        operName = "SRA";
        instruction_name = SRA;
        break;
      case 0b0000000110:
        operName = "OR";
        instruction_name = OR;
        break;
      case 0b0000000111:
        operName = "AND";
        instruction_name = AND;
        break;
      default:
        isError1 = true;
      } 
      if(isError1) error("Undefined Reg Command",f_reg.pc);
      isError1 = false;
      break;
    case OP_IMM: // 0010011
      instType = "I";
      // printf("%d\n",funct3);
      switch (funct3)
      { 
      case 0b000:
        operName = "ADDI";
        instruction_name = ADDI;
        break;
      case 0b010:
        operName = "SLTI";
        instruction_name = SLTI;
        break;  
      case 0b011:
        operName = "SLTIU";
        instruction_name = SLTIU;
        break;
      case 0b100:
        operName = "XORI";
        instruction_name = XORI;
        break;
      case 0b110:
        operName = "ORI";
        instruction_name = ORI;
        break;
      case 0b111:
        operName = "ANDI";
        instruction_name = ANDI;
        break;
      default:
        isError1 = true;
        break;
      } 
      switch (funct10)
      {
        case 0b0000000001:
          operName ="SLLI";
          instruction_name = SLLI;
          break;
        case 0b0000000101:
          operName ="SRLI";
          instruction_name = SRLI;
          break;
        case 0b0100000101:
          operName ="SRAI";
          instruction_name = SRAI;
          break;
        default:
          isError2 = true;
          break;
      }
      if(isError1&isError2) error("Undefined IMM Command",f_reg.pc);
      isError1 = false;
      isError2 = false;
      break;
    case OP_LUI: // 0110111
      instType = "U";
      operName = "LUI";
      instruction_name = LUI;
      break;
    case OP_BRANCH: // 1100011
      instType = "B";
      switch (funct3)
      {
      case 0b000:
        operName = "BEQ";
        instruction_name = BEQ;
        break;
      case 0b001:
        operName = "BNE";
        instruction_name = BNE;
        break;  
      case 0b100:
        operName = "BLT";
        instruction_name = BLT;
        break;
      case 0b101:
        operName = "BGE";
        instruction_name = BGE;
        break;
      case 0b110:
        operName = "BLTU";
        instruction_name = BLTU;
        break;
      case 0b111:
        operName = "BGEU";
        instruction_name = BGEU;
        break;
      default:
        isError1 = true;
      } 
      if(isError1) error("Undefined Branch Command",f_reg.pc);
      isError1 = false;
      break;
    case OP_STORE: // 0100011
      instType = "S";
      switch (funct3)
      {
      case 0b000:
        operName = "SB";
        instruction_name = SB;
        break;
      case 0b001:
        operName = "SH";
        instruction_name = SH;
        break;  
      case 0b010:
        operName = "SW";
        instruction_name = SW;
        break;
      default:
        isError1 = true;
      } 
      if(isError1) error("Undefined Store Command",f_reg.pc);
      isError1 = false;
      break;
    case OP_LOAD: // 0000011
      instType = "I";
      switch (funct3)
      {
      case 0b000:
        operName = "LB";
        instruction_name = LB;
        break;
      case 0b001:
        operName = "LH";
        instruction_name = LH;
        break;  
      case 0b010:
        operName = "LW";
        instruction_name = LW;
        break;
      case 0b100:
        operName = "LBU";
        instruction_name = LBU;
        break;
      case 0b101:
        operName = "LHU";
        instruction_name = LHU;
        break;
      default:
        isError1 = true;
      } 
      if(isError1) error("Undefined Load Command",f_reg.pc);
      isError1 = false;
      break;
    case OP_SYSTEM: // 1110011 
      //only ecall is listed, can be extended for other architecture
      instType = "I";
      operName = "ECALL";
      instruction_name = ECALL;
      break;
    case OP_AUIPC: // 0010111
      instType = "U";
      operName = "AUIPC";
      instruction_name = AUIPC;
      break;
    case OP_JAL: // 1101111
      instType = "J";
      operName = "JAL";
      instruction_name = JAL;
      break;
    case OP_JALR: // 1100111
      instType = "I";
      operName = "JALR";
      instruction_name = JALR;
      break;
    default:  

      for (int i = 3; i >= 0; --i) { //print out instruction code
        std::cout << std::bitset<8>((inst >> (i * 8)) & 0xFF) << (i > 0 ? " " : "");}
        std::cout << std::endl;

      error("Nondefined Opcode",f_reg.pc);
  }

/*
Based on the decoded reg codes and imm, load to op1(rs1), 
op2(rs2 or imm), dest(dst), and offset(branch imm)
*/

  if (single_step&&!pipeline_mode)printf("Instruction PC : 0x%08X >\n",pc);
  

  if (instType == "R"){
    d_reg_new.dest = this->reg[rd];
    d_reg_new.op1  = this->reg[rs1];
    d_reg_new.op2  = this->reg[rs2];

    if(single_step|dump_asm){
    rdName=instNumToString(rd);
    rs1Name=instNumToString(rs1);
    rs2Name=instNumToString(rs2);
    this->command_line=operName+"  "+rdName+", "+rs1Name+", "+rs2Name;
    printf("%s\n",this->command_line.c_str());
    this->command_line_outstream << std::setfill(' ')<< std::setw(20)<< std::left<<this->command_line<<"\n";
    }

  }
  else if (instType == "I"&&operName!="ECALL"){
    d_reg_new.dest = this->reg[rd];
    d_reg_new.op1  = this->reg[rs1];
    d_reg_new.offset  = imm_i;

    if(single_step|dump_asm){
    rdName=instNumToString(rd);
    rs1Name=instNumToString(rs1);
    this->command_line=operName+"  "+rdName+", "+rs1Name+", ";
    printf("%s 0x%08X 0b%d\n",this->command_line.c_str(),imm_i,imm_i);
    this->command_line_outstream << std::setfill(' ')<< std::setw(20)<< std::left<<this->command_line
    <<" 0x" << std::hex << std::uppercase << std::setfill('0') << std::right<< std::setw(8) << imm_i
    <<" 0b" << std::dec << std::uppercase << imm_i<<"\n";
    }
  }
  else if (operName=="ECALL"){
    d_reg_new.op1 = this->reg[a0];
    d_reg_new.op2 = this->reg[a7];
    rs1=a0;
    rs2=a7;
    rd=a0;
    if(single_step|dump_asm){
    this->command_line=operName;
    printf("%s\n",this->command_line.c_str());}
    }
  else if (instType == "S"){
    d_reg_new.op1  = this->reg[rs1];
    d_reg_new.op2  = this->reg[rs2];
    d_reg_new.offset  = imm_s;

    if(single_step|dump_asm){
    rdName=instNumToString(rd);
    rs1Name=instNumToString(rs1);
    rs2Name=instNumToString(rs2);
    this->command_line=operName+"  "+rs2Name+", (offset)"+rs1Name;
    printf("%s 0x%08X 0b%d\n",this->command_line.c_str(),imm_s,imm_s);
    this->command_line_outstream << std::setfill(' ')<< std::setw(20)<< std::left<<this->command_line
    <<" 0x" << std::hex << std::uppercase << std::setfill('0') << std::right<< std::setw(8) << imm_s
    <<" 0b" << std::dec << std::uppercase << imm_s<<"\n";
    }

    

  }
  else if (instType == "B"){
    d_reg_new.op1  = this->reg[rs1];
    d_reg_new.op2  = this->reg[rs2];
    d_reg_new.offset  = imm_b;

    if(single_step|dump_asm){
    rs1Name=instNumToString(rs1);
    rs2Name=instNumToString(rs2);
    this->command_line=operName+"  "+rs1Name+", "+rs2Name;
    printf("%s 0x%08X 0b%d\n",this->command_line.c_str(),imm_b,imm_b);
    this->command_line_outstream << std::setfill(' ')<< std::setw(20)<< std::left<<this->command_line
    <<" 0x" << std::hex << std::uppercase << std::setfill('0') << std::right<< std::setw(8) << imm_b
    <<" 0b" << std::dec << std::uppercase << imm_b<<"\n";
    }

    
  }
  else if (instType == "U"){
    d_reg_new.dest = this->reg[rd];
    d_reg_new.offset  = imm_u;

    if(single_step|dump_asm){
    rdName=instNumToString(rd);
    this->command_line=operName+"  "+rdName;
    printf("%s 0x%08X 0b%d\n",this->command_line.c_str(),imm_u,imm_u);
    this->command_line_outstream << std::setfill(' ')<< std::setw(20) << std::left<<this->command_line
    <<" 0x" << std::hex << std::uppercase << std::setfill('0') << std::right<< std::setw(8) << imm_u
    <<" 0b" << std::dec << std::uppercase << imm_u<<"\n";
    }
    
  }
  else if (instType == "J"){
    d_reg_new.dest = this->reg[rd];
    d_reg_new.offset  = imm_j;
    
    if(single_step|dump_asm){
    rdName=instNumToString(rd);
    this->command_line=operName+"  "+rdName;
    printf("%s 0x%08X 0b%d\n",this->command_line.c_str(),imm_j,imm_j);
    this->command_line_outstream << std::setfill(' ')<< std::setw(20)<< std::left<<this->command_line
    <<" 0x" << std::hex << std::uppercase << std::setfill('0') << std::right<< std::setw(8) << imm_j
    <<" 0b" << std::dec << std::uppercase << imm_j<<"\n";
    }
    
  }else{error("NO such instruction type",f_reg.pc);}



  if(pc == this->breakpoint)
  {
    printf("inst     %s\n",operName.c_str());
    printf("instType %s\n",instType.c_str());
    printf("destID   0x%08X  val  0x%08X\n",rd,reg[rd]);
    printf("reg1ID   0x%08X  val  0x%08X\n",rs1,reg[rs1]);
    printf("reg2ID   0x%08X  val  0x%08X\n",rs2,reg[rs2]);
    printf("imm      0x%08X\n",d_reg_new.offset);
    printf("-------------Decode_Done------------\n");
  }

  // this->d_reg_new.stall = false;

  // this->d_reg_new.bubble = false;

  this->d_reg_new.rs1_ID  = rs1;
  this->d_reg_new.rs2_ID  = rs2;
  this->d_reg_new.rd_ID   = rd;
  this->d_reg_new.inst = instruction_name;
  this->d_reg_new.pc   = pc;

}
else{error("NOT 32-bit instruction",f_reg.pc);}




}

// execute instruction, deal with bubble and stall, check hazard and forward
// data update pipeline register
void Simulator::excecute() {
  // if (this->d_reg.stall>0) {
  //   printf("Execute: Stall\n");
  //   return;
  // }
  // if (this->d_reg.bubble) {
  //   printf("e_reg bubbled by d_reg\n");
  //   this->e_reg_new.bubble = true;
  //   return;
  // }

  //the following are register values loaded
  uint32_t pc    = this->d_reg.pc;
  int32_t op1    = this->d_reg.op1;
  uint32_t op1_unsigned = uint32_t(op1);
  int32_t op2    = this->d_reg.op2;
  uint32_t op2_unsigned = uint32_t(op2);
  int32_t offset = this->d_reg.offset;
  // uint32_t rd    = this->d_reg.dest;
  Instruction instruction_name = this->d_reg.inst;
  int32_t output = 0;
  int32_t byte_len = 0;

  bool read_signed_mem = false;
  bool read_unsigned_mem = false;
  bool write_mem = false;
  bool write_reg = false;
  bool jump_pc = false;
  uint32_t jump_addr = 0;
  // printRegAll();

  switch (instruction_name)
  {
//special case 3
  case LUI:
    write_reg = true;
    output = offset<<12;
    break;
  case AUIPC:
    write_reg = true;
    output = pc + (offset<<12);
    break;
  case ECALL:
    write_reg = true;
    // output = handle_system_call(this->reg[a0],this->reg[a7]);
    output = handle_system_call(op1,op2);
    break;

//jump and link  2  
  case JAL: 
    jump_pc = true;
    write_reg = true;
    output = pc + 4;
    jump_addr = pc + offset;
    break;
  case JALR:
    jump_pc = true;
    write_reg = true;
    output = pc + 4;
    jump_addr = (op1 + offset)&(~(uint32_t(1))); //remove last bit
    break;

//jump but no link 6
  case BEQ: 
    jump_pc = true;
    jump_addr = (op1 == op2) ? (pc + offset) : pc + 4;
    break;
  case BNE:
    jump_pc = true;
    jump_addr = (op1 != op2) ? (pc + offset) : pc + 4;  
    break;
  case BLT:
    jump_pc = true;
    jump_addr = (op1 <op2) ? (pc + offset) : pc + 4;
    break;
  case BGE:
    jump_pc = true;
    jump_addr = (op1 >= op2) ? (pc + offset) : pc + 4;
    break;
  case BLTU:
    jump_pc = true;
    jump_addr = (op1_unsigned < op2_unsigned) ? (pc + offset) : pc + 4;
    break;
  case BGEU:
    jump_pc = true;
    jump_addr = (op1_unsigned >= op2_unsigned) ? (pc + offset) : pc + 4;
    break;
  
//load 5
  case LB:
    read_signed_mem = true;
    output = op1 + offset;
    byte_len = 1;
    break;
  case LH:
    read_signed_mem = true;
    output = op1 + offset;
    byte_len = 2; 
    break;
  case LW:
    read_signed_mem = true;
    output = op1 + offset;
    byte_len = 4; 
    break;
  case LBU:
    read_unsigned_mem = true;
    output = op1 + offset;
    byte_len = 1; 
    break;
  case LHU:
    read_unsigned_mem = true;
    output = op1 + offset;
    byte_len = 2; 
    break;
    
//store 3
  case SB:
    write_mem = true;
    output = op1 + offset;
    byte_len = 1;
    break;
  case SH:
    write_mem = true;
    output = op1 + offset;
    byte_len = 2;
    break;
  case SW:
    write_mem = true;
    output = op1 + offset;
    byte_len = 4;
    break;
  
//alu 9
  case ADDI:
    write_reg = true;
    output = op1 + offset;
    break;
  case ADD:
    write_reg = true;
    output = op1 + op2;
    break;
  case SUB:
    write_reg = true;
    output = op1 - op2 ;
    break;
  case XORI:
    write_reg = true;
    output = op1 ^ offset;
    break;
  case XOR:
    write_reg = true;
    output = op1 ^ op2;
    break;
  case ORI:
    write_reg = true;
    output = op1 | offset;
    break;
  case OR:
    write_reg = true;
    output = op1 | op2;
    break;
  case ANDI:
    write_reg = true;
    output = op1 & offset;
    break;
  case AND:
    write_reg = true;
    output = op1 & op2;
    break;

//comparation 3
  case SLTI:
    write_reg = true;
    output = (op1 < offset) ? 1 : 0 ;
    break;
  case SLTIU:
    write_reg = true;
    output = (op1_unsigned < (uint32_t)offset) ? 1 : 0 ;
    break;
  case SLT:
    write_reg = true;
    output = (op1 < op2) ? 1 : 0 ;
    break;
  case SLTU:
    write_reg = true;
    output = (op1_unsigned < op2_unsigned) ? 1 : 0 ;
    break;
  
//bit move 6
  case SLL:
    write_reg = true;
    output = op1_unsigned << op2;
    break;
  case SLLI: //offset[5]=0 -> slide shamt bits
    write_reg = true;
    output = (((offset>>5)&0x1)==0) ? (op1_unsigned << (offset&0x3F)) : output;
    break;
  case SRL:
    write_reg = true;
    output = op1_unsigned >> op2;
    break;
  case SRLI:
    write_reg = true;
    output = (((offset>>5)&0x1)==0) ? (op1_unsigned >> (offset&0x3F)) : output;
    break;
  case SRA:
    write_reg = true;
    output = op1 >> op2;
    break;
  case SRAI:
    write_reg = true;
    output = (((offset>>5)&0x1)==0) ? (op1 >> (offset&0x3F)) : output;
    break;
  default:
    error("Instruction Unfound in execution",pc);
  }

  // if(pc == this->breakpoint){
  //   printf("pc       0x%08X\n",pc);
  //   printf("op1      0x%08X 0b%-10d\n",op1,op1);
  //   printf("op2      0x%08X 0b%-10d\n",op2,op2);
  //   printf("dest     0x%08X 0b%-10d\n",rd,rd);
  //   printf("offset   0x%08X 0b%-10d\n",offset,offset);
  //   printf("output   0x%08X 0b%-10d\n",output,output);
  //   printf("--------------Exe_Done-------------\n");
  // }
  
  this->e_reg_new.stall = false;
  this->e_reg_new.bubble = false;
  this->e_reg_new.pc=pc;
  this->e_reg_new.inst=instruction_name;
  this->e_reg_new.mem_len=byte_len;
  this->e_reg_new.op1=this->d_reg.op1;
  this->e_reg_new.op2=this->d_reg.op2;
  this->e_reg_new.out=output;
  this->e_reg_new.read_signed_mem   = read_signed_mem;
  this->e_reg_new.read_unsigned_mem = read_unsigned_mem;
  this->e_reg_new.write_mem = write_mem;
  this->e_reg_new.write_reg = write_reg;
  this->e_reg_new.rd_ID=this->d_reg.rd_ID;
  if (jump_pc){
    this->e_reg_new.jump_addr= jump_addr;
    this->e_reg_new.jump_pc= jump_pc;
  }


// printf("dop1 %d dop2 %d erd %d \n",this->d_reg_new.rs1_ID,this->d_reg_new.rs1_ID,this->e_reg_new.rd_ID);

//   // if((this->d_reg_new.rs1_ID==this->e_reg_new.rd_ID)||(this->d_reg_new.rs2_ID==this->e_reg_new.rd_ID)){
//     // this->f_reg={};
//     // this->d_reg={};
//     this->f_reg.stall = 2;
//     this->d_reg.stall = 2;
//     this->pc=this->pc-8;
  // }
    






  
}

// memory access, deal with bubble and stall
void Simulator::memory_access() {

  // if (this->e_reg.stall>0) {printf("memory access stalled\n");return;}

  // if (this->e_reg.bubble) {
  //   printf("m_reg bubbled by e_reg\n");
  //   this->m_reg_new.bubble = true;
  //   return; }

  uint32_t pc = this->e_reg.pc;
  Instruction instruction_name = this->e_reg.inst;
  uint32_t byte_len = this->e_reg.mem_len;
  uint32_t op1= this->e_reg.op1;
  uint32_t op2= this->e_reg.op2;
  // uint32_t rd = 0;
  bool read_unsigned_mem = this->e_reg.read_unsigned_mem;
  bool read_signed_mem = this->e_reg.read_signed_mem;
  bool write_mem = this->e_reg.write_mem;
  bool write_reg = this->e_reg.write_reg;
  int32_t output = this->e_reg.out;
  // uint32_t read_unsigned_mem_out = 0;
  // int32_t read_signed_mem_out = 0;



  if (read_unsigned_mem){
    switch (byte_len)
    {
    case 1:
      this->m_reg_new.out=uint32_t(this->memory->get_byte(output));
      break;
    case 2:
      this->m_reg_new.out=uint32_t(this->memory->get_short(output));
      break;
    case 4:
      this->m_reg_new.out=uint32_t(this->memory->get_int(output));
      break;
    default:
      error("Cannot read unsigned memory",pc);
    }
    this->m_reg_new.write_reg = read_unsigned_mem;
    this->m_reg_new.dest_reg = this->e_reg.rd_ID;
  }
  
  if (read_signed_mem){
      switch (byte_len)
    {
    case 1:
      this->m_reg_new.out=int32_t(this->memory->get_byte(output));
      break;
    case 2:
      this->m_reg_new.out=int32_t(this->memory->get_short(output));
      break;
    case 4:
      this->m_reg_new.out=int32_t(this->memory->get_int(output));
      break;
    default:
      error("Cannot read signed memory",pc);
    }
    this->m_reg_new.write_reg = read_signed_mem;
    this->m_reg_new.dest_reg = this->e_reg.rd_ID;

  }
  
  if (write_mem){
    switch (byte_len)
    {
    case 1:
      this->memory->set_byte(output,uint8_t(op2));
      break;
    case 2:
      this->memory->set_short(output,uint16_t(op2));
      break;
    case 4:
      this->memory->set_int(output,uint32_t(op2));
      break;
    default:
      error("Cannot write memory",pc);
    }
  }

  if (write_reg){ // only flag goes to register write back
    // rd = output;
    this->m_reg_new.write_reg = write_reg;
    this->m_reg_new.inst=instruction_name;
    this->m_reg_new.op1=op1;
    this->m_reg_new.op2=op2;
    this->m_reg_new.out=output;
    this->m_reg_new.pc=pc;
    this->m_reg_new.dest_reg = this->e_reg.rd_ID; //target register
  }

  if (this->e_reg.jump_pc){
    this->m_reg_new.jump_addr= e_reg.jump_addr;
    this->m_reg_new.jump_pc= e_reg.jump_pc;
  }
  
  // this->m_reg_new.stall = false;
  // this->m_reg_new.bubble = false;

  // if(pc == this->breakpoint){
  //   printf("Memory access at 0x%08X\n",pc);
  //   printf("RU %1d output 0x%08X from 0x%08X\n",read_unsigned_mem,read_unsigned_mem_out,output);
  //   printf("RS %1d output 0x%08X from 0x%08X\n",read_signed_mem,read_signed_mem_out,output);
  //   printf("WM %1d input  0x%08X at   0x%08X\n",write_mem,op1,output);
  //   printf("WR %1d input  0x%08X\n",write_reg,rd);
  //   printf("\n-------------Memo_Done-------------\n");}

}
// write result to register, deal with bubble and stall
// check for data hazard and forward data
// update pipeline register
void Simulator::write_back() {
  // if (this->m_reg.stall>0) {printf("write access stalled\n");return;}
  // if (this->m_reg.bubble) {printf("write bubbled by m_reg\n");return;}

  if (this->m_reg.write_reg){ this -> reg[this->m_reg.dest_reg] = this->m_reg.out;}
  if (this->m_reg.jump_pc){ this -> pc = this->m_reg.jump_addr;}


}

// handle system according to system call number in reg a7
// exit program using exit(0);
int32_t Simulator::handle_system_call(int32_t a0, int32_t a7) { 
  if (a7==0){
    uint32_t start_addr = uint32_t(a0);
    while (uint32_t(this->memory->get_byte(start_addr)) != 0){
      char ch = this->memory->get_byte(start_addr);
      printf("%c",ch);
      start_addr++;
      }
    }
  else if (a7==1){printf("%c",char(a0));}
  else if (a7==2){printf("%d",a0);}
  else if (a7==3){
    if(history_mode){
      printf("Number of cycles : %d\n",this->history.cycle_count);
      printf("Number of instructions : %d\n",this->history.cycle_count);}
  exit(EXIT_SUCCESS);}
  else if (a7==4){
    char ch;
    if(scanf("%c", &ch)==1) {
      return ch;
    }
    
    else error("char read error",this->pc);
    }
  else if (a7==5){
    long long int lld;
    if(scanf("%lld", &lld)==1) {
      return lld;
      // printf("0x%08X\n",this->reg[10]);
      
    }
    else error("lld read error",this->pc);
    }
  else {error("Undefined a7 during ECALL",this->d_reg.pc);}
  return 0; }


void Simulator::printRegAll(){
  printf("---------Previous Registers-------------New Registers-----------\n");
  
  for (int i=0; i<32;i++) {
    std::string str = instNumToString(i);
    
  printf("x%-2d %-4s 0x%08X 0d%011d  -->  0x%08X 0d%011d\n",i,str.c_str(),this->old_reg[i],this->old_reg[i],this->reg[i],this->reg[i]);
  }
  printf("----------------------------------------------------------------\n");
}

std::string Simulator::instNumToString(int i)
{
  switch (i) {
        case 0: return "zero";
        case 1: return  "ra";
        case 2: return  "sp";
        case 3: return  "gp";
        case 4: return  "tp";
        case 5: return  "t0";
        case 6: return  "t1";
        case 7: return  "t2";
        case 8: return  "s0";
        case 9: return  "s1";
        case 10: return  "a0";
        case 11: return  "a1";
        case 12: return  "a2";
        case 13: return  "a3";
        case 14: return  "a4";
        case 15: return  "a5";
        case 16: return  "a6";
        case 17: return  "a7";
        case 18: return  "s2";
        case 19: return  "s3";
        case 20: return  "s4";
        case 21: return  "s5";
        case 22: return  "s6";
        case 23: return  "s7";
        case 24: return  "s8";
        case 25: return  "s9";
        case 26: return  "s10";
        case 27: return  "s11";
        case 28: return  "t3";
        case 29: return  "t4";
        case 30: return  "t5";
        case 31: return  "t6";
        default: return  "Unknown";
    }

}

void Simulator::error(const std::string& message,uint32_t addr){
  printf("-----------------------------------\n");
  printf("Current addr : 0x%08X\n",addr);
  std::cerr << "Error : " << message << std::endl;
    exit(EXIT_FAILURE);
}

void Simulator::simulateSingleStep(){
  std::string input;
  this->breakpoint = 0;
do {
    printf("enter [q]         - quit           | [c]          - continue\n");
    printf("enter [s]         - print stack    | [nothing]    - step command\n");
    printf("enter [b 0x100e0] - set breakpoint | [lw 0x100e0] - get 32-bit stored\n");
    printf("----------------------------------------------------------------\n\n");
    std::getline(std::cin, input);
    if (input == "q") break; // break the program

    else if (input.substr(0, 4) == "b 0x") {
      this->breakpoint=0;
      try {
          this->breakpoint = std::stoul(input.substr(4), nullptr, 16);
          std::cout << "Breakpoint set at PC : 0x" << std::hex << this->breakpoint << std::dec << std::endl;
          continue;
      } catch (const std::exception& e) {
          std::cout << "Invalid hexadecimal format. Please try again." << std::endl;continue;
      }}

    else if (input.substr(0, 5) == "lw 0x") {
      try {
            uint32_t load_addr = std::stoul(input.substr(5), nullptr, 16);
            printf("Word at PC : 0x%08X -> 0x%08X\n",load_addr,this->memory->get_int(load_addr));
            continue;
      } catch (const std::exception& e) {
        std::cout << "Invalid hexadecimal format. Please try again." << std::endl;continue;
      }}

    else if (input.substr(0, 5) == "lb 0x") {
      try {
            uint32_t load_addr = std::stoul(input.substr(5), nullptr, 16);
            printf("Byte at PC : 0x%08X -> 0x%02X\n",load_addr,this->memory->get_byte(load_addr));
            continue;
      } catch (const std::exception& e) {
        std::cout << "Invalid hexadecimal format. Please try again." << std::endl;continue;
      }}

    else if (input == "c"){
      if (this->breakpoint!=0){
        printf("Going for break point ...\n");
        while(this->breakpoint != this->pc)mainloop();
        // printf("PC : 0x%08X\n",this->pc);
        printRegAll();
        printf("Break done and breakpoint reset ...\n");
        this->breakpoint=0;
        continue;
      }
      while (true) {mainloop();printRegAll();}
   }

    else if (input == "s"){ //print out the stack based on sp
      uint32_t stack_pointer = reg[sp];
      uint32_t stack_memo;
      if (stack_pointer!=0x80000000 && stack_pointer!=0){
      while (stack_pointer < 0x80000000){
        stack_memo = this->memory->get_int(stack_pointer);
        printf("StackPointer 0x%08X -> 0x%08X\n",stack_pointer,stack_memo);
        stack_pointer = stack_pointer + 0x4;
      }}
      else{printf("Nothing in the stack ...\n");}
    }

    else if (input == ""){  //step
      this->reg[zero]=0; 
    // check stack overflow
      if (reg[sp]<(this->stack_base-this->max_stack_size)){
        printf("-----------------------------------\n");
        printf("sp : 0x%X\n",this->reg[sp]);
        error("stack overflow - sp is under 0x0x7FC00000",this->pc);}

      //flag refresh
      this->f_reg_new = {};
      this->d_reg_new = {};
      this->e_reg_new = {};
      this->m_reg_new = {};
      command_line = "";
      // uint32_t currentPC = this->pc;
      copyReg();

      this->fetch();
      this->f_reg=this->f_reg_new;
      // printf("fpc       0x%08X\n",f_reg.pc);
      this->decode();
      this->d_reg=this->d_reg_new;
      // printf("dpc       0x%08X\n",d_reg.pc);
      this->excecute();
      this->e_reg=this->e_reg_new;
      // printf("epc       0x%08X\n",e_reg.pc);
      this->memory_access();
      this->m_reg=this->m_reg_new;
      // printf("mpc       0x%08X\n",m_reg.pc);
      this->write_back();

      // printf("PC : 0x%08X\n",currentPC);
      printRegAll();
    }

    else if (input == "inst") { //get the fetched instruction binary
      for (int i = 3; i >= 0; --i) { //print out instruction code
        std::cout << std::bitset<8>((this->memory->get_int(this->pc-4) >> (i * 8)) & 0xFF) << (i > 0 ? " " : "");}
        std::cout << std::endl;
    }
    
    else{
    printf("Please pay attention on the FORMAT...\n");
   }


    } while (true);

    std::cout << "Exiting program..." << std::endl;
}

void Simulator::copyReg(){
  for(int i = 0; i < REGNUM; ++i) {
    this->old_reg[i] = this->reg[i];
}
}

void Simulator::mainloop(){
    this->reg[zero]=0; 
    // check stack overflow
    if (reg[sp]<(this->stack_base-this->max_stack_size)){
      printf("-----------------------------------\n");
      printf("sp : 0x%X\n",this->reg[sp]);
      error("stack overflow - sp is under 0x0x7FC00000",this->pc);}

    this->f_reg_new = {};
    this->d_reg_new = {};
    this->e_reg_new = {};
    this->m_reg_new = {};


    this->fetch();
    this->f_reg=this->f_reg_new;
    this->decode();
    this->d_reg=this->d_reg_new;
    this->excecute();
    this->e_reg=this->e_reg_new;
    this->memory_access();
    this->m_reg=this->m_reg_new;
    this->write_back();
    copyReg();
}

void Simulator::simulatePipeline(){
    
    // this->f_reg.bubble = true;
    // this->d_reg.bubble = true;
    // this->e_reg.bubble = true;
    // this->m_reg.bubble = true;

  while(true){
    this->reg[zero]=0; 
    // check stack overflow
    if (reg[sp]<(this->stack_base-this->max_stack_size)){
    printf("-----------------------------------\n");
    printf("sp : 0x%X\n",this->reg[sp]);
    error("stack overflow - sp is under 0x0x7FC00000",this->pc);}

    //5-stage streamline flag refresh
    this->f_reg_new = {};
    this->d_reg_new = {};
    this->e_reg_new = {};
    this->m_reg_new = {};



    this->fetch(); this->f_reg=this->f_reg_new;
    this->decode();this->d_reg=this->d_reg_new;
    this->excecute();this->e_reg=this->e_reg_new;
    this->memory_access();this->m_reg=this->m_reg_new;
    this->write_back();




  }
}

void Simulator::pipelineSingleStep(){

  this->f_reg = {};
  this->d_reg = {};
  this->e_reg = {};
  this->m_reg = {};
  this->f_reg_new = {};
  this->d_reg_new = {};
  this->e_reg_new = {};
  this->m_reg_new = {};

  std::string input;
  this->breakpoint = 0;
  this->f_reg.bubble = true;
  this->d_reg.bubble = true;
  this->e_reg.bubble = true;
  this->m_reg.bubble = true;


do {
    // printf("enter [q]         - quit           | [c]          - continue\n");
    // printf("enter [s]         - print stack    | [nothing]    - step command\n");
    // printf("enter [b 0x100e0] - set breakpoint | [lw 0x100e0] - get 32-bit stored\n");
    // printf("----------------------------------------------------------------\n");
    
    std::getline(std::cin, input);

    if (input == "q") break; // break the program

    else if (input.substr(0, 4) == "b 0x") {
      this->breakpoint=0;
      try {
          this->breakpoint = std::stoul(input.substr(4), nullptr, 16);
          std::cout << "Breakpoint set at PC : 0x" << std::hex << this->breakpoint << std::dec << std::endl;
          continue;
      } catch (const std::exception& e) {
          std::cout << "Invalid hexadecimal format. Please try again." << std::endl;continue;
      }}

    else if (input.substr(0, 5) == "lw 0x") {
      try {
            uint32_t load_addr = std::stoul(input.substr(5), nullptr, 16);
            printf("Word at PC : 0x%08X -> 0x%08X\n",load_addr,this->memory->get_int(load_addr));
            continue;
      } catch (const std::exception& e) {
        std::cout << "Invalid hexadecimal format. Please try again." << std::endl;continue;
      }}

    else if (input.substr(0, 5) == "lb 0x") {
      try {
            uint32_t load_addr = std::stoul(input.substr(5), nullptr, 16);
            printf("Byte at PC : 0x%08X -> 0x%02X\n",load_addr,this->memory->get_byte(load_addr));
            continue;
      } catch (const std::exception& e) {
        std::cout << "Invalid hexadecimal format. Please try again." << std::endl;continue;
      }}

    else if (input == "c"){
      if (this->breakpoint!=0){
        printf("Going for break point ...\n");
        while(this->breakpoint != this->pc)pipeloop();
        // printf("PC : 0x%08X\n",this->pc);
        printRegAll();
        printf("Break done and breakpoint reset ...\n");
        this->breakpoint=0;
        continue;
      }
      while (true) {pipeloop();}
   }

    else if (input == "s"){ //print out the stack based on sp
      uint32_t stack_pointer = reg[sp];
      uint32_t stack_memo;
      if (stack_pointer!=0x80000000 && stack_pointer!=0){
      while (stack_pointer < 0x80000000){
        stack_memo = this->memory->get_int(stack_pointer);
        printf("StackPointer 0x%08X -> 0x%08X\n",stack_pointer,stack_memo);
        stack_pointer = stack_pointer + 0x4;
      }}
      else{printf("Nothing in the stack ...\n");}
    }

    else if (input == ""){  //step
      this->reg[zero]=0; 
    // check stack overflow
      if (reg[sp]<(this->stack_base-this->max_stack_size)){
        printf("-----------------------------------\n");
        printf("sp : 0x%X\n",this->reg[sp]);
        error("stack overflow - sp is under 0x0x7FC00000",this->pc);}

      
      // uint32_t currentPC = this->pc;
      // copyReg();
      copyRegBuffer();


      command_line = "";
      this->fetch();
      this->decode();
      this->excecute();
      this->memory_access();
      this->write_back();

      printRegAll();
      // printf("0x%08X",this->reg[gp]);

      printf("after 5-stage \n");
      printStageAll();
      if(f_reg.stall==0)this->f_reg=this->f_reg_new;
      else if (f_reg.stall > 0) {
        this->f_reg.stall --;}
      else {error("fReg stall is negative 666 ...",this->f_reg.pc);}

      if(d_reg.stall==0)this->d_reg=this->d_reg_new;
      else if (d_reg.stall > 0) {
        this->d_reg.stall --;}
      else {error("dReg stall is negative 666 ...",this->d_reg.pc);}

      this->e_reg=this->e_reg_new;
      this->m_reg=this->m_reg_new;

      printf("after reg refresh \n");
      printStageAll();

      this->f_reg_new = {};
      this->d_reg_new = {};
      this->e_reg_new = {};
      this->m_reg_new = {};
      printf("after reg new refresh \n");
      printStageAll();
    }

    else if (input == "inst") { //get the fetched instruction binary
      for (int i = 3; i >= 0; --i) { //print out instruction code
        std::cout << std::bitset<8>((this->memory->get_int(this->pc-4) >> (i * 8)) & 0xFF) << (i > 0 ? " " : "");}
        std::cout << std::endl;
    }
    
    else if (input == "r") printRegAll();

    else{printf("Please pay attention on the FORMAT...\n");}

    } while (true);

    std::cout << "Exiting program..." << std::endl;
}

void Simulator::printStageAll(){
  printf("       PC          #stall  PC          #stall\n");
  // printf("fNReg: 0x%08X  0b%-2d >> 0x%08X  0b%-2d\n",f_reg_new_copy.pc,f_reg_new_copy.stall,f_reg_new.pc,f_reg_new.stall);
  // printf("fReg : 0x%08X  0b%-2d >> 0x%08X  0b%-2d\n",f_reg_copy.pc,f_reg_copy.stall,f_reg.pc,f_reg.stall);
  // printf("dNReg: 0x%08X  0b%-2d >> 0x%08X  0b%-2d\n",d_reg_new_copy.pc,d_reg_new_copy.stall,d_reg_new.pc,d_reg_new.stall);
  // printf("dReg : 0x%08X  0b%-2d >> 0x%08X  0b%-2d\n",d_reg_copy.pc,d_reg_copy.stall,d_reg.pc,d_reg.stall);
  // printf("eNReg: 0x%08X  0b%-2d >> 0x%08X  0b%-2d\n",e_reg_new_copy.pc,e_reg_new_copy.stall,e_reg_new.pc,e_reg_new.stall);
  // printf("eReg : 0x%08X  0b%-2d >> 0x%08X  0b%-2d\n",e_reg_copy.pc,e_reg_copy.stall,e_reg.pc,e_reg.stall);
  // printf("mNReg: 0x%08X  0b%-2d >> 0x%08X  0b%-2d\n",m_reg_new_copy.pc,m_reg_new_copy.stall,m_reg_new.pc,m_reg_new.stall);
  // printf("mReg : 0x%08X  0b%-2d >> 0x%08X  0b%-2d\n",m_reg_copy.pc,m_reg_copy.stall,m_reg.pc,m_reg.stall);
  printf("fNReg: 0x%08X  0b%-2d\n",f_reg_new.pc,f_reg_new.stall);
  printf("fReg : 0x%08X  0b%-2d\n",f_reg.pc,f_reg.stall);
  printf("dNReg: 0x%08X  0b%-2d\n",d_reg_new.pc,d_reg_new.stall);
  printf("dReg : 0x%08X  0b%-2d\n",d_reg.pc,d_reg.stall);
  printf("eNReg: 0x%08X  0b%-2d\n",e_reg_new.pc,e_reg_new.stall);
  printf("eReg : 0x%08X  0b%-2d\n",e_reg.pc,e_reg.stall);
  printf("mNReg: 0x%08X  0b%-2d\n",m_reg_new.pc,m_reg_new.stall);
  printf("mReg : 0x%08X  0b%-2d\n",m_reg.pc,m_reg.stall);
printf("-----------------------------------\n");}

void Simulator::pipeloop(){
  // //  check stack overflow
  this->reg[zero]=0; 
    // check stack overflow
  if (reg[sp]<(this->stack_base-this->max_stack_size)){
    printf("-----------------------------------\n");
    printf("sp : 0x%X\n",this->reg[sp]);
    error("stack overflow - sp is under 0x0x7FC00000",this->pc);}


  command_line = "";
  // uint32_t currentPC = this->pc;
  copyReg();

  
  this->fetch();
  this->decode();
  this->excecute();
  this->memory_access();
  this->write_back();

  // printStageAll();
  // printRegAll();

  if(f_reg.stall==0)this->f_reg=this->f_reg_new;
  else this->f_reg.stall --;

  if(d_reg.stall==0)this->d_reg=this->d_reg_new;
  else this->d_reg.stall --;


  this->e_reg=this->e_reg_new;
  this->m_reg=this->m_reg_new;
  //flag refresh
  this->f_reg_new = {};
  this->d_reg_new = {};
  this->e_reg_new = {};
  this->m_reg_new = {};
}


void Simulator::copyRegBuffer(){
  this->f_reg_new_copy =this->f_reg_new;
  this->f_reg_copy =this->f_reg;
  this->d_reg_new_copy =this->d_reg_new;
  this->d_reg_copy =this->d_reg;
  this->e_reg_new_copy =this->e_reg_new;
  this->e_reg_copy =this->e_reg ;
  this->m_reg_new_copy =this->m_reg_new;
  this->m_reg_copy =this->m_reg;
}





