# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "CMOS_FRAME_WAITCNT" -parent ${Page_0}


}

proc update_PARAM_VALUE.CMOS_FRAME_WAITCNT { PARAM_VALUE.CMOS_FRAME_WAITCNT } {
	# Procedure called to update CMOS_FRAME_WAITCNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CMOS_FRAME_WAITCNT { PARAM_VALUE.CMOS_FRAME_WAITCNT } {
	# Procedure called to validate CMOS_FRAME_WAITCNT
	return true
}


proc update_MODELPARAM_VALUE.CMOS_FRAME_WAITCNT { MODELPARAM_VALUE.CMOS_FRAME_WAITCNT PARAM_VALUE.CMOS_FRAME_WAITCNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CMOS_FRAME_WAITCNT}] ${MODELPARAM_VALUE.CMOS_FRAME_WAITCNT}
}

