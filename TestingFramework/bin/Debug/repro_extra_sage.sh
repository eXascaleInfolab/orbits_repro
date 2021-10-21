#!/bin/sh

# Figure 5 a-c
mono TestingFramework.exe ./srcextra/sage/f5_miss.cfg
# Figure 5 d
mono TestingFramework.exe ./srcextra/sage/f5_miss2.cfg

# Figure 7 a-c
mono TestingFramework.exe ./srcextra/sage/f7_tsblockfix.cfg
# Figure 7 d
mono TestingFramework.exe ./srcextra/sage/f7_tsblockfix2.cfg

# Figure 8 a-c
mono TestingFramework.exe ./srcextra/sage/f8_tsmulti.cfg
# Figure 8 d
mono TestingFramework.exe ./srcextra/sage/f8_tsmulti2.cfg

# Figure 10 a
mono TestingFramework.exe ./srcextra/sage/f10_lenrt.cfg
# Figure 10 b
mono TestingFramework.exe ./srcextra/sage/f10_lenrt2.cfg

# Figure 11
mono TestingFramework.exe ./srcextra/sage/f11_colrt.cfg

# Figure 12
mono TestingFramework.exe ./srcextra/sage/f12_augrt.cfg
