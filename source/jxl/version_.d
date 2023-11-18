module jxl.version_;

enum JPEGXL_MAJOR_VERSION = 0; ///< JPEG XL Major version
enum JPEGXL_MINOR_VERSION = 9; ///< JPEG XL Minor version
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
int JPEGXL_COMPUTE_NUMERIC_VERSION()(int major, int minor, int patch) { return ((major<<24) | (minor<<16) | (patch<<8) | 0); }

/* Numeric representation of the version */
enum JPEGXL_NUMERIC_VERSION = JPEGXL_COMPUTE_NUMERIC_VERSION(JPEGXL_MAJOR_VERSION,JPEGXL_MINOR_VERSION,JPEGXL_PATCH_VERSION);
