#ifndef CACHE_H
#define CACHE_H

#include <cstdint>
#include <vector>

#include "memory_manager.h"

class MemoryManager;

/**
 * @brief Represents a cache in a RISC-V simulator.
 */
class Cache {
public:
  /**
   * @brief Represents the cache policy.
   */
  struct Policy {
    uint32_t cacheSize;     /**< The size of the cache in bytes (must be a power of 2). */
    uint32_t blockSize;     /**< The size of each cache block in bytes. */
    uint32_t blockNum;      /**< The number of blocks in the cache. */
    uint32_t associativity; /**< The associativity of the cache. */
    uint32_t hitLatency;    /**< The latency (in cycles) for a cache hit. */
    uint32_t missLatency;   /**< The latency (in cycles) for a cache miss. */
  };

  /**
   * @brief Represents a cache block.
   */
  struct Block {
    bool valid;                 /**< Indicates if the block is valid. */
    bool modified;              /**< Indicates if the block has been modified. */
    uint32_t tag;               /**< The tag of the block. */
    uint32_t id;                /**< The ID of the block. */
    uint32_t size;              /**< The size of the block in bytes. */
    uint32_t lastReference;     /**< The cycle count of the last reference to the block. */
    std::vector<uint8_t> data;  /**< The data stored in the block. */
    Block() {}                  /**< Default constructor. */
    Block(const Block &b)       /**< Copy constructor. */
        : valid(b.valid), modified(b.modified), tag(b.tag), id(b.id),
          size(b.size) {
      data = b.data;
    }
  };

  /**
   * @brief Represents the cache statistics.
   */
  struct Statistics {
    uint32_t numRead;       /**< The number of cache reads. */
    uint32_t numWrite;      /**< The number of cache writes. */
    uint32_t numHit;        /**< The number of cache hits. */
    uint32_t numMiss;       /**< The number of cache misses. */
    uint64_t totalCycles;   /**< The total number of cycles. */
  };

  /**
   * @brief Constructs a Cache object.
   * @param manager The memory manager.
   * @param policy The cache policy.
   * @param lowerCache The lower-level cache (optional).
   * @param writeBack Indicates if write-back policy is used (default: true).
   * @param writeAllocate Indicates if write-allocate policy is used (default: true).
   */
  Cache(MemoryManager *manager, Policy policy, Cache *lowerCache = nullptr,
        bool writeBack = true, bool writeAllocate = true);

  /**
   * @brief Checks if the given address is in the cache.
   * @param addr The address to check.
   * @return True if the address is in the cache, false otherwise.
   */
  // bool inCache(uint32_t addr);

  /**
   * @brief Gets the block ID for the given address.
   * @param addr The address.
   * @return The block ID.
   */
  // uint32_t getBlockId(uint32_t addr);

  /**
   * @brief Gets the byte at the given address.
   * @param addr The address.
   * @param cycles Pointer to store the number of cycles taken (optional).
   * @return The byte value.
   */
  // uint8_t getByte(uint32_t addr, uint32_t *cycles = nullptr);

  /**
   * @brief Sets the byte at the given address.
   * @param addr The address.
   * @param val The byte value.
   * @param cycles Pointer to store the number of cycles taken (optional).
   */
  // void setByte(uint32_t addr, uint8_t val, uint32_t *cycles = nullptr);

  /**
   * @brief Prints information about the cache.
   * @param verbose Indicates if verbose information should be printed.
   */
  // void printInfo();

  /**
   * @brief Prints the cache statistics.
   */
  // void printStatistics();
  // void setCache(Cache *cache);

  Statistics statistics; /**< The cache statistics. */

private:
  uint32_t referenceCounter; /**< The reference counter. */
  bool writeBack;            /**< Indicates if write-back policy is used. */
  bool writeAllocate;        /**< Indicates if write-allocate policy is used. */
  MemoryManager *memory;     /**< The memory manager. */
  Cache *lowerCache;         /**< The lower-level cache. */
  Policy policy;             /**< The cache policy. */
  std::vector<Block> blocks; /**< The cache blocks. */

  /**
   * @brief Initializes the cache.
   */
  // void initCache();

  /**
   * @brief Loads a block from the lower-level cache.
   * @param addr The address.
   * @param cycles Pointer to store the number of cycles taken (optional).
   */
  // void loadBlockFromLowerLevel(uint32_t addr, uint32_t *cycles = nullptr);

  /**
   * @brief Gets the block ID for replacement within a given range.
   * @param begin The beginning block ID.
   * @param end The ending block ID.
   * @return The block ID for replacement.
   */
  // uint32_t getReplacementBlockId(uint32_t begin, uint32_t end);

  /**
   * @brief Writes a block to the lower-level cache.
   * @param b The block to write.
   */
  // void writeBlockToLowerLevel(Block &b);

  // Utility Functions

  /**
   * @brief Checks if the cache policy is valid.
   * @return True if the policy is valid, false otherwise.
   */
  // bool isPolicyValid();

  /**
   * @brief Checks if a number is a power of two.
   * @param n The number to check.
   * @return True if the number is a power of two, false otherwise.
   */
  // bool isPowerOfTwo(uint32_t n);

  /**
   * @brief Calculates the logarithm base 2 of a number.
   * @param val The number.
   * @return The logarithm base 2 of the number.
   */
  // uint32_t log2i(uint32_t val);

  /**
   * @brief Gets the tag for the given address.
   * @param addr The address.
   * @return The tag.
   */
  // uint32_t getTag(uint32_t addr);

  /**
   * @brief Gets the ID for the given address.
   * @param addr The address.
   * @return The ID.
   */
  // uint32_t getId(uint32_t addr);

  /**
   * @brief Gets the offset for the given address.
   * @param addr The address.
   * @return The offset.
   */
  // uint32_t getOffset(uint32_t addr);

  /**
   * @brief Gets the address for the given block.
   * @param b The block.
   * @return The address.
   */
  // uint32_t getAddr(Block &b);
};

#endif