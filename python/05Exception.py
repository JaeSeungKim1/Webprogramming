float('1.23423')
string='23.13' #'abcd'
try:
    float(string)
except:
    print('fail to convert',end='')
    print(string)
else:
    print('ok')
finally:
    print('finally')