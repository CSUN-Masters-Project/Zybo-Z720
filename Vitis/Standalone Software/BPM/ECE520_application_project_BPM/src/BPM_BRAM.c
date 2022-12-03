#include <stdio.h>
#include <time.h> // for clock_t, clock(), CLOCKS_PER_SEC
#include "PmodAD2.h"
#include "sleep.h"
#include "platform.h"
#include "xil_cache.h"
#include "xparameters.h"
#include "xil_io.h"
#include "xil_printf.h"

#define bram_base XPAR_BRAM_0_BASEADDR

PmodAD2 myDevice;

u16 conv;
u8 channel;
double voltage;
int samples = 1000;
double volt [1000];

int main() {
	int index = 0;
	int i = 0;
	while(index < samples) {

	init_platform();

	//initialize PMOD AD2
	AD2_begin(&myDevice, XPAR_PMODAD2_0_AXI_LITE_IIC_BASEADDR, AD2_IIC_ADDR);

	// Turn on channel 0
	AD2_WriteConfig(&myDevice, AD2_CONFIG_CH0);
	// Turn on all channels
	//AD2_DEFAULT_CONFIG

	AD2_ReadConv(&myDevice, &conv);

	// Keep 12-bit result, masking or bit select
	conv &= 0xFFF;

	//Scale captured data such that 0x000:0xFFF => 0.0:3.3
	voltage = (double) (conv & AD2_DATA_MASK) * 3.3 / (AD2_DATA_MASK + 1);
	volt[index] = conv;

	// Pull channel read information out of conv
	channel = (conv & AD2_CHANNEL_MASK) >> AD2_CHANNEL_BIT;
	printf("conv = %f V \r\n", (double) conv);
	printf("Pin V%d = %.02f V \r\n", channel + 1, voltage);
	index++;
	}
	printf("I am done testing!!! \r\n");
	int wr_data = 0, rd_data = 0;
		u64 bram_addr_rd = bram_base;
		u64 bram_addr_wr = bram_base;
		init_platform();

		print("Testing BRAM! \r\n");
		for(int i = 0; i < 100; i++) {
			bram_addr_wr = bram_addr_wr + 4; //offset for two bytes use 8, skips every byte
			wr_data = (int) volt[i];
			//wr_data = i;
			//wr_data = 0xABCD00 + i;
			Xil_Out64(bram_addr_wr, wr_data);
			xil_printf("0x%p : 0x%x\r\n", bram_addr_wr, wr_data);
		}

			for(int i = 0; i < 10; i++) {
				bram_addr_rd = bram_addr_rd + 4;
				rd_data = Xil_In32(bram_addr_rd);
				xil_printf("0x%p : 0x%x\r\n", bram_addr_rd, rd_data); //%p for port maybe
			}

		cleanup_platform();
		return 0;
}
