set term wxt 0 font ", 10" size 600,600
set colorsequence podo
path_data = "/Users/JYD/Google Drive/Python_Scripts/Test"
path_data = "D:/Google Drive/Python_Scripts/Test"
test_num = "3 4 7 8 23 24 31 32"
length = 13.5
set multiplot layout 3, 3 margin 0.1,0.99,0.1,0.97 spacing 0.05,0.05
set grid
#set xlabel 'Drift ratio'
#set ylabel 'Lateral load [kN]'
set format x "%.0f%%"
set key off
do for [i=1:words(test_num)] {
    unset xlabel
    unset ylabel
    if (i%2==1) {set xrange [-10:10]} else {set xrange [-5:5]}

    if (i>6) {set xlabel 'Drift ratio'}

    if (i%3==1) {set ylabel 'Lateral load [kN]'}

    if (i==3 | i==5 | i==7) {
        plot sprintf("%s/Test/%s_Test.txt", path_data, word(test_num, i)) using ($1*-1/length):($2*-1) title 'Test' ls 1 with lines,\
        sprintf("%s/ABAQUS/%s_FE.txt", path_data, word(test_num, i)) using ($1/length):2 title '3D' ls 2 with lines
    } else {
        plot sprintf("%s/Test/%s_Test.txt", path_data, word(test_num, i)) using ($1/length):($2) title 'Test' ls 1 with lines,\
        sprintf("%s/ABAQUS/%s_FE.txt", path_data, word(test_num, i)) using ($1/length):2 title '3D' ls 2 with lines
    }
}
unset multiplot
