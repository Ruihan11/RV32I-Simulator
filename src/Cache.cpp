#include <cstdio>
#include <cstdlib>

#include "../include/simulator/Cache.h"


/**
 * @brief Constructs a Cache object.
 *
 * This constructor initializes a Cache object with the provided parameters.
 *
 * @param manager A pointer to the MemoryManager object that manages the memory.
 * @param policy The cache replacement policy to be used.
 * @param lowerCache A pointer to the lower-level cache (if any).
 * @param writeBack A boolean indicating whether write-back policy is enabled.
 * @param writeAllocate A boolean indicating whether write-allocate policy is enabled.
 */
Cache::Cache(MemoryManager *manager, Policy policy, Cache *lowerCache,
             bool writeBack, bool writeAllocate) {
  this->referenceCounter = 0;
  this->memory = manager;
  this->policy = policy;
  this->lowerCache = lowerCache;
  if (!this->isPolicyValid()) {
    fprintf(stderr, "Policy invalid!\n");
    exit(-1);
  }
  this->initCache();
  this->statistics.numRead = 0;
  this->statistics.numWrite = 0;
  this->statistics.numHit = 0;
  this->statistics.numMiss = 0;
  this->statistics.totalCycles = 0;
  this->writeBack = writeBack;
  this->writeAllocate = writeAllocate;
}


// bool Cache::inCache(uint32_t addr) {
//   return getBlockId(addr) != -1 ? true : false;
// }


// /**
//  * Retrieves the block ID of a given address in the cache.
//  *
//  * @param addr The memory address to retrieve the block ID for.
//  * @return The block ID if the address is found in the cache, otherwise -1.
//  */
// uint32_t Cache::getBlockId(uint32_t addr) {
//   // Needs some coding here
// }


// /**
//  * Retrieves a byte from the cache based on the given address.
//  *
//  * @param addr The memory address to retrieve the byte from.
//  * @param cycles A pointer to a variable that will store the number of cycles taken to retrieve the byte.
//  * @return The byte value retrieved from the cache.
//  * @throws std::runtime_error if the data is not found in the top level cache.
//  */
// uint8_t Cache::getByte(uint32_t addr, uint32_t *cycles) {
//   this->referenceCounter++;
//   this->statistics.numRead++;

//   // If in cache, return directly
//   int blockId;
//   if ((blockId = this->getBlockId(addr)) != -1) {
//     // Needs some coding here
//     return this->blocks[blockId].data[offset];
//   }

//   // Else, find the data in memory or other level of cache
//   // Needs some coding here

//   // The block is in top level cache now, return directly
//   if ((blockId = this->getBlockId(addr)) != -1) {
//     // Needs some coding here
//     return this->blocks[blockId].data[offset];
//   } else {
//     fprintf(stderr, "Error: data not in top level cache!\n");
//     exit(-1);
//   }
// }


// /**
//  * Writes a byte to the cache at the specified address.
//  *
//  * @param addr The memory address to write to.
//  * @param val The value to write.
//  * @param cycles Pointer to a variable to store the number of cycles taken.
//  */
// void Cache::setByte(uint32_t addr, uint8_t val, uint32_t *cycles) {
//   this->referenceCounter++;
//   this->statistics.numWrite++;

//   // If in cache, write to it directly
//   int blockId;
//   if ((blockId = this->getBlockId(addr)) != -1) {
//     // Needs some coding here
//     return;
//   }

//   // Else, load the data from cache
//   // TODO: implement bypassing
//   this->statistics.numMiss++;
//   this->statistics.totalCycles += this->policy.missLatency;

//   if (this->writeAllocate) {
//     // Needs some coding here
//   } else {
//     // Needs some coding here
//   }
// }


// /**
//  * Prints information about the cache.
//  */
// void Cache::printInfo() {
//   printf("---------- Cache Info -----------\n");
//   printf("Cache Size: %d bytes\n", this->policy.cacheSize);
//   printf("Block Size: %d bytes\n", this->policy.blockSize);
//   printf("Block Num: %d\n", this->policy.blockNum);
//   printf("Associativiy: %d\n", this->policy.associativity);
//   printf("Hit Latency: %d\n", this->policy.hitLatency);
//   printf("Miss Latency: %d\n", this->policy.missLatency);
// }


