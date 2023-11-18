module jxl.color_encoding;
@nogc nothrow:
extern(C): __gshared:

public import core.stdc.stdint;

/** Color space of the image data. */
enum JxlColorSpace {
  /** Tristimulus RGB */
  JXL_COLOR_SPACE_RGB,
  /** Luminance based, the primaries in JxlColorEncoding must be ignored. This
   * value implies that num_color_channels in JxlBasicInfo is 1, any other value
   * implies num_color_channels is 3. */
  JXL_COLOR_SPACE_GRAY,
  /** XYB (opsin) color space */
  JXL_COLOR_SPACE_XYB,
  /** None of the other table entries describe the color space appropriately */
  JXL_COLOR_SPACE_UNKNOWN,
}
alias JXL_COLOR_SPACE_RGB = JxlColorSpace.JXL_COLOR_SPACE_RGB;
alias JXL_COLOR_SPACE_GRAY = JxlColorSpace.JXL_COLOR_SPACE_GRAY;
alias JXL_COLOR_SPACE_XYB = JxlColorSpace.JXL_COLOR_SPACE_XYB;
alias JXL_COLOR_SPACE_UNKNOWN = JxlColorSpace.JXL_COLOR_SPACE_UNKNOWN;


/** Built-in whitepoints for color encoding. When decoding, the numerical xy
 * whitepoint value can be read from the JxlColorEncoding white_point field
 * regardless of the enum value. When encoding, enum values except
 * JXL_WHITE_POINT_CUSTOM override the numerical fields. Some enum values match
 * a subset of CICP (Rec. ITU-T H.273 | ISO/IEC 23091-2:2019(E)), however the
 * white point and RGB primaries are separate enums here.
 */
enum JxlWhitePoint {
  /** CIE Standard Illuminant D65: 0.3127, 0.3290 */
  JXL_WHITE_POINT_D65 = 1,
  /** White point must be read from the JxlColorEncoding white_point field, or
   * as ICC profile. This enum value is not an exact match of the corresponding
   * CICP value. */
  JXL_WHITE_POINT_CUSTOM = 2,
  /** CIE Standard Illuminant E (equal-energy): 1/3, 1/3 */
  JXL_WHITE_POINT_E = 10,
  /** DCI-P3 from SMPTE RP 431-2: 0.314, 0.351 */
  JXL_WHITE_POINT_DCI = 11,
}
alias JXL_WHITE_POINT_D65 = JxlWhitePoint.JXL_WHITE_POINT_D65;
alias JXL_WHITE_POINT_CUSTOM = JxlWhitePoint.JXL_WHITE_POINT_CUSTOM;
alias JXL_WHITE_POINT_E = JxlWhitePoint.JXL_WHITE_POINT_E;
alias JXL_WHITE_POINT_DCI = JxlWhitePoint.JXL_WHITE_POINT_DCI;


/** Built-in primaries for color encoding. When decoding, the primaries can be
 * read from the JxlColorEncoding primaries_red_xy, primaries_green_xy and
 * primaries_blue_xy fields regardless of the enum value. When encoding, the
 * enum values except JXL_PRIMARIES_CUSTOM override the numerical fields. Some
 * enum values match a subset of CICP (Rec. ITU-T H.273 | ISO/IEC
 * 23091-2:2019(E)), however the white point and RGB primaries are separate
 * enums here.
 */
enum JxlPrimaries {
  /** The CIE xy values of the red, green and blue primaries are: 0.639998686,
     0.330010138; 0.300003784, 0.600003357; 0.150002046, 0.059997204 */
  JXL_PRIMARIES_SRGB = 1,
  /** Primaries must be read from the JxlColorEncoding primaries_red_xy,
   * primaries_green_xy and primaries_blue_xy fields, or as ICC profile. This
   * enum value is not an exact match of the corresponding CICP value. */
  JXL_PRIMARIES_CUSTOM = 2,
  /** As specified in Rec. ITU-R BT.2100-1 */
  JXL_PRIMARIES_2100 = 9,
  /** As specified in SMPTE RP 431-2 */
  JXL_PRIMARIES_P3 = 11,
}
alias JXL_PRIMARIES_SRGB = JxlPrimaries.JXL_PRIMARIES_SRGB;
alias JXL_PRIMARIES_CUSTOM = JxlPrimaries.JXL_PRIMARIES_CUSTOM;
alias JXL_PRIMARIES_2100 = JxlPrimaries.JXL_PRIMARIES_2100;
alias JXL_PRIMARIES_P3 = JxlPrimaries.JXL_PRIMARIES_P3;


/** Built-in transfer functions for color encoding. Enum values match a subset
 * of CICP (Rec. ITU-T H.273 | ISO/IEC 23091-2:2019(E)) unless specified
 * otherwise. */
