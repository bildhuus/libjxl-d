module jxl.memory_manager;
@nogc nothrow:
extern(C): __gshared:

public import core.stdc.stddef;

/**
 * Allocating function for a memory region of a given size.
 *
 * Allocates a contiguous memory region of size @p size bytes. The returned
 * memory may not be aligned to a specific size or initialized at all.
 *
 * @param opaque custom memory manager handle provided by the caller.
 * @param size in bytes of the requested memory region.
 * @return @c NULL if the memory can not be allocated,
 * @return pointer to the memory otherwise.
 */
alias jpegxl_alloc_func = void* function(void* opaque, size_t size);

/**
 * Deallocating function pointer type.
 *
 * This function @b MUST do nothing if @p address is @c NULL.
 *
 * @param opaque custom memory manager handle provided by the caller.
 * @param address memory region pointer returned by ::jpegxl_alloc_func, or @c
 * NULL.
 */
alias jpegxl_free_func = void function(void* opaque, void* address);

/**
 * Memory Manager struct.
 * These functions, when provided by the caller, will be used to handle memory
 * allocations.
 */
struct JxlMemoryManager {
  /** The opaque pointer that will be passed as the first parameter to all the
   * functions in this struct. */
  void* opaque;

  /** Memory allocation function. This can be NULL if and only if also the
   * free() member in this class is NULL. All dynamic memory will be allocated
   * and freed with these functions if they are not NULL. */
  jpegxl_alloc_func alloc;
  /** Free function matching the alloc() member. */
  jpegxl_free_func free;

  /* TODO(deymo): Add cache-aligned alloc/free functions here. */
}
