/+ dub.sdl:
	name "test"
	dependency "libjxl-d" path="."
+/
module test;

import jxl.decode;

void main()
{
	auto dec = JxlDecoderCreate(null);
	assert(dec !is null);
	JxlDecoderDestroy(dec);
}
