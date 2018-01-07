max(a,b) = (a>b) ? a:b
min(a,b) = (a>b) ? b:a

data_range_cmd(file_path) = (str = 'stats "%s" using 1:2 name "A" nooutput; out = sprintf("%f %f %f %f", A_min_x, A_max_x, A_min_y, A_max_y)' ,\
    sprintf(str, file_path) \
)
    
