module jxl.stats;
@nogc nothrow:
extern(C): __gshared:


public import core.stdc.stddef;


/**
 * Opaque structure that holds the encoder statistics.
 *
 * Allocated and initialized with JxlEncoderStatsCreate().
 * Cleaned up and deallocated with JxlEncoderStatsDestroy().
 */
struct JxlEncoderStatsStruct;
alias JxlEncoderStats = JxlEncoderStatsStruct;

/**
 * Creates an instance of JxlEncoderStats and initializes it.
 *
 * @return pointer to initialized JxlEncoderStats instance
 */
JxlEncoderStats* JxlEncoderStatsCreate();

/**
 * Deinitializes and frees JxlEncoderStats instance.
 *
 * @param stats instance to be cleaned up and deallocated. No-op if stats is
 * null pointer.
 */
void JxlEncoderStatsDestroy(JxlEncoderStats* stats);

/** Data type for querying JxlEncoderStats object
 */
enum JxlEncoderStatsKey {
  JXL_ENC_STAT_HEADER_BITS,
  JXL_ENC_STAT_TOC_BITS,
  JXL_ENC_STAT_DICTIONARY_BITS,
  JXL_ENC_STAT_SPLINES_BITS,
  JXL_ENC_STAT_NOISE_BITS,
  JXL_ENC_STAT_QUANT_BITS,
  JXL_ENC_STAT_MODULAR_TREE_BITS,
  JXL_ENC_STAT_MODULAR_GLOBAL_BITS,
  JXL_ENC_STAT_DC_BITS,
  JXL_ENC_STAT_MODULAR_DC_GROUP_BITS,
  JXL_ENC_STAT_CONTROL_FIELDS_BITS,
  JXL_ENC_STAT_COEF_ORDER_BITS,
  JXL_ENC_STAT_AC_HISTOGRAM_BITS,
  JXL_ENC_STAT_AC_BITS,
  JXL_ENC_STAT_MODULAR_AC_GROUP_BITS,
  JXL_ENC_STAT_NUM_SMALL_BLOCKS,
  JXL_ENC_STAT_NUM_DCT4X8_BLOCKS,
  JXL_ENC_STAT_NUM_AFV_BLOCKS,
  JXL_ENC_STAT_NUM_DCT8_BLOCKS,
  JXL_ENC_STAT_NUM_DCT8X32_BLOCKS,
  JXL_ENC_STAT_NUM_DCT16_BLOCKS,
  JXL_ENC_STAT_NUM_DCT16X32_BLOCKS,
  JXL_ENC_STAT_NUM_DCT32_BLOCKS,
  JXL_ENC_STAT_NUM_DCT32X64_BLOCKS,
  JXL_ENC_STAT_NUM_DCT64_BLOCKS,
  JXL_ENC_STAT_NUM_BUTTERAUGLI_ITERS,
  JXL_ENC_NUM_STATS,
}
alias JXL_ENC_STAT_HEADER_BITS = JxlEncoderStatsKey.JXL_ENC_STAT_HEADER_BITS;
alias JXL_ENC_STAT_TOC_BITS = JxlEncoderStatsKey.JXL_ENC_STAT_TOC_BITS;
alias JXL_ENC_STAT_DICTIONARY_BITS = JxlEncoderStatsKey.JXL_ENC_STAT_DICTIONARY_BITS;
alias JXL_ENC_STAT_SPLINES_BITS = JxlEncoderStatsKey.JXL_ENC_STAT_SPLINES_BITS;
alias JXL_ENC_STAT_NOISE_BITS = JxlEncoderStatsKey.JXL_ENC_STAT_NOISE_BITS;
alias JXL_ENC_STAT_QUANT_BITS = JxlEncoderStatsKey.JXL_ENC_STAT_QUANT_BITS;
alias JXL_ENC_STAT_MODULAR_TREE_BITS = JxlEncoderStatsKey.JXL_ENC_STAT_MODULAR_TREE_BITS;
alias JXL_ENC_STAT_MODULAR_GLOBAL_BITS = JxlEncoderStatsKey.JXL_ENC_STAT_MODULAR_GLOBAL_BITS;
alias JXL_ENC_STAT_DC_BITS = JxlEncoderStatsKey.JXL_ENC_STAT_DC_BITS;
alias JXL_ENC_STAT_MODULAR_DC_GROUP_BITS = JxlEncoderStatsKey.JXL_ENC_STAT_MODULAR_DC_GROUP_BITS;
alias JXL_ENC_STAT_CONTROL_FIELDS_BITS = JxlEncoderStatsKey.JXL_ENC_STAT_CONTROL_FIELDS_BITS;
alias JXL_ENC_STAT_COEF_ORDER_BITS = JxlEncoderStatsKey.JXL_ENC_STAT_COEF_ORDER_BITS;
alias JXL_ENC_STAT_AC_HISTOGRAM_BITS = JxlEncoderStatsKey.JXL_ENC_STAT_AC_HISTOGRAM_BITS;
alias JXL_ENC_STAT_AC_BITS = JxlEncoderStatsKey.JXL_ENC_STAT_AC_BITS;
alias JXL_ENC_STAT_MODULAR_AC_GROUP_BITS = JxlEncoderStatsKey.JXL_ENC_STAT_MODULAR_AC_GROUP_BITS;
alias JXL_ENC_STAT_NUM_SMALL_BLOCKS = JxlEncoderStatsKey.JXL_ENC_STAT_NUM_SMALL_BLOCKS;
alias JXL_ENC_STAT_NUM_DCT4X8_BLOCKS = JxlEncoderStatsKey.JXL_ENC_STAT_NUM_DCT4X8_BLOCKS;
alias JXL_ENC_STAT_NUM_AFV_BLOCKS = JxlEncoderStatsKey.JXL_ENC_STAT_NUM_AFV_BLOCKS;
alias JXL_ENC_STAT_NUM_DCT8_BLOCKS = JxlEncoderStatsKey.JXL_ENC_STAT_NUM_DCT8_BLOCKS;
alias JXL_ENC_STAT_NUM_DCT8X32_BLOCKS = JxlEncoderStatsKey.JXL_ENC_STAT_NUM_DCT8X32_BLOCKS;
alias JXL_ENC_STAT_NUM_DCT16_BLOCKS = JxlEncoderStatsKey.JXL_ENC_STAT_NUM_DCT16_BLOCKS;
alias JXL_ENC_STAT_NUM_DCT16X32_BLOCKS = JxlEncoderStatsKey.JXL_ENC_STAT_NUM_DCT16X32_BLOCKS;
alias JXL_ENC_STAT_NUM_DCT32_BLOCKS = JxlEncoderStatsKey.JXL_ENC_STAT_NUM_DCT32_BLOCKS;
alias JXL_ENC_STAT_NUM_DCT32X64_BLOCKS = JxlEncoderStatsKey.JXL_ENC_STAT_NUM_DCT32X64_BLOCKS;
alias JXL_ENC_STAT_NUM_DCT64_BLOCKS = JxlEncoderStatsKey.JXL_ENC_STAT_NUM_DCT64_BLOCKS;
alias JXL_ENC_STAT_NUM_BUTTERAUGLI_ITERS = JxlEncoderStatsKey.JXL_ENC_STAT_NUM_BUTTERAUGLI_ITERS;
alias JXL_ENC_NUM_STATS = JxlEncoderStatsKey.JXL_ENC_NUM_STATS;


/** Returns the value of the statistics corresponding the given key.
 *
 * @param stats object that was passed to the encoder with a
 *   @ref JxlEncoderCollectStats function
 * @param key the particular statistics to query
 *
 * @return the value of the statistics
 */
size_t JxlEncoderStatsGet(const(JxlEncoderStats)* stats, JxlEncoderStatsKey key);

/** Updates the values of the given stats object with that of an other.
 *
 * @param stats object whose values will be updated (usually added together)
 * @param other stats object whose values will be merged with stats
 */
void JxlEncoderStatsMerge(JxlEncoderStats* stats, const(JxlEncoderStats)* other);
