#include "unity.h"
#include "gpio_driver.h"

#include "Mocksystem.h"

void test_is_LED_On_shouldBeTrueWhenPinHigh(void)
{
    LED_PIN_GetValue_ExpectAndReturn(true);
    TEST_ASSERT_TRUE( is_LED_On(false) );
}

void test_is_LED_On_shouldBeTrueWhenPinLowButInverted(void)
{
    LED_PIN_GetValue_ExpectAndReturn(false);
    TEST_ASSERT_TRUE( is_LED_On(true) );
}

void test_is_LED_On_shouldBeFalseWhenPinLow(void)
{
    LED_PIN_GetValue_ExpectAndReturn(false);
    TEST_ASSERT_FALSE( is_LED_On(false) );
}

void test_is_LED_On_shouldBeFalseWhenPinHighButInverted(void)
{
    LED_PIN_GetValue_ExpectAndReturn(true);
    TEST_ASSERT_FALSE( is_LED_On(true) );
}