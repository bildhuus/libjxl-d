module jxl.codestream_header;
@nogc nothrow:
extern(C): __gshared:

public import jxl.types;
public import core.stdc.stddef;
public import core.stdc.stdint;

/** Image orientation metadata.
 * Values 1..8 match the EXIF definitions.
 * The name indicates the operation to perform to transform from the encoded
 * image to the display image.
 */
enum JxlOrientation {
  JXL_ORIENT_IDENTITY = 1,
  JXL_ORIENT_FLIP_HORIZONTAL = 2,
  JXL_ORIENT_ROTATE_180 = 3,
  JXL_ORIENT_FLIP_VERTICAL = 4,
  JXL_ORIENT_TRANSPOSE = 5,
  JXL_ORIENT_ROTATE_90_CW = 6,
  JXL_ORIENT_ANTI_TRANSPOSE = 7,
  JXL_ORIENT_ROTATE_90_CCW = 8,
}
alias JXL_ORIENT_IDENTITY = JxlOrientation.JXL_ORIENT_IDENTITY;
alias JXL_ORIENT_FLIP_HORIZONTAL = JxlOrientation.JXL_ORIENT_FLIP_HORIZONTAL;
alias JXL_ORIENT_ROTATE_180 = JxlOrientation.JXL_ORIENT_ROTATE_180;
alias JXL_ORIENT_FLIP_VERTICAL = JxlOrientation.JXL_ORIENT_FLIP_VERTICAL;
alias JXL_ORIENT_TRANSPOSE = JxlOrientation.JXL_ORIENT_TRANSPOSE;
alias JXL_ORIENT_ROTATE_90_CW = JxlOrientation.JXL_ORIENT_ROTATE_90_CW;
alias JXL_ORIENT_ANTI_TRANSPOSE = JxlOrientation.JXL_ORIENT_ANTI_TRANSPOSE;
alias JXL_ORIENT_ROTATE_90_CCW = JxlOrientation.JXL_ORIENT_ROTATE_90_CCW;


/** Given type of an extra channel.
 */
enum JxlExtraChannelType {
  JXL_CHANNEL_ALPHA,
  JXL_CHANNEL_DEPTH,
  JXL_CHANNEL_SPOT_COLOR,
  JXL_CHANNEL_SELECTION_MASK,
  JXL_CHANNEL_BLACK,
  JXL_CHANNEL_CFA,
  JXL_CHANNEL_THERMAL,
  JXL_CHANNEL_RESERVED0,
  JXL_CHANNEL_RESERVED1,
  JXL_CHANNEL_RESERVED2,
  JXL_CHANNEL_RESERVED3,
  JXL_CHANNEL_RESERVED4,
  JXL_CHANNEL_RESERVED5,
  JXL_CHANNEL_RESERVED6,
  JXL_CHANNEL_RESERVED7,
  JXL_CHANNEL_UNKNOWN,
  JXL_CHANNEL_OPTIONAL
}
alias JXL_CHANNEL_ALPHA = JxlExtraChannelType.JXL_CHANNEL_ALPHA;
alias JXL_CHANNEL_DEPTH = JxlExtraChannelType.JXL_CHANNEL_DEPTH;
alias JXL_CHANNEL_SPOT_COLOR = JxlExtraChannelType.JXL_CHANNEL_SPOT_COLOR;
alias JXL_CHANNEL_SELECTION_MASK = JxlExtraChannelType.JXL_CHANNEL_SELECTION_MASK;
alias JXL_CHANNEL_BLACK = JxlExtraChannelType.JXL_CHANNEL_BLACK;
alias JXL_CHANNEL_CFA = JxlExtraChannelType.JXL_CHANNEL_CFA;
alias JXL_CHANNEL_THERMAL = JxlExtraChannelType.JXL_CHANNEL_THERMAL;
alias JXL_CHANNEL_RESERVED0 = JxlExtraChannelType.JXL_CHANNEL_RESERVED0;
alias JXL_CHANNEL_RESERVED1 = JxlExtraChannelType.JXL_CHANNEL_RESERVED1;
alias JXL_CHANNEL_RESERVED2 = JxlExtraChannelType.JXL_CHANNEL_RESERVED2;
alias JXL_CHANNEL_RESERVED3 = JxlExtraChannelType.JXL_CHANNEL_RESERVED3;
alias JXL_CHANNEL_RESERVED4 = JxlExtraChannelType.JXL_CHANNEL_RESERVED4;
alias JXL_CHANNEL_RESERVED5 = JxlExtraChannelType.JXL_CHANNEL_RESERVED5;
alias JXL_CHANNEL_RESERVED6 = JxlExtraChannelType.JXL_CHANNEL_RESERVED6;
alias JXL_CHANNEL_RESERVED7 = JxlExtraChannelType.JXL_CHANNEL_RESERVED7;
alias JXL_CHANNEL_UNKNOWN = JxlExtraChannelType.JXL_CHANNEL_UNKNOWN;
alias JXL_CHANNEL_OPTIONAL = JxlExtraChannelType.JXL_CHANNEL_OPTIONAL;


