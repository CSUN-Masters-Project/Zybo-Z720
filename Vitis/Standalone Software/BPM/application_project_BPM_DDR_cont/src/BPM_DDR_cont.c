#include <stdio.h>
#include <stdint.h>
#include "PmodAD2.h"
#include "sleep.h"
#include "platform.h"
#include "xparameters.h"
#include "xil_io.h"
#include "xil_printf.h"

#define global_timer_clk 333000000 //global timer clock frequency 333MHz
#define global_time_base 0xF8F00200
#define size 1000000 //increase size for continous data or dont use array
#define window_size 700 //window size of 50 elements

//Pulse Sensor
PmodAD2 myDevice;
u8 channel;
double voltage;
u16 volt;
static u16 conv[size] = {'\0'};

//Timer function
static uint64_t timestamp[size] = {'\0'};
static double tmp[size] = {'\0'};
static double dummy[size] = {'\0'};
static double dummy2[size] = {'\0'};
static double t_diff[size] = {'\0'};

//Moving Average
uint32_t valid_index[size] = {'\0'}; //window size
uint32_t array[window_size] = {'\0'}; //window size
uint32_t mov_avg_array[size] = {'\0'}; //array for storing moving avg
uint32_t power[size];
uint32_t sum = 0;
uint64_t sum_avg = 0;
uint32_t mov_avg = 0;
uint32_t cnt = 0;
int x = 0;
int i =0;

double sum_time = 0;
double avg_BPM = 0;
double avg_BPM2 = 0;
double BPM = 0;
int y = 0;
int j = 0;

//change variables to local

//DDR memory base address 0x200
//#define ddr_base 0x00000200

uint64_t time_elapsed(); //allows function to be used globally

int main()
{
	init_platform();

    print("Hello World\n\r");
    print("Successfully ran Hello World application");

    //initialize PMOD AD2
    AD2_begin(&myDevice, XPAR_PMODAD2_0_AXI_LITE_IIC_BASEADDR, AD2_IIC_ADDR);

    // Turn on channel 0
    AD2_WriteConfig(&myDevice, AD2_CONFIG_CH0);
    // Turn on all channels, AD2_DEFAULT_CONFIG

    uint64_t start_time = time_elapsed();	//get start time

    while(1) { //forever loop
	AD2_ReadConv(&myDevice, &conv[i]);
    timestamp[i]= time_elapsed(); //get current time

	// Keep 12-bit result, masking or bit select
	conv[i] &= 0xFFF;

	//calculate first moving average
	sum += conv[i];
	insert(conv[i], cnt);

	cnt++;

		if(cnt >= window_size) {//window size of 700 and collecting 20,000 samples (5.98*2 = 12 seconds)
		mov_avg = (sum - array[window_size-1])/(window_size-1);
		mov_avg_array[i] = mov_avg;
		sum_avg += sum_avg + mov_avg;
		//printf("Moving Average = %d \r\n", mov_avg);
		//printf("Moving Average = %d \r\n", mov_avg); //%llu long long unsigned needed for uint64_t
		sum -= array[0];
		erase(1); //erase(0)

			//only enter if calculated first moving average,  && i > window_size
			//moving average scaler 1.35-1.75, tested 1.35-1.45 on VS Code
		    if(conv[i] > (mov_avg*1.45) && conv[i-1] < (mov_avg*1.45)){ //detecting rising edges
		    //if(conv[i] > (mov_avg*1.75) && conv[i-1] < (mov_avg*1.75)){ //detecting rising edges
			//timestamp[i]-timestamp[0] never exceeds a 52-bit number (156 days) 2^52/(333e6*86400) , 86400 = 24*60*60
			tmp[i] = (double) ((timestamp[i]-timestamp[0])/333000000.0); //returns time measurement in seconds

			valid_index[j] = i; //store valid timestamp index

				//if(tmp[i-1] > 0 && (tmp[i] - tmp[i-1]) > .4) { //check that a previous timestamp exists
				if((tmp[(valid_index[j])] - tmp[(valid_index[j-1])] > .4) && j >= 1) {
				//BPM = 60/(tmp[i]-tmp[i-1]);
				BPM = 60/(tmp[(valid_index[j])] - tmp[(valid_index[j-1])]);
				printf("rising edge[%d]= %.04lf \n", i, tmp[i]-tmp[i-1]);
				printf("BPM = %.04lf \n", i, BPM);
				}

	    		j++;
	    }
	}
				i++;

    }
    cleanup_platform();
        return 0;
}
//circular buffer

void insert (uint32_t val, uint32_t cond) {
	  uint16_t empty = {'\0'};
	  //when array is completely empty
	  if(cond<window_size){//only search for empty elements when window size is being filled
	  for(int i = 0; i < window_size; i++){
		  if(array[i] == empty) {
			  array[i] = val;//store adc value
			  return;
		  }
	  }
	  }
	  else{
		  array[window_size-1] = val;//if window is filled (window size - 1), store adc value at most recent sample
	  }
	  return;
}

void erase(){
	  for(int i = 0; i < window_size; i++){
		  if(i < window_size) {
			  array[i] = array[i+1]; //shift contents by 1
		  }
	  }
	  array[window_size-1] = 0; //empty most recent sample
	  return;
 }

uint64_t time_elapsed() {

	/* local variable declaration */
	//1. Read the upper 32-bit timer counter register.
	uint32_t upper_bits = Xil_In32(global_time_base + 4);

	//2. Read the lower 32-bit timer counter register.
	uint32_t lower_bits = Xil_In32(global_time_base);

	//3. Read the upper 32-bit timer counter register again. If the value is different to the 32-bit upper value
	uint32_t tmp_bits = Xil_In32(global_time_base + 4);

	if(tmp_bits == upper_bits) { //global timer value is valid
		uint64_t i = (uint64_t) upper_bits << 32 | lower_bits; //returns 64 bit result
		//printf("%" PRIu64 "\n", i);
		return i;
	}
	//read previously, go to the previous step. Otherwise the 64-bit timer counter value is correct.
}
