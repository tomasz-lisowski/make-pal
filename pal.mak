ifeq ($(OS),Windows_NT)
    CLR_DEF:=[0m
    CLR_RED:=[31m
    CLR_GRN:=[32m
    CLR_YEL:=[33m
    CLR_BLU:=[34m
    CLR_MAG:=[35m
    CLR_CYN:=[36m
    CLR_WHT:=[37m
else
    CLR_DEF:=\e[0m
    CLR_RED:=\e[31m
    CLR_GRN:=\e[32m
    CLR_YEL:=\e[33m
    CLR_BLU:=\e[34m
    CLR_MAG:=\e[35m
    CLR_CYN:=\e[36m
    CLR_WHT:=\e[37m
endif

ifeq ($(OS),Windows_NT)
define pal_mkdir
    if not exist "$(subst /,\,$(1))" mkdir "$(subst /,\,$(1))"
endef
define pal_rmdir
    if exist "$(subst /,\,$(1))" rmdir /Q /S "$(subst /,\,$(1))"
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
    echo $(1)$(2)$(CLR_DEF)
endef
else
define pal_mkdir
    mkdir -p $(1)
endef
define pal_rmdir
    rm -rf $(1)
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
    echo "$(1)$(2)$(CLR_DEF)"
endef
endif

ifeq ($(OS),Windows_NT)
    BIN_EXT:=exe
else
    BIN_EXT:=elf
endif