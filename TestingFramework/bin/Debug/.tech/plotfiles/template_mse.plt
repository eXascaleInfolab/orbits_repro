set terminal postscript eps enhanced color "Helvetica" 30
set output "error/plots/{code}_mse.eps"

set xrange [{caseStart}-1:{caseEnd}+1]
set xtics {caseStart},{caseTick}
{hash_log_inv}set yrange [0:1.6]
{hash_log}set yrange [0.05:2]
{hash_log}set ytics (0.5,1,2)
{hash_log}set log y

set key above width -2 vertical maxrows 3
set tmargin 4.0

set xlabel "{descr}"
set ylabel "MSE" offset 1.5 

plot\
	{mse}


set output "error/plots/{code}_rmse.eps"
set ylabel "RMSE" offset 1.5 

plot\
	{rmse}

set output "error/plots/{code}_mae.eps"
set ylabel "MAE" offset 1.5 

plot\
	{mae}
