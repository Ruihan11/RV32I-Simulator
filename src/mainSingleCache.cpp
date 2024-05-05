#include <cstdint>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>

#include "../include/simulator/Cache.h"
#include "../include/simulator/memory_manager.h"

bool parseParameters(int argc, char **argv);
void printUsage();
void simulateCache(std::ofstream &csvFile, uint32_t cacheSize,
                   uint32_t blockSize, uint32_t associativity);

bool single_step = 0;
const char *traceFilePath;

/**
 * @brief The main function of the program.
 *
 * @param argc The number of command-line arguments.
 * @param argv An array of command-line arguments.
 * @return int The exit status of the program.
 */
int main(int argc, char **argv) {
  if (!parseParameters(argc, argv)) {
    return -1;
  }

  // Open CSV file and write header
  std::ofstream csvFile(std::string(traceFilePath) + ".csv");
  csvFile << "cacheSize,blockSize,associativity\n";

  // Needs some coding here
  // 4KB to 1MB
  for (uint32_t cacheSize = 4 * 1024; cacheSize <= 1 * 1024 * 1024;
       cacheSize *= 2) {
    // Block Size: 32 byte to 256 byte
    for (uint32_t blockSize = 32; blockSize <= 256; blockSize *= 2) {
      // 2 to 32
      for (uint32_t associativity = 2; associativity <= 32;associativity *= 2) {
        uint32_t blockNum = cacheSize / blockSize;
        if (blockNum % associativity != 0)
          continue;

        simulateCache(csvFile, cacheSize, blockSize, associativity);

      }
    }
  }


  printf("Result has been written to %s\n",
         (std::string(traceFilePath) + ".csv").c_str());
  csvFile.close();
  return 0;
}

/**
 * Parses the command line parameters and sets the corresponding flags and
 * variables.
 *
 * @param argc The number of command line arguments.
 * @param argv An array of C-style strings representing the command line
 * arguments.
 * @return True if the parameters are successfully parsed, false otherwise.
 */
bool parseParameters(int argc, char **argv) {
  // Read Parameters
  for (int i = 1; i < argc; ++i) {
    if (traceFilePath == nullptr) {
      traceFilePath = argv[i];
    } else {
      return false;
    }
  }
  if (traceFilePath == nullptr) {
    return false;
  }
  return true;
}


/**
 * Simulates the cache behavior based on the given cache parameters and trace
 * file.
 *
 * @param csvFile The output CSV file to store simulation results.
 * @param cacheSize The size of the cache in bytes.
 * @param blockSize The size of each cache block in bytes.
 * @param associativity The associativity of the cache.
 * @param writeBack A boolean indicating whether the cache uses write-back
 * policy.
 * @param writeAllocate A boolean indicating whether the cache uses
 * write-allocate policy.
 */
void simulateCache(std::ofstream &csvFile, uint32_t cacheSize,
                   uint32_t blockSize, uint32_t associativity) {
  // Cache::Policy policy;
  // policy.cacheSize = cacheSize;
  // policy.blockSize = blockSize;
  // policy.blockNum = cacheSize / blockSize;
  // policy.associativity = associativity;
  // policy.hitLatency = 1;
  // policy.missLatency = 8;

  // Initialize memory and cache
  // MemoryManager *memory = nullptr;
  // Cache *cache = nullptr;
  // memory = new MemoryManager();
  // cache = new Cache(memory, policy, nullptr, writeBack, writeAllocate);
  // memory->setCache(cache);

  // cache->printInfo();

  // // Read and execute trace in cache-trace/ folder
  // std::ifstream trace(traceFilePath);
  // if (!trace.is_open()) {
  //   printf("Unable to open file %s\n", traceFilePath);
  //   exit(-1);
  // }

  // char type; //'r' for read, 'w' for write
  // uint32_t addr;

  // // This while loop is the main loop of the cache simulator. It reads memory
  // // operations from a trace file and performs the operations on the cache.
  // while (trace >> type >> std::hex >> addr) {
  //   if (!memory->is_page_exit(addr)) memory->add_page(addr);
  //   // If the page containing the address does not exist in memory, add it.
  //   // Needs some coding here

  //   // Perform the memory operation.
  //   switch (type) {
  //   case 'r':
  //     cache->getByte(addr);
  //     break;
  //   case 'w':
  //     cache->setByte(addr, 0);
  //     break;
  //   default:
  //     // If the operation type is not 'r' or 'w', print an error message and exit the program.
  //     // Needs some coding here
  //     printf("Illegal type %c\n", type);
  //     exit(-1);
  //   }
  // }
  // if (single_step) {
  //     printf("Press Enter to Continue...");
  //     getchar();
  //   }
  // Output Simulation Results
  // cache->printStatistics();
  // float missRate = (float)cache->statistics.numMiss /
  //                  (cache->statistics.numHit + cache->statistics.numMiss);
  csvFile << cacheSize << "," << blockSize << "," << associativity << std::endl;

  // delete cache;
  // delete memory;
}