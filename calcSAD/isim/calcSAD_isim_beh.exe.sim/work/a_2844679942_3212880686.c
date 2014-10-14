/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xb4d1ced7 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/brunno/Documents/vhdl/calcSAD/calcSAD.vhd";
extern char *WORK_P_3900060002;



static void work_a_2844679942_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    xsi_set_current_line(103, ng0);

LAB3:    t1 = (t0 + 16088U);
    t2 = *((char **)t1);
    t1 = ((WORK_P_3900060002) + 1768U);
    t3 = *((char **)t1);
    t4 = *((int *)t3);
    t5 = (t4 - 1);
    t6 = (t5 - 0);
    t7 = (t6 * 1);
    t8 = (t7 * 8U);
    t9 = (0 - 0);
    t10 = (t9 * 1);
    t11 = (t8 + t10);
    t12 = (12U * t11);
    t13 = (0 + t12);
    t1 = (t2 + t13);
    t14 = (t0 + 22320);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t1, 12U);
    xsi_driver_first_trans_fast_port(t14);

LAB2:    t19 = (t0 + 22240);
    *((int *)t19) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2844679942_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2844679942_3212880686_p_0};
	xsi_register_didat("work_a_2844679942_3212880686", "isim/calcSAD_isim_beh.exe.sim/work/a_2844679942_3212880686.didat");
	xsi_register_executes(pe);
}
