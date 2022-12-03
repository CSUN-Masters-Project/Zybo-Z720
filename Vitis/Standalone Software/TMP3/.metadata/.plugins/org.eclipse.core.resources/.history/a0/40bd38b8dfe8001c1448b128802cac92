/*
Add the following headers:
xparameters.h  Contains system parameters for the Xilinx device driver
PmodTMP3.h     Contains TMP3 driver functions
sleep.h        Contains functions for creating a pause in the execution
xil_printf.h   To Print to the STDOUT
*/
#include "xparameters.h"
#include "PmodTMP3.h"
#include "sleep.h"
#include "xil_printf.h"



PmodTMP3 myDevice;

int main() {
    // Print a message indicating the program started
	xil_printf("Program started\r\n");
    // Note You need to update the BSP to forward STDOUT to Pmod UART.
    // Initialize the device use the following
    // TMP3_begin(device_object_address, <DEVICE_ID_FOR_PMODTMP>, TMP3_ADDR);
	TMP3_begin(&myDevice, XPAR_PMODTMP3_0_AXI_LITE_IIC_BASEADDR, TMP3_ADDR);

	   int temp  = 0.0;
	   int temp2 = 0.0;
	   double temp3 = 0.0;

	   while (1) {
	      temp  = TMP3_getTemp(&myDevice);
	      temp2 = TMP3_CtoF(temp);

	      //xil_printf does not include decimals : double, float
	      xil_printf("Temperature: %d in Celsius\n\r", temp);
	      xil_printf("Temperature: %d in Fahrenheit\n\r", temp2);
	      print("\n\r");
 	      sleep(1); // Delay
}
	   TMP3_end(&myDevice);
	   xil_printf("PmodTMP3 Disconnected\n\r");
	   xil_printf("Closing UART Connection\n\r");
	   return 0;
}
