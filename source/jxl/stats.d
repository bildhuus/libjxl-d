/* Copyright (c) the JPEG XL Project Authors. All rights reserved.
 *
 * Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
 */

/** @addtogroup libjxl_encoder
 * @{
 * @file stats.h
 * @brief API to collect various statistics from JXL encoder.
 */
module jxl.stats;

extern (C):

/**
 * Opaque structure that holds the encoder statistics.
 *
 * Allocated and initialized with @ref JxlEncoderStatsCreate().
 * Cleaned up and deallocated with @ref JxlEncoderStatsDestroy().
 */
struct JxlEncoderStats;

/**
 * Creates an instance of JxlEncoderStats and initializes it.
 *
 * @return pointer to initialized @ref JxlEncoderStats instance
 */
JxlEncoderStats* JxlEncoderStatsCreate ();

/**
 * Deinitializes and frees JxlEncoderStats instance.
 *
 * @param stats instance to be cleaned up and deallocated. No-op if stats is
 * null pointer.
 */
void JxlEncoderStatsDestroy (JxlEncoderStats* stats);

/** Data type for querying @ref JxlEncoderStats object
 */
enum JxlEncoderStatsKey
{
    JXL_ENC_STAT_HEADER_BITS = 0,
    JXL_ENC_STAT_TOC_BITS = 1,
    JXL_ENC_STAT_DICTIONARY_BITS = 2,
    JXL_ENC_STAT_SPLINES_BITS = 3,
    JXL_ENC_STAT_NOISE_BITS = 4,
    JXL_ENC_STAT_QUANT_BITS = 5,
    JXL_ENC_STAT_MODULAR_TREE_BITS = 6,
    JXL_ENC_STAT_MODULAR_GLOBAL_BITS = 7,
    JXL_ENC_STAT_DC_BITS = 8,
    JXL_ENC_STAT_MODULAR_DC_GROUP_BITS = 9,
    JXL_ENC_STAT_CONTROL_FIELDS_BITS = 10,
    JXL_ENC_STAT_COEF_ORDER_BITS = 11,
    JXL_ENC_STAT_AC_HISTOGRAM_BITS = 12,
    JXL_ENC_STAT_AC_BITS = 13,
    JXL_ENC_STAT_MODULAR_AC_GROUP_BITS = 14,
    JXL_ENC_STAT_NUM_SMALL_BLOCKS = 15,
    JXL_ENC_STAT_NUM_DCT4X8_BLOCKS = 16,
    JXL_ENC_STAT_NUM_AFV_BLOCKS = 17,
    JXL_ENC_STAT_NUM_DCT8_BLOCKS = 18,
    JXL_ENC_STAT_NUM_DCT8X32_BLOCKS = 19,
    JXL_ENC_STAT_NUM_DCT16_BLOCKS = 20,
    JXL_ENC_STAT_NUM_DCT16X32_BLOCKS = 21,
    JXL_ENC_STAT_NUM_DCT32_BLOCKS = 22,
    JXL_ENC_STAT_NUM_DCT32X64_BLOCKS = 23,
    JXL_ENC_STAT_NUM_DCT64_BLOCKS = 24,
    JXL_ENC_STAT_NUM_BUTTERAUGLI_ITERS = 25,
    JXL_ENC_NUM_STATS = 26
}

/** Returns the value of the statistics corresponding the given key.
 *
 * @param stats object that was passed to the encoder with a
 *   @ref JxlEncoderCollectStats function
 * @param key the particular statistics to query
 *
 * @return the value of the statistics
 */
size_t JxlEncoderStatsGet (
    const(JxlEncoderStats)* stats,
    JxlEncoderStatsKey key);

/** Updates the values of the given stats object with that of an other.
 *
 * @param stats object whose values will be updated (usually added together)
 * @param other stats object whose values will be merged with stats
 */
void JxlEncoderStatsMerge (
    JxlEncoderStats* stats,
    const(JxlEncoderStats)* other);

/* JXL_STATS_H_ */

/** @}*/
