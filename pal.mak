CLR_DEF:=[0m
CLR_RED:=[31m
CLR_GRN:=[32m
CLR_YEL:=[33m
CLR_BLU:=[34m
CLR_MAG:=[35m
CLR_CYN:=[36m
CLR_WHT:=[37m
ifeq ($(OS),Windows_NT)
	CLR_ESC:=
else
	CLR_ESC:=\e
endif

ifeq ($(OS),Windows_NT)
define pal_mkdir
	if not exist "$(subst /,\,$(1))" mkdir "$(subst /,\,$(1))"
endef
define pal_rmdir
	if exist "$(subst /,\,$(1))" rmdir /Q /S "$(subst /,\,$(1))"
endef
define pal_rm
	if exist "$(subst /,\,$(1))" del "$(subst /,\,$(1))"
endef
define pal_cp
	if exist "$(subst /,\,$(1))" copy /y "$(subst /,\,$(1))" "$(subst /,\,$(2))"
endef
define pal_cpdir
	if exist "$(subst /,\,$(1))" xcopy /Y /E /I "$(subst /,\,$(1))" "$(subst /,\,$(2))"
endef
define pal_clrrst
	echo $(CLR_DEF)
endef
define pal_clrtxt
	echo $(CLR_ESC)$(1)$(2)$(CLR_ESC)$(CLR_DEF)
endef
else
define pal_mkdir
	mkdir -p $(1)
endef
define pal_rmdir
	rm -rf $(1)
endef
define pal_rm
	rm -f $(1)
endef
define pal_cp
	cp $(1) $(2)
endef
define pal_cpdir
	cp -r $(1)/* $(2)
endef
define pal_clrrst
	tput init
endef
define pal_clrtxt
	echo "$(CLR_ESC)$(1)$(2)$(CLR_ESC)$(CLR_DEF)"
endef
endif

ifeq ($(OS),Windows_NT)
	EXT_BIN:=exe
	EXT_LIB_STATIC:=lib
	EXT_LIB_SHARED:=dll
else
	EXT_BIN:=elf
	EXT_LIB_STATIC:=a
	EXT_LIB_SHARED:=so
endif

ifeq ($(OS),Windows_NT)
	MAKE:=mingw32-make
else
	MAKE:=make
endif

ifeq ($(OS),Windows_NT)
	CMAKE_GENERATOR:=MinGW Makefiles
else
	CMAKE_GENERATOR:=Unix Makefiles
endif
