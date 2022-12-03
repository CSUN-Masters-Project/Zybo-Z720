# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\luisr\Desktop\Vitis\Graduate_Project\FPGA\BPM\ECE520_application_project_BPM_system\_ide\scripts\debugger_ece520_application_project_bpm-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\luisr\Desktop\Vitis\Graduate_Project\FPGA\BPM\ECE520_application_project_BPM_system\_ide\scripts\debugger_ece520_application_project_bpm-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351B481C2A" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351B481C2A-23727093-0"}
fpga -file C:/Users/luisr/Desktop/Vitis/Graduate_Project/FPGA/BPM/ECE520_application_project_BPM/_ide/bitstream/BPM_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/luisr/Desktop/Vitis/Graduate_Project/FPGA/BPM/BPM_wrapper/export/BPM_wrapper/hw/BPM_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/luisr/Desktop/Vitis/Graduate_Project/FPGA/BPM/ECE520_application_project_BPM/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/luisr/Desktop/Vitis/Graduate_Project/FPGA/BPM/ECE520_application_project_BPM/Debug/ECE520_application_project_BPM.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