/** The codestream preview header */
struct JxlPreviewHeader {
  /** Preview width in pixels */
  uint xsize;

  /** Preview height in pixels */
  uint ysize;
}

/** The codestream animation header, optionally present in the beginning of
 * the codestream, and if it is it applies to all animation frames, unlike
 * JxlFrameHeader which applies to an individual frame.
 */
struct JxlAnimationHeader {
  /** Numerator of ticks per second of a single animation frame time unit */
  uint tps_numerator;

  /** Denominator of ticks per second of a single animation frame time unit */
  uint tps_denominator;

  /** Amount of animation loops, or 0 to repeat infinitely */
  uint num_loops;

  /** Whether animation time codes are present at animation frames in the
   * codestream */
  JXL_BOOL have_timecodes;
}

/** Basic image information. This information is available from the file
 * signature and first part of the codestream header.
 */
struct JxlBasicInfo {
  /* TODO(lode): need additional fields for (transcoded) JPEG? For reusable
   * fields orientation must be read from Exif APP1. For has_icc_profile: must
   * look up where ICC profile is guaranteed to be in a JPEG file to be able to
   * indicate this. */

  /* TODO(lode): make struct packed, and/or make this opaque struct with getter
   * functions (still separate struct from opaque decoder) */

  /** Whether the codestream is embedded in the container format. If true,
   * metadata information and extensions may be available in addition to the
   * codestream.
   */
  JXL_BOOL have_container;

  /** Width of the image in pixels, before applying orientation.
   */
  uint xsize;

  /** Height of the image in pixels, before applying orientation.
   */
  uint ysize;

  /** Original image color channel bit depth.
   */
  uint bits_per_sample;

  /** Original image color channel floating point exponent bits, or 0 if they
   * are unsigned integer. For example, if the original data is half-precision
   * (binary16) floating point, bits_per_sample is 16 and
   * exponent_bits_per_sample is 5, and so on for other floating point
   * precisions.
   */
  uint exponent_bits_per_sample;

  /** Upper bound on the intensity level present in the image in nits. For
   * unsigned integer pixel encodings, this is the brightness of the largest
   * representable value. The image does not necessarily contain a pixel
   * actually this bright. An encoder is allowed to set 255 for SDR images
   * without computing a histogram.
   * Leaving this set to its default of 0 lets libjxl choose a sensible default
   * value based on the color encoding.
   */
  float intensity_target = 0;

  /** Lower bound on the intensity level present in the image. This may be
   * loose, i.e. lower than the actual darkest pixel. When tone mapping, a
   * decoder will map [min_nits, intensity_target] to the display range.
   */
  float min_nits = 0;

  /** See the description of @see linear_below.
   */
  JXL_BOOL relative_to_max_display;

  /** The tone mapping will leave unchanged (linear mapping) any pixels whose
   * brightness is strictly below this. The interpretation depends on
   * relative_to_max_display. If true, this is a ratio [0, 1] of the maximum
   * display brightness [nits], otherwise an absolute brightness [nits].
   */
  float linear_below = 0;

  /** Whether the data in the codestream is encoded in the original color
   * profile that is attached to the codestream metadata header, or is
   * encoded in an internally supported absolute color space (which the decoder
   * can always convert to linear or non-linear sRGB or to XYB). If the original
   * profile is used, the decoder outputs pixel data in the color space matching
   * that profile, but doesn't convert it to any other color space. If the
   * original profile is not used, the decoder only outputs the data as sRGB
   * (linear if outputting to floating point, nonlinear with standard sRGB
   * transfer function if outputting to unsigned integers) but will not convert
   * it to to the original color profile. The decoder also does not convert to
   * the target display color profile. To convert the pixel data produced by
   * the decoder to the original color profile, one of the JxlDecoderGetColor*
   * functions needs to be called with @ref JXL_COLOR_PROFILE_TARGET_DATA to get
   * the color profile of the decoder output, and then an external CMS can be
   * used for conversion.
   * Note that for lossy compression, this should be set to false for most use
   * cases, and if needed, the image should be converted to the original color
   * profile after decoding, as described above.
   */
  JXL_BOOL uses_original_profile;

