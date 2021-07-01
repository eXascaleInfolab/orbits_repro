#!/bin/sh

# Figure 5 a-c
mono TestingFramework.exe ./scrshort/f5_miss.cfg
# Figure 5 d
mono TestingFramework.exe ./scrshort/f5_miss2.cfg

# Figure 6

### ---

# Figure 7 a-c
mono TestingFramework.exe ./scrshort/f7_tsblockfix.cfg
# Figure 7 d
mono TestingFramework.exe ./scrshort/f7_tsblockfix2.cfg

# Figure 8 a-c
mono TestingFramework.exe ./scrshort/f8_tsmulti.cfg
# Figure 8 d
mono TestingFramework.exe ./scrshort/f8_tsmulti2.cfg

# Figure 9

### TBA

# Figure 10 a
mono TestingFramework.exe ./scrshort/f10_lenrt.cfg
# Figure 10 b
mono TestingFramework.exe ./scrshort/f10_lenrt2.cfg

# Figure 11
mono TestingFramework.exe ./scrshort/f11_colrt.cfg

# Figure 12
mono TestingFramework.exe ./scrshort/f12_augrt.cfg

# Figure 13
mono TestingFramework.exe ./scrshort/f13_metaorbitsrt.cfg
mono TestingFramework.exe ./scrshort/f13_metaorbitsrt2.cfg

python -c 'from scrlong.f13_avger import average; average("length", "drift10", 2);' >> ResultsSVector/f13_len.txt
/bin/echo -e "\n" >> ResultsSVector/f13_len.txt
python -c 'from scrlong.f13_avger import average; average("length", "motion", 2);' >> ResultsSVector/f13_len.txt
/bin/echo -e "\n" >> ResultsSVector/f13_len.txt
python -c 'from scrlong.f13_avger import average; average("length", "bafu", 2);' >> ResultsSVector/f13_len.txt
/bin/echo -e "\n" >> ResultsSVector/f13_len.txt
python -c 'from scrshort.f13_avger import average; average("length", "soccer", 2);' >> ResultsSVector/f13_len.txt
/bin/echo -e "\n" >> ResultsSVector/f13_len.txt

python -c 'from scrlong.f13_avger import average; average("columns", "drift10", 2);' >> ResultsSVector/f13_col.txt
/bin/echo -e "\n" >> ResultsSVector/f13_col.txt
python -c 'from scrlong.f13_avger import average; average("columns", "motion", 2);' >> ResultsSVector/f13_col.txt
/bin/echo -e "\n" >> ResultsSVector/f13_col.txt
python -c 'from scrlong.f13_avger import average; average("columns", "bafu", 2);' >> ResultsSVector/f13_col.txt
/bin/echo -e "\n" >> ResultsSVector/f13_col.txt
python -c 'from scrshort.f13_avger import average; average("columns", "soccer", 2);' >> ResultsSVector/f13_col.txt
/bin/echo -e "\n" >> ResultsSVector/f13_col.txt
