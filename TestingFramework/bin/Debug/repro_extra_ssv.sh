#!/bin/sh

# Figure 13
mono TestingFramework.exe ./scrlong/f13_metaorbitsrt.cfg
python -c 'from scrlong.f13_avger import average; average("length", "soccer", 2);' >> ResultsSVector/f13_len.txt
/bin/echo -e "\n" >> ResultsSVector/f13_len.txt

python -c 'from scrlong.f13_avger import average; average("columns", "soccer", 2);' >> ResultsSVector/f13_col.txt
/bin/echo -e "\n" >> ResultsSVector/f13_col.txt