enum JxlTransferFunction {
  /** As specified in SMPTE RP 431-2 */
  JXL_TRANSFER_FUNCTION_709 = 1,
  /** None of the other table entries describe the transfer function. */
  JXL_TRANSFER_FUNCTION_UNKNOWN = 2,
  /** The gamma exponent is 1 */
  JXL_TRANSFER_FUNCTION_LINEAR = 8,
  /** As specified in IEC 61966-2-1 sRGB */
  JXL_TRANSFER_FUNCTION_SRGB = 13,
  /** As specified in SMPTE ST 2084 */
  JXL_TRANSFER_FUNCTION_PQ = 16,
  /** As specified in SMPTE ST 428-1 */
  JXL_TRANSFER_FUNCTION_DCI = 17,
  /** As specified in Rec. ITU-R BT.2100-1 (HLG) */
  JXL_TRANSFER_FUNCTION_HLG = 18,
  /** Transfer function follows power law given by the gamma value in
     JxlColorEncoding. Not a CICP value. */
  JXL_TRANSFER_FUNCTION_GAMMA = 65535,
}
alias JXL_TRANSFER_FUNCTION_709 = JxlTransferFunction.JXL_TRANSFER_FUNCTION_709;
alias JXL_TRANSFER_FUNCTION_UNKNOWN = JxlTransferFunction.JXL_TRANSFER_FUNCTION_UNKNOWN;
alias JXL_TRANSFER_FUNCTION_LINEAR = JxlTransferFunction.JXL_TRANSFER_FUNCTION_LINEAR;
alias JXL_TRANSFER_FUNCTION_SRGB = JxlTransferFunction.JXL_TRANSFER_FUNCTION_SRGB;
alias JXL_TRANSFER_FUNCTION_PQ = JxlTransferFunction.JXL_TRANSFER_FUNCTION_PQ;
alias JXL_TRANSFER_FUNCTION_DCI = JxlTransferFunction.JXL_TRANSFER_FUNCTION_DCI;
alias JXL_TRANSFER_FUNCTION_HLG = JxlTransferFunction.JXL_TRANSFER_FUNCTION_HLG;
alias JXL_TRANSFER_FUNCTION_GAMMA = JxlTransferFunction.JXL_TRANSFER_FUNCTION_GAMMA;


/** Renderig intent for color encoding, as specified in ISO 15076-1:2010 */
enum JxlRenderingIntent {
  /** vendor-specific */
  JXL_RENDERING_INTENT_PERCEPTUAL = 0,
  /** media-relative */
  JXL_RENDERING_INTENT_RELATIVE,
  /** vendor-specific */
  JXL_RENDERING_INTENT_SATURATION,
  /** ICC-absolute */
  JXL_RENDERING_INTENT_ABSOLUTE,
}
alias JXL_RENDERING_INTENT_PERCEPTUAL = JxlRenderingIntent.JXL_RENDERING_INTENT_PERCEPTUAL;
alias JXL_RENDERING_INTENT_RELATIVE = JxlRenderingIntent.JXL_RENDERING_INTENT_RELATIVE;
alias JXL_RENDERING_INTENT_SATURATION = JxlRenderingIntent.JXL_RENDERING_INTENT_SATURATION;
alias JXL_RENDERING_INTENT_ABSOLUTE = JxlRenderingIntent.JXL_RENDERING_INTENT_ABSOLUTE;


/** Color encoding of the image as structured information.
 */
struct JxlColorEncoding {
  /** Color space of the image data.
   */
  JxlColorSpace color_space;

  /** Built-in white point. If this value is JXL_WHITE_POINT_CUSTOM, must
   * use the numerical whitepoint values from white_point_xy.
   */
  JxlWhitePoint white_point;

  /** Numerical whitepoint values in CIE xy space. */
  double[2] white_point_xy = 0;

  /** Built-in RGB primaries. If this value is JXL_PRIMARIES_CUSTOM, must
   * use the numerical primaries values below. This field and the custom values
   * below are unused and must be ignored if the color space is
   * JXL_COLOR_SPACE_GRAY or JXL_COLOR_SPACE_XYB.
   */
  JxlPrimaries primaries;

  /** Numerical red primary values in CIE xy space. */
  double[2] primaries_red_xy = 0;

  /** Numerical green primary values in CIE xy space. */
  double[2] primaries_green_xy = 0;

  /** Numerical blue primary values in CIE xy space. */
  double[2] primaries_blue_xy = 0;

  /** Transfer function if have_gamma is 0 */
  JxlTransferFunction transfer_function;

  /** Gamma value used when transfer_function is JXL_TRANSFER_FUNCTION_GAMMA
   */
  double gamma = 0;

  /** Rendering intent defined for the color profile. */
  JxlRenderingIntent rendering_intent;
}
