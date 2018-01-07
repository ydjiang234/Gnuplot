set term wxt
load 'fun.gp'
#a = data_range('/Users/JYD/Google Drive/Python_Scripts/Test/Test/3_Test.txt')
#print a
#print max(2,1)
file_name = '/Users/JYD/Google Drive/Python_Scripts/Test/Test/3_Test.txt'
eval(data_range_cmd(file_name))
print out

