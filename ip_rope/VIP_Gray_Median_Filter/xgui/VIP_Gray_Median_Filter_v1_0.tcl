# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "IMG_HDISP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IMG_VDISP" -parent ${Page_0}


}

proc update_PARAM_VALUE.IMG_HDISP { PARAM_VALUE.IMG_HDISP } {
	# Procedure called to update IMG_HDISP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IMG_HDISP { PARAM_VALUE.IMG_HDISP } {
	# Procedure called to validate IMG_HDISP
	return true
}

proc update_PARAM_VALUE.IMG_VDISP { PARAM_VALUE.IMG_VDISP } {
	# Procedure called to update IMG_VDISP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IMG_VDISP { PARAM_VALUE.IMG_VDISP } {
	# Procedure called to validate IMG_VDISP
	return true
}


proc update_MODELPARAM_VALUE.IMG_HDISP { MODELPARAM_VALUE.IMG_HDISP PARAM_VALUE.IMG_HDISP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IMG_HDISP}] ${MODELPARAM_VALUE.IMG_HDISP}
}

proc update_MODELPARAM_VALUE.IMG_VDISP { MODELPARAM_VALUE.IMG_VDISP PARAM_VALUE.IMG_VDISP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IMG_VDISP}] ${MODELPARAM_VALUE.IMG_VDISP}
}

