/*
    gpio_driver.c
*/

#include "gpio_driver.h"
#include "mcc_generated_files/system/pins.h"

// Silly function added to have something "interesting" for Ceedling to test
bool is_LED_On(bool invert)
{
    return invert ? !LED_PIN_GetValue() : LED_PIN_GetValue();
}