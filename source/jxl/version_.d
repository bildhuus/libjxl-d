/* Copyright (c) the JPEG XL Project Authors. All rights reserved.
 *
 * Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
 */
module jxl.version_;

extern (C):

/** @addtogroup libjxl_common
 * @{
 * @file version.h
 * @brief libjxl version information
 */

enum JPEGXL_MAJOR_VERSION = 0; ///< JPEG XL Major version
enum JPEGXL_MINOR_VERSION = 13; ///< JPEG XL Minor version
enum JPEGXL_PATCH_VERSION = 0; ///< JPEG XL Patch version

/** Can be used to conditionally compile code for a specific JXL version
 * @param[maj] major version
 * @param[min] minor version
 *
 * @code
 * #if JPEGXL_NUMERIC_VERSION < JPEGXL_COMPUTE_NUMERIC_VERSION(0,8,0)
 * // use old/deprecated api
 * #else
 * // use current api
 * #endif
 * @endcode
 */
extern (D) auto JPEGXL_COMPUTE_NUMERIC_VERSION(T0, T1, T2)(auto ref T0 major, auto ref T1 minor, auto ref T2 patch)
{
    return (major << 24) | (minor << 16) | (patch << 8) | 0;
}

/* Numeric representation of the version */
enum JPEGXL_NUMERIC_VERSION = JPEGXL_COMPUTE_NUMERIC_VERSION(JPEGXL_MAJOR_VERSION, JPEGXL_MINOR_VERSION, JPEGXL_PATCH_VERSION);

/* JXL_VERSION_H_ */

/** @}*/
