set_global_assignment -entity "pll_1" -library "lib_pll_1" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll_1" -library "lib_pll_1" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "pll_1" -library "lib_pll_1" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll_1" -name SPD_FILE [file join $::quartus(sip_path) "pll_1.spd"]

set_global_assignment -library "lib_pll_1" -name MISC_FILE [file join $::quartus(sip_path) "pll_1_sim/pll_1.vo"]
