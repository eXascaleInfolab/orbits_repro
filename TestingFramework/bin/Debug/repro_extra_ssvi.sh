#!/bin/sh

# Figure 13
mono TestingFramework.exe ./scrextra/f13_metaorbitsrt_ssvi_len.cfg
python -c 'from scrextra.f13_avger import average; average("length", "soccer", 2);' >> ResultsSVector/f13_len.txt
/bin/echo -e "\n" >> ResultsSVector/f13_len.txt

mono TestingFramework.exe ./scrextra/f13_metaorbitsrt_ssvi_col.cfg
python -c 'from scrextra.f13_avger import average; average("columns", "soccer", 2);' >> ResultsSVector/f13_col.txt
/bin/echo -e "\n" >> ResultsSVector/f13_col.txt
