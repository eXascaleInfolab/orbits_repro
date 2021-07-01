#!/usr/bin/python
# baseline - unchanged
resfolder = "ResultsSVector/";
extype = "streaming_end";
algos = ["asv", "orbits"];

# calling

#python -c 'from f13_avger import average; average("columns", "drift10", 2);'

def average(scen, data, k):
    # func
    rtfolder = resfolder + extype + "/" + scen + "/" + data + "/" + "runtime/values/";

    avgs = {};
    algcount = len(algos);
    ptcount = 0;

    for alg in algos:
        avgs[alg] = 0.0;
    #end for

    for alg in algos:
        rtvals = open(rtfolder + alg + "_k" + str(k) + "_runtime.txt", "r");
        lines = rtvals.readlines();
        
        for line in lines:
            line = line.replace('\n', '');
            vals = line.split();
            avgs[alg] += float(vals[1]);
            ptcount += 1;
        #end for
    #end for

    ptcount /= algcount;

    print "# data = " + data + "; test = " + scen;
    for alg in algos:
        avgs[alg] /= ptcount;
        print alg + '\t' + str(avgs[alg]);
    #end for
#end function
