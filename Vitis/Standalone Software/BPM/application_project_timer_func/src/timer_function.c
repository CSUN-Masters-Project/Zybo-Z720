/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include <stdint.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "sleep.h"


#define global_time_base 0xF8F00200
#define size 5

uint32_t timestamp[size];
uint32_t sample[size];
uint64_t t[size];

uint64_t time_elapsed(); //allows function to be used globally

int main()
{
    init_platform();

    print("Hello World \n\r");
    print("Successfully ran Hello World application \n\r");

    uint64_t start_time = time_elapsed();
    for(int i =0; i < size-1; i++) {
    //usleep(13000000); //13000000us = 13000ms = 13s
    //usleep(1000000); //1000000us= 1000ms = 1s
    usleep(60000000); //60000000us= 60000ms = 60s
    t[i]= time_elapsed();
    }
    uint64_t final_time = time_elapsed();

    //300 * 1s = 300 seconds = 5 minutes
    //14 * 1s = 14 seconds
    //5 * 13s = 65 seconds = 1 min and 5 seconds

    for(int i = 0; i < size-1; i++) {
        printf("timestamp[%d] = %d seconds \r\n",i, t[i]);
      }

    printf("start time = %d seconds \r\n", start_time);
    printf("start time = %d seconds \r\n", final_time);

//    print("Other method \n\r");
//    printf("%" PRIu64 "\r\n", start_time);
//    printf("%" PRIu64 "\r\n", final_time);


//    for(int i =0; i < size-1; i++) {
//    sample[i] = i; // ADC samples
//	//timestamp[i] = Xil_In32(global_time_base);
//	usleep(100); //100us
//    }

    cleanup_platform();
    return 0;
}

uint64_t time_elapsed() {

	/* local variable declaration */
	//1. Read the upper 32-bit timer counter register.
	uint32_t upper_bits = Xil_In32(global_time_base + 4);

	//2. Read the lower 32-bit timer counter register.
	uint32_t lower_bits = Xil_In32(global_time_base);

	//3. Read the upper 32-bit timer counter register again. If the value is different to the 32-bit upper value
	uint32_t tmp_bits = Xil_In32(global_time_base + 4);

	if(tmp_bits == upper_bits) {
		//global timer value is valid
		//concatenate or something else
		uint64_t i = (uint64_t) upper_bits << 32 | lower_bits; //returns 64 bit result
		//printf("%" PRIu64 "\n", i);
		return i;
	}
	//read previously, go to the previous step. Otherwise the 64-bit timer counter value is correct.
}