// /**
//  * Prints the statistics of the cache.
//  * This function prints the number of reads, writes, hits, misses, and total cycles of the cache.
//  * If there is a lower cache, it also prints the statistics of the lower cache.
//  */
// void Cache::printStatistics() {
//   printf("-------- STATISTICS ----------\n");
//   printf("Num Read: %d\n", this->statistics.numRead);
//   printf("Num Write: %d\n", this->statistics.numWrite);
//   printf("Num Hit: %d\n", this->statistics.numHit);
//   printf("Num Miss: %d\n", this->statistics.numMiss);
//   printf("Total Cycles: %llu\n", this->statistics.totalCycles);
//   if (this->lowerCache != nullptr) {
//     printf("---------- LOWER CACHE ----------\n");
//     this->lowerCache->printStatistics();
//   }
// }


// /**
//  * Checks if the cache policy is valid.
//  * 
//  * @return true if the cache policy is valid, false otherwise.
//  */
// bool Cache::isPolicyValid() {
//   // Needs some coding here
// }


// /**
//  * Initializes the cache by creating and initializing the cache blocks.
//  */
// void Cache::initCache() {
//   this->blocks = std::vector<Block>(policy.blockNum);
//   for (uint32_t i = 0; i < this->blocks.size(); ++i) {
//     // Needs some coding here
//   }
// }


// /**
//  * Loads a block from the lower level of the cache hierarchy into the current cache.
//  * 
//  * @param addr The address of the block to be loaded.
//  * @param cycles A pointer to a variable that will store the number of cycles taken for the operation.
//  *               If set to nullptr, the number of cycles will not be recorded.
//  */
// void Cache::loadBlockFromLowerLevel(uint32_t addr, uint32_t *cycles) {
//   uint32_t blockSize = this->policy.blockSize;

//   // Initialize new block from memory
//   // Needs some coding here

//   // Find replace block
//   // Needs some coding here
// }


// /**
//  * Returns the index of the replacement block in the cache.
//  *
//  * This function searches for an invalid block first. If an invalid block is found,
//  * its index is returned. If no invalid block is found, the function uses the Least
//  * Recently Used (LRU) algorithm to determine the index of the block with the least
//  * recent reference.
//  *
//  * @param begin The starting index of the search range.
//  * @param end The ending index of the search range.
//  * @return The index of the replacement block.
//  */
// uint32_t Cache::getReplacementBlockId(uint32_t begin, uint32_t end) {
//   // Find invalid block first
//   // Needs some coding here

//   // Otherwise use LRU
//   // Needs some coding here

// }


// /**
//  * Writes the contents of a block to the lower level cache or memory.
//  * If a lower level cache is available, the block is written to it.
//  * Otherwise, the block is written directly to memory.
//  *
//  * @param b The block to be written.
//  */
// void Cache::writeBlockToLowerLevel(Cache::Block &b) {
//   // Needs some coding here
// }


// bool Cache::isPowerOfTwo(uint32_t n) { return n > 0 && (n & (n - 1)) == 0; }


// /**
//  * Calculates the logarithm base 2 of the given value.
//  * 
//  * @param val The value for which to calculate the logarithm base 2.
//  * @return The logarithm base 2 of the given value.
//  */
// uint32_t Cache::log2i(uint32_t val) {
//   if (val == 0)
//     return uint32_t(-1);
//   if (val == 1)
//     return 0;
//   uint32_t ret = 0;
//   while (val > 1) {
//     val >>= 1;
//     ret++;
//   }
//   return ret;
// }

// /**
//  * Retrieves the tag value from the given address.
//  *
//  * @param addr The memory address.
//  * @return The tag value extracted from the address.
//  */
// uint32_t Cache::getTag(uint32_t addr) {
//   // Needs some coding here
// }


// /**
//  * Returns the cache ID for a given memory address.
//  * 
//  * @param addr The memory address.
//  * @return The cache ID.
//  */
// uint32_t Cache::getId(uint32_t addr) {
//   // Needs some coding here
// }


// /**
//  * Calculates the offset within a cache block for a given memory address.
//  *
//  * @param addr The memory address for which to calculate the offset.
//  * @return The offset within the cache block.
//  */
// uint32_t Cache::getOffset(uint32_t addr) {
//   // Needs some coding here
// }


// /**
//  * Calculates the address of a cache block.
//  *
//  * @param b The cache block for which to calculate the address.
//  * @return The address of the cache block.
//  */
// uint32_t Cache::getAddr(Cache::Block &b) {
//   // Needs some coding here
// }