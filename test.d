/+ dub.sdl:
	name "test"
	dependency "freeimage-static" path="."
+/
module test;

import freeimage;

void main()
{
	FreeImage_Initialise(true);
	assert(FreeImage_GetVersion() !is null);
	FreeImage_DeInitialise();
}
