module jxl.types;
@nogc nothrow:
extern(C): __gshared:

public import core.stdc.stddef;
public import core.stdc.stdint;


/**
 * A portable @c bool replacement.
 *
 * ::JXL_BOOL is a "documentation" type: actually it is @c int, but in API it
 * denotes a type, whose only values are ::JXL_TRUE and ::JXL_FALSE.
 */
alias JXL_BOOL = int;
/** Portable @c true replacement. */
enum JXL_TRUE = 1;
/** Portable @c false replacement. */
enum JXL_FALSE = 0;
/** Converts of bool-like value to either JXL_TRUE or JXL_FALSE. */
enum string TO_JXL_BOOL(string C) = `(!!(` ~ C ~ `) ? JXL_TRUE : JXL_FALSE)`;

/** Data type for the sample values per channel per pixel.
 */
enum JxlDataType {
  /** Use 32-bit single-precision floating point values, with range 0.0-1.0
   * (within gamut, may go outside this range for wide color gamut). Floating
   * point output, either JXL_TYPE_FLOAT or JXL_TYPE_FLOAT16, is recommended
   * for HDR and wide gamut images when color profile conversion is required. */
  JXL_TYPE_FLOAT = 0,

  /** Use type uint8_t. May clip wide color gamut data.
   */
  JXL_TYPE_UINT8 = 2,

  /** Use type uint16_t. May clip wide color gamut data.
   */
  JXL_TYPE_UINT16 = 3,

  /** Use 16-bit IEEE 754 half-precision floating point values */
  JXL_TYPE_FLOAT16 = 5,
}
alias JXL_TYPE_FLOAT = JxlDataType.JXL_TYPE_FLOAT;
alias JXL_TYPE_UINT8 = JxlDataType.JXL_TYPE_UINT8;
alias JXL_TYPE_UINT16 = JxlDataType.JXL_TYPE_UINT16;
alias JXL_TYPE_FLOAT16 = JxlDataType.JXL_TYPE_FLOAT16;


/** Ordering of multi-byte data.
 */
enum JxlEndianness {
  /** Use the endianness of the system, either little endian or big endian,
   * without forcing either specific endianness. Do not use if pixel data
   * should be exported to a well defined format.
   */
  JXL_NATIVE_ENDIAN = 0,
  /** Force little endian */
  JXL_LITTLE_ENDIAN = 1,
  /** Force big endian */
  JXL_BIG_ENDIAN = 2,
}
alias JXL_NATIVE_ENDIAN = JxlEndianness.JXL_NATIVE_ENDIAN;
alias JXL_LITTLE_ENDIAN = JxlEndianness.JXL_LITTLE_ENDIAN;
alias JXL_BIG_ENDIAN = JxlEndianness.JXL_BIG_ENDIAN;


/** Data type for the sample values per channel per pixel for the output buffer
 * for pixels. This is not necessarily the same as the data type encoded in the
 * codestream. The channels are interleaved per pixel. The pixels are
 * organized row by row, left to right, top to bottom.
 * TODO(lode): support different channel orders if needed (RGB, BGR, ...)
 */
struct JxlPixelFormat {
  /** Amount of channels available in a pixel buffer.
   * 1: single-channel data, e.g. grayscale or a single extra channel
   * 2: single-channel + alpha
   * 3: trichromatic, e.g. RGB
   * 4: trichromatic + alpha
   * TODO(lode): this needs finetuning. It is not yet defined how the user
   * chooses output color space. CMYK+alpha needs 5 channels.
   */
  uint num_channels;

  /** Data type of each channel.
   */
  JxlDataType data_type;

  /** Whether multi-byte data types are represented in big endian or little
   * endian format. This applies to JXL_TYPE_UINT16, JXL_TYPE_UINT32
   * and JXL_TYPE_FLOAT.
   */
  JxlEndianness endianness;

  /** Align scanlines to a multiple of align bytes, or 0 to require no
   * alignment at all (which has the same effect as value 1)
   */
  size_t align_;
}

/** Settings for the interpretation of UINT input and output buffers.
 *  (buffers using a FLOAT data type are not affected by this)
 */
enum JxlBitDepthType {
  /** This is the default setting, where the encoder expects the input pixels
   * to use the full range of the pixel format data type (e.g. for UINT16, the
   * input range is 0 .. 65535 and the value 65535 is mapped to 1.0 when
   * converting to float), and the decoder uses the full range to output
   * pixels. If the bit depth in the basic info is different from this, the
   * encoder expects the values to be rescaled accordingly (e.g. multiplied by
   * 65535/4095 for a 12-bit image using UINT16 input data type). */
  JXL_BIT_DEPTH_FROM_PIXEL_FORMAT = 0,

  /** If this setting is selected, the encoder expects the input pixels to be
   * in the range defined by the bits_per_sample value of the basic info (e.g.
   * for 12-bit images using UINT16 input data types, the allowed range is
   * 0 .. 4095 and the value 4095 is mapped to 1.0 when converting to float),
   * and the decoder outputs pixels in this range. */
  JXL_BIT_DEPTH_FROM_CODESTREAM = 1,

  /** This setting can only be used in the decoder to select a custom range for
   * pixel output */
  JXL_BIT_DEPTH_CUSTOM = 2,
}
alias JXL_BIT_DEPTH_FROM_PIXEL_FORMAT = JxlBitDepthType.JXL_BIT_DEPTH_FROM_PIXEL_FORMAT;
alias JXL_BIT_DEPTH_FROM_CODESTREAM = JxlBitDepthType.JXL_BIT_DEPTH_FROM_CODESTREAM;
alias JXL_BIT_DEPTH_CUSTOM = JxlBitDepthType.JXL_BIT_DEPTH_CUSTOM;


/** Data type for describing the interpretation of the input and output buffers
 * in terms of the range of allowed input and output pixel values. */
struct JxlBitDepth {
  /** Bit depth setting, see comment on @ref JxlBitDepthType */
  JxlBitDepthType type;

  /** Custom bits per sample */
  uint bits_per_sample;

  /** Custom exponent bits per sample */
  uint exponent_bits_per_sample;
}

/** Data type holding the 4-character type name of an ISOBMFF box.
 */
alias JxlBoxType = char[4];
