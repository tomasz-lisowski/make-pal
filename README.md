# Make PAL
1. Add `include <path/to/pal.mak>` to the top of a makefile.
2. Call any of the functions with `$(call pal_<func>,<arg1>,<arg2>)`, e.g. `$(call pal_clrtxt,$(CLR_BLU),prints this text in blue)`.
