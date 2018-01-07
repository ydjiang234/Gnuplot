set term wxt 0
set colorsequence podo
path_data = "/Users/JYD/Google Drive/Python_Scripts/Test"
test_num = "3 4 7 8 23 24 31 32"
length = 13.5
set multiplot layout 3, 3
set grid
set xlabel 'Drift ratio'
set ylabel 'Lateral load [kN]'
set format x "%.0f%%"
set key off
do for [i=1:words(test_num)] {
    set xtics 5
    if (i==8) {
        set key at screen 0.75,0.2
    }
    if (i==3 | i==5 | i==7) {
        plot sprintf("%s/Test/%s_Test.txt", path_data, word(test_num, i)) using ($1*-1/length):($2*-1) title 'Test' ls 1 with lines,\
        sprintf("%s/ABAQUS/%s_FE.txt", path_data, word(test_num, i)) using ($1/length):2 title '3D' ls 2 with lines
    } else {
        plot sprintf("%s/Test/%s_Test.txt", path_data, word(test_num, i)) using ($1/length):($2) title 'Test' ls 1 with lines,\
        sprintf("%s/ABAQUS/%s_FE.txt", path_data, word(test_num, i)) using ($1/length):2 title '3D' ls 2 with lines
    }
    if (GPVAL_Y_MIN > (GPVAL_Y_MIN * -1)) {
        set yrange [GPVAL_Y_MIN:(GPVAL_Y_MIN *-1)]    
        replot
    }

}
unset multiplot
pause 5
