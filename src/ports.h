#ifndef PORTS_H_
#define PORTS_H_

#include <stdint.h>

/*==================== PORT TYPES ==================== */
typedef volatile uint32_t* port32_t;
typedef volatile uint16_t* port16_t;
typedef volatile uint8_t* port8_t;
/*==================== --------- ==================== */

/* ==================== GPIO ==================== */
#define GPIO_BASE 0x40020C00
#define GPIO_MODER ((port32_t)GPIO_BASE)

// ODR
#define GPIO_D_ODR      ((port16_t)(GPIO_BASE + 0x14))
#define GPIO_D_ODR_LOW  ((port8_t)(GPIO_BASE + 0x14))
#define GPIO_D_ODR_HIGH ((port8_t)(GPIO_BASE + 0x15))

// IDR
#define GPIO_D_IDR      ((port16_t)(GPIO_BASE + 0x10))
#define GPIO_D_IDR_LOW  ((port8_t)(GPIO_BASE + 0x10))
#define GPIO_D_IDR_HIGH ((port8_t)(GPIO_BASE + 0x11))
/* ==================== ---- ==================== */

/* ==================== STK ==================== */
#define STK_BASE 0xE000E010
#define STK_CTRL    ((port32_t)(STK_BASE))
#define STK_LOAD    ((port32_t)(STK_BASE + 0x4))
#define STK_VAL     ((port32_t)(STK_BASE + 0x8))
#define STK_CALIB   ((port32_t)(STK_BASE + 0xC))

/* ==================== --- ==================== */

#endif // PORTS_H_