  /** Indicates a preview image exists near the beginning of the codestream.
   * The preview itself or its dimensions are not included in the basic info.
   */
  JXL_BOOL have_preview;

  /** Indicates animation frames exist in the codestream. The animation
   * information is not included in the basic info.
   */
  JXL_BOOL have_animation;

  /** Image orientation, value 1-8 matching the values used by JEITA CP-3451C
   * (Exif version 2.3).
   */
  JxlOrientation orientation;

  /** Number of color channels encoded in the image, this is either 1 for
   * grayscale data, or 3 for colored data. This count does not include
   * the alpha channel or other extra channels. To check presence of an alpha
   * channel, such as in the case of RGBA color, check alpha_bits != 0.
   * If and only if this is 1, the JxlColorSpace in the JxlColorEncoding is
   * JXL_COLOR_SPACE_GRAY.
   */
  uint num_color_channels;

  /** Number of additional image channels. This includes the main alpha channel,
   * but can also include additional channels such as depth, additional alpha
   * channels, spot colors, and so on. Information about the extra channels
   * can be queried with JxlDecoderGetExtraChannelInfo. The main alpha channel,
   * if it exists, also has its information available in the alpha_bits,
   * alpha_exponent_bits and alpha_premultiplied fields in this JxlBasicInfo.
   */
  uint num_extra_channels;

  /** Bit depth of the encoded alpha channel, or 0 if there is no alpha channel.
   * If present, matches the alpha_bits value of the JxlExtraChannelInfo
   * associated with this alpha channel.
   */
  uint alpha_bits;

  /** Alpha channel floating point exponent bits, or 0 if they are unsigned. If
   * present, matches the alpha_bits value of the JxlExtraChannelInfo associated
   * with this alpha channel. integer.
   */
  uint alpha_exponent_bits;

  /** Whether the alpha channel is premultiplied. Only used if there is a main
   * alpha channel. Matches the alpha_premultiplied value of the
   * JxlExtraChannelInfo associated with this alpha channel.
   */
  JXL_BOOL alpha_premultiplied;

  /** Dimensions of encoded preview image, only used if have_preview is
   * JXL_TRUE.
   */
  JxlPreviewHeader preview;

  /** Animation header with global animation properties for all frames, only
   * used if have_animation is JXL_TRUE.
   */
  JxlAnimationHeader animation;

  /** Intrinsic width of the image.
   * The intrinsic size can be different from the actual size in pixels
   * (as given by xsize and ysize) and it denotes the recommended dimensions
   * for displaying the image, i.e. applications are advised to resample the
   * decoded image to the intrinsic dimensions.
   */
  uint intrinsic_xsize;

  /** Intrinsic height of the image.
   * The intrinsic size can be different from the actual size in pixels
   * (as given by xsize and ysize) and it denotes the recommended dimensions
   * for displaying the image, i.e. applications are advised to resample the
   * decoded image to the intrinsic dimensions.
   */
  uint intrinsic_ysize;

  /** Padding for forwards-compatibility, in case more fields are exposed
   * in a future version of the library.
   */
  ubyte[100] padding;
}

/** Information for a single extra channel.
 */
struct JxlExtraChannelInfo {
  /** Given type of an extra channel.
   */
  JxlExtraChannelType type;

  /** Total bits per sample for this channel.
   */
  uint bits_per_sample;

  /** Floating point exponent bits per channel, or 0 if they are unsigned
   * integer.
   */
  uint exponent_bits_per_sample;

  /** The exponent the channel is downsampled by on each axis.
   * TODO(lode): expand this comment to match the JPEG XL specification,
   * specify how to upscale, how to round the size computation, and to which
   * extra channels this field applies.
   */
  uint dim_shift;

  /** Length of the extra channel name in bytes, or 0 if no name.
   * Excludes null termination character.
   */
  uint name_length;

  /** Whether alpha channel uses premultiplied alpha. Only applicable if
   * type is JXL_CHANNEL_ALPHA.
   */
  JXL_BOOL alpha_premultiplied;

  /** Spot color of the current spot channel in linear RGBA. Only applicable if
   * type is JXL_CHANNEL_SPOT_COLOR.
   */
  float[4] spot_color = 0;

  /** Only applicable if type is JXL_CHANNEL_CFA.
   * TODO(lode): add comment about the meaning of this field.
   */
  uint cfa_channel;
}

/* TODO(lode): add API to get the codestream header extensions. */
/** Extensions in the codestream header. */
struct JxlHeaderExtensions {
  /** Extension bits. */
  ulong extensions;
}

