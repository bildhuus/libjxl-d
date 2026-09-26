/* Copyright (c) the JPEG XL Project Authors. All rights reserved.
 *
 * Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
 */

/** @addtogroup libjxl_metadata
 * @{
 * @file compressed_icc.h
 * @brief Utility functions to compress and decompress ICC streams.
 */
module jxl.compressed_icc;

public import jxl.memory_manager;

extern (C):

/**
 * Allocates a buffer using the memory manager, fills it with a compressed
 * representation of an ICC profile, returns the result through @c output_buffer
 * and indicates its size through @c output_size.
 *
 * The result must be freed using the memory manager once it is not of any more
 * use.
 *
 * @param[in] memory_manager Pointer to a JxlMemoryManager.
 * @param[in] icc Pointer to a buffer containing the uncompressed ICC profile.
 * @param[in] icc_size Size of the buffer containing the ICC profile.
 * @param[out] compressed_icc Will be set to a pointer to the buffer containing
 * the result.
 * @param[out] compressed_icc_size Will be set to the size of the buffer
 * containing the result.
 * @return Whether compressing the profile was successful.
 */
int JxlICCProfileEncode (
    const(JxlMemoryManager)* memory_manager,
    const(ubyte)* icc,
    size_t icc_size,
    ubyte** compressed_icc,
    size_t* compressed_icc_size);

/**
 * Allocates a buffer using the memory manager, fills it with the decompressed
 * version of the ICC profile in @c compressed_icc, returns the result through
 * @c output_buffer and indicates its size through @c output_size.
 *
 * The result must be freed using the memory manager once it is not of any more
 * use.
 *
 * @param[in] memory_manager Pointer to a JxlMemoryManager.
 * @param[in] compressed_icc Pointer to a buffer containing the compressed ICC
 * profile.
 * @param[in] compressed_icc_size Size of the buffer containing the compressed
 * ICC profile.
 * @param[out] icc Will be set to a pointer to the buffer containing the result.
 * @param[out] icc_size Will be set to the size of the buffer containing the
 * result.
 * @return Whether decompressing the profile was successful.
 */
int JxlICCProfileDecode (
    const(JxlMemoryManager)* memory_manager,
    const(ubyte)* compressed_icc,
    size_t compressed_icc_size,
    ubyte** icc,
    size_t* icc_size);

/* JXL_COMPRESSED_ICC_H_ */

/** @} */
