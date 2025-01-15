/* "mock" xc.h */

#ifndef _XC_H_
#define _XC_H_
#include <stdbool.h>

typedef union {
    struct {
        bool RF0                    :1;
        bool RF2                    :1;
        bool RF1                    :1;
        bool RF3                    :1;
        bool RF4                    :1;
        bool RF5                    :1;
        bool RF6                    :1;
        bool RF7                    :1;
    };
} PORTFbits_t;
extern volatile PORTFbits_t PORTFbits;

#endif		//_XC_H