/** Frame blend modes.
 * When decoding, if coalescing is enabled (default), this can be ignored.
 */
enum JxlBlendMode {
  JXL_BLEND_REPLACE = 0,
  JXL_BLEND_ADD = 1,
  JXL_BLEND_BLEND = 2,
  JXL_BLEND_MULADD = 3,
  JXL_BLEND_MUL = 4,
}
alias JXL_BLEND_REPLACE = JxlBlendMode.JXL_BLEND_REPLACE;
alias JXL_BLEND_ADD = JxlBlendMode.JXL_BLEND_ADD;
alias JXL_BLEND_BLEND = JxlBlendMode.JXL_BLEND_BLEND;
alias JXL_BLEND_MULADD = JxlBlendMode.JXL_BLEND_MULADD;
alias JXL_BLEND_MUL = JxlBlendMode.JXL_BLEND_MUL;


/** The information about blending the color channels or a single extra channel.
 * When decoding, if coalescing is enabled (default), this can be ignored and
 * the blend mode is considered to be JXL_BLEND_REPLACE.
 * When encoding, these settings apply to the pixel data given to the encoder.
 */
struct JxlBlendInfo {
  /** Blend mode.
   */
  JxlBlendMode blendmode;
  /** Reference frame ID to use as the 'bottom' layer (0-3).
   */
  uint source;
  /** Which extra channel to use as the 'alpha' channel for blend modes
   * JXL_BLEND_BLEND and JXL_BLEND_MULADD.
   */
  uint alpha;
  /** Clamp values to [0,1] for the purpose of blending.
   */
  JXL_BOOL clamp;
}

/** The information about layers.
 * When decoding, if coalescing is enabled (default), this can be ignored.
 * When encoding, these settings apply to the pixel data given to the encoder,
 * the encoder could choose an internal representation that differs.
 */
struct JxlLayerInfo {
  /** Whether cropping is applied for this frame. When decoding, if false,
   * crop_x0 and crop_y0 are set to zero, and xsize and ysize to the main
   * image dimensions. When encoding and this is false, those fields are
   * ignored. When decoding, if coalescing is enabled (default), this is always
   * false, regardless of the internal encoding in the JPEG XL codestream.
   */
  JXL_BOOL have_crop;

  /** Horizontal offset of the frame (can be negative).
   */
  int crop_x0;

  /** Vertical offset of the frame (can be negative).
   */
  int crop_y0;

  /** Width of the frame (number of columns).
   */
  uint xsize;

  /** Height of the frame (number of rows).
   */
  uint ysize;

  /** The blending info for the color channels. Blending info for extra channels
   * has to be retrieved separately using JxlDecoderGetExtraChannelBlendInfo.
   */
  JxlBlendInfo blend_info;

  /** After blending, save the frame as reference frame with this ID (0-3).
   * Special case: if the frame duration is nonzero, ID 0 means "will not be
   * referenced in the future". This value is not used for the last frame.
   * When encoding, ID 3 is reserved to frames that are generated internally by
   * the encoder, and should not be used by applications.
   */
  uint save_as_reference;
}

/** The header of one displayed frame or non-coalesced layer. */
struct JxlFrameHeader {
  /** How long to wait after rendering in ticks. The duration in seconds of a
   * tick is given by tps_numerator and tps_denominator in JxlAnimationHeader.
   */
  uint duration;

  /** SMPTE timecode of the current frame in form 0xHHMMSSFF, or 0. The bits are
   * interpreted from most-significant to least-significant as hour, minute,
   * second, and frame. If timecode is nonzero, it is strictly larger than that
   * of a previous frame with nonzero duration. These values are only available
   * if have_timecodes in JxlAnimationHeader is JXL_TRUE.
   * This value is only used if have_timecodes in JxlAnimationHeader is
   * JXL_TRUE.
   */
  uint timecode;

  /** Length of the frame name in bytes, or 0 if no name.
   * Excludes null termination character. This value is set by the decoder.
   * For the encoder, this value is ignored and @ref JxlEncoderSetFrameName is
   * used instead to set the name and the length.
   */
  uint name_length;

  /** Indicates this is the last animation frame. This value is set by the
   * decoder to indicate no further frames follow. For the encoder, it is not
   * required to set this value and it is ignored, @ref JxlEncoderCloseFrames is
   * used to indicate the last frame to the encoder instead.
   */
  JXL_BOOL is_last;

  /** Information about the layer in case of no coalescing.
   */
  JxlLayerInfo layer_info;
}
