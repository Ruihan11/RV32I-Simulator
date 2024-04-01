#ifndef SIMULATOR_H
#define SIMULATOR_H

#include "simulator/memory_manager.h"
#include <cstdarg>
#include <cstdint>
#include <vector>
#include <cstring>
#include <fstream>
#include <sstream>
#include <string>
#include <iostream>

const int REGNUM = 32;

enum Register {
  zero = 0,
  ra = 1,
  sp = 2,
  gp = 3,
  tp = 4,
  t0 = 5,
  t1 = 6,
  t2 = 7,
  s0 = 8,
  s1 = 9,
  a0 = 10,
  a1 = 11,
  a2 = 12,
  a3 = 13,
  a4 = 14,
  a5 = 15,
  a6 = 16,
  a7 = 17,
  s2 = 18,
  s3 = 19,
  s4 = 20,
  s5 = 21,
  s6 = 22,
  s7 = 23,
  s8 = 24,
  s9 = 25,
  s10 = 26,
  s11 = 27,
  t3 = 28,
  t4 = 29,
  t5 = 30,
  t6 = 31
};

enum Instruction {
  LUI = 0,
  AUIPC = 1,
  JAL = 2,
  JALR = 3,
  BEQ = 4,
  BNE = 5,
  BLT = 6,
  BGE = 7,
  BLTU = 8,
  BGEU = 9,
  LB = 10,
  LH = 11,
  LW = 12,
  LD = 13,
  LBU = 14,
  LHU = 15,
  SB = 16,
  SH = 17,
  SW = 18,
  SD = 19,
  ADDI = 20,
  SLTI = 21,
  SLTIU = 22,
  XORI = 23,
  ORI = 24,
  ANDI = 25,
  SLLI = 26,
  SRLI = 27,
  SRAI = 28,
  ADD = 29,
  SUB = 30,
  SLL = 31,
  SLT = 32,
  SLTU = 33,
  XOR = 34,
  SRL = 35,
  SRA = 36,
  OR = 37,
  AND = 38,
  ECALL = 39,
  UNKNOWN = -1
};

// opcode field
const int OP_REG = 0x33;
const int OP_IMM = 0x13;
const int OP_LUI = 0x37;
const int OP_BRANCH = 0x63;
const int OP_STORE = 0x23;
const int OP_LOAD = 0x03;
const int OP_SYSTEM = 0x73;
const int OP_AUIPC = 0x17;
const int OP_JAL = 0x6F;
const int OP_JALR = 0x67;

class Simulator {
public:

  bool single_step;
  bool dump_asm;
  bool pipeline_mode;
  
  uint32_t breakpoint;
  uint32_t pc;
  uint32_t reg[REGNUM];
  uint32_t old_reg[REGNUM];
  uint32_t stack_base;
  uint32_t max_stack_size;
  MemoryManager* memory;

  std::string command_line ="";
  std::stringstream pc_outstream;
  std::stringstream command_line_outstream;
  
  Simulator(MemoryManager* memory);
  ~Simulator();

  void init_stack(uint32_t base_addr, uint32_t max_size);
  void simulate();
  void error(const std::string& message,uint32_t addr);

private:
  // can change according your need
  struct FetchRegister {
    bool bubble;
    uint32_t stall;

    uint32_t pc;
    uint32_t inst;
    uint32_t len;
  } f_reg, f_reg_new;

  // can change according your need
  struct DecodeRegister {
    bool bubble;
    uint32_t stall;
    uint32_t rs1_ID, rs2_ID, rd_ID;

    uint32_t pc;
    Instruction inst;
    int32_t op1;
    int32_t op2;
    uint32_t dest;
    int32_t offset;
  } d_reg, d_reg_new;

  // can change according your need
  struct ExecuteRegister {
    bool bubble;
    uint32_t stall;

    uint32_t pc;
    Instruction inst;
    int32_t op1;
    int32_t op2;
    bool write_reg;
    uint32_t dest_reg;
    // output of execute stage
    int32_t out;
    bool write_mem;
    bool read_unsigned_mem;
    bool read_signed_mem;
    uint32_t mem_len;
  } e_reg, e_reg_new;

  // can change according your need
  struct MemoryRegister {
    bool bubble;
    uint32_t stall;

    uint32_t pc;
    Instruction inst;
    int32_t op1;
    int32_t op2;
    int32_t out;
    bool write_reg;
    uint32_t dest_reg;
  } m_reg, m_reg_new;

  // can change according your need
  struct History {
    uint32_t inst_count;
    uint32_t cycle_count;
    uint32_t stall_cycle_count;

    uint32_t data_hazard_count;
    uint32_t control_hazard_count;
    uint32_t mem_hazard_count;
  } history;

  void fetch();
  void decode();
  void excecute();
  void memory_access();
  void write_back();

  // int32_t handle_system_call(int32_t op1, int32_t op2);

  void printRegAll();
  std::string instNumToString(int i);
  void simulateSingleStep();
  void simulatePipeline();
  void copyReg();
  void mainloop();
  int32_t handle_system_call(int32_t a0, int32_t a7);
};

#endif
