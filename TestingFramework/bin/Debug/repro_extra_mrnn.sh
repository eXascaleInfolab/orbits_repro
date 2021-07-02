#!/bin/sh

# Figure 5 a-c
mono TestingFramework.exe ./scrlong/f5_miss.cfg

# Figure 7 a-c
mono TestingFramework.exe ./scrlong/f7_tsblockfix.cfg

# Figure 8 a-c
mono TestingFramework.exe ./scrlong/f8_tsmulti.cfg

# Figure 9

### TBA

# Figure 10 a
mono TestingFramework.exe ./scrlong/f10_lenrt.cfg

# Figure 11
mono TestingFramework.exe ./scrlong/f11_colrt.cfg

# Figure 12
mono TestingFramework.exe ./scrlong/f12_augrt.cfg
