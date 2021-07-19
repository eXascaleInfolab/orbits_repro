#!/bin/sh

# Figure 5 a-c
mono TestingFramework.exe ./scrextra/f5_miss.cfg

# Figure 7 a-c
mono TestingFramework.exe ./scrextra/f7_tsblockfix.cfg

# Figure 8 a-c
mono TestingFramework.exe ./scrextra/f8_tsmulti.cfg

# Figure 9

### TBA

# Figure 10 a
mono TestingFramework.exe ./scrextra/f10_lenrt.cfg

# Figure 11
mono TestingFramework.exe ./scrextra/f11_colrt.cfg

# Figure 12
mono TestingFramework.exe ./scrextra/f12_augrt.cfg
