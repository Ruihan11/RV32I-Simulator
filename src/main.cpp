#include <cstdio>
#include <cstdlib>

#include <elfio/elfio.hpp>
#include "simulator/memory_manager.h"
#include "simulator/simulator.h"

bool pipe= 0;
bool parse_params(int argc, char** argv);
void printUsage();
void load_elf_to_memory(ELFIO::elfio* reader, MemoryManager* memory);
void printElfInfo(ELFIO::elfio *reader);

char* elf_file = nullptr;
bool single_step = 0;
bool dump_asm = 0;
bool pipeline_mode = 0;
bool history_mode = 0;

uint32_t stack_base_addr = 0x80000000;
uint32_t stack_size = 0x400000;
MemoryManager memory;
Simulator simulator(&memory);

int main(int argc, char** argv) {

//check paras and elf32 for simulation
  if (!parse_params(argc, argv)) {
    printUsage();
    exit(-1);
  }
  
  // std::cout<<single_step<<pipeline_mode<<std::endl;
  // printf("loading <- ");
  elf_file = argv[1];
  // std::cout<<argv[1]<<std::endl;
  ELFIO::elfio reader;
  if (!reader.load(elf_file)) {
    fprintf(stderr, "Fail to load ELF file %s, check its dir :)\n", elf_file);
    return -1;
  }
  // printf("===============loaded==============\n\n");
  // printElfInfo(&reader);
  load_elf_to_memory(&reader, &memory);



  // because memo is an replica of elf, entry is also its first execution command
  simulator.pc = reader.get_entry();
  simulator.init_stack(stack_base_addr, stack_size);
  simulator.single_step=single_step;
  simulator.dump_asm=dump_asm;
  simulator.pipeline_mode=pipeline_mode;
  simulator.history_mode=history_mode;
  simulator.simulate();

  return 0;
}

// not necessary to implement, can delete
bool parse_params(int argc, char** argv) {
  for (int i = 1; i < argc; ++i) {
    if (argv[i][0] == '-') {
      switch (argv[i][1]) {
        case 's': single_step=1; break;
        case 'd': dump_asm=1; break;
        case 'p': pipe=1; break;
        case 'h': history_mode=1; break;
        default: return false;
      }
      }
    }
  return true;
}

void printUsage(){
  printf("============WRONG COMMAND==========\n");
  printf("./Simulator [rv32i elf] [-c]\n");
  printf("[-d] : dump memory and fetched asm text\n");
  printf("[-s] : single-step debugger, developer used\n");
  printf("[-h] : pipeline mode\n");
  printf("[-p] : pipeline mode\n");
  printf("[-p -s] : pipeline single step\n");
  printf("===================================\n");
}


// load elf file to memory
void load_elf_to_memory(ELFIO::elfio* reader, MemoryManager* memory) {
  
  FILE* dumpFile = fopen("dump.txt", "wb");  //dump file to check the memo allocation
  
  ELFIO::Elf_Half seg_num = reader->segments.size();
  for (int i = 0; i < seg_num; ++i) {
    const ELFIO::segment* pseg = reader->segments[i];

    uint32_t memory_size = pseg->get_memory_size();
    uint32_t offset = pseg->get_virtual_address();

    // printf("seg %d\n",i);
    // printf("Msize  0x%08X\n",memory_size);
    // printf("offset 0x%08X\n",offset);

    // check if the address space is larger than 32bit
    if (offset + memory_size > 0xFFFFFFFF) {
      fprintf(
          stderr,
          "ELF address space larger than 32bit! Seg %d has max addr of 0x%x\n",
          i, offset + memory_size);
      exit(-1);
    }

    uint32_t filesz = pseg->get_file_size();
    uint32_t memsz = pseg->get_memory_size();
    uint32_t addr = (uint32_t)pseg->get_virtual_address();

    for (uint32_t p = addr; p < addr + memsz; ++p) {
      if (!memory->is_page_exit(p)) {
        memory->add_page(p);
      }

      char value = (p < addr + filesz) ? pseg->get_data()[p - addr] : 0;
      memory->set_byte(p, value);

      // Write the value to dump
      if(dump_asm) fwrite(&value, sizeof(char), 1, dumpFile); 
    }
  }
  if(dump_asm) fclose(dumpFile);
}

//elf info print
void printElfInfo(ELFIO::elfio *reader) {
  printf("==========ELF Information==========\n");

  if (reader->get_class() == ELFCLASS32) {
    printf("Type: ELF32\n");
  } else {
    printf("Type: ELF64\n");
  }

  if (reader->get_encoding() == ELFDATA2LSB) {
    printf("Encoding: Little Endian\n");
  } else {
    printf("Encoding: Large Endian\n");
  }

  if (reader->get_machine() == EM_RISCV) {
    printf("ISA: RISC-V(0x%x)\n", reader->get_machine());
  } else {
    printf("ISA: Unsupported(0x%x)\n", reader->get_machine());
    exit(-1);
  }

  ELFIO::Elf_Half sec_num = reader->sections.size();
  printf("Number of Sections: %d\n", sec_num);
  printf("ID\tName\t\tAddress\tSize\n");

  for (int i = 0; i < sec_num; ++i) {
    const ELFIO::section *psec = reader->sections[i];

    printf("[%d]\t%-12s\t0x%lx\t%ld\n", i, psec->get_name().c_str(),
           psec->get_address(), psec->get_size());
  }

  ELFIO::Elf_Half seg_num = reader->segments.size();
  printf("Number of Segments: %d\n", seg_num);
  printf("ID\tFlags\tAddress\tFSize\tMSize\n");

  for (int i = 0; i < seg_num; ++i) {
    const ELFIO::segment *pseg = reader->segments[i];

    printf("[%d]\t0x%x\t0x%lx\t%ld\t%ld\n", i, pseg->get_flags(),
           pseg->get_virtual_address(), pseg->get_file_size(),
           pseg->get_memory_size());
  }

  printf("===================================\n");
}






