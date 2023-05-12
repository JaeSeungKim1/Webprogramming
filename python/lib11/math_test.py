import math

def pytha(s,t):
    return math.sqrt(s**2 + t**2)

print(pytha(3,4))

def pytha2(s,t):
    a=s**2
    b=t**2
    c=a+b
    print('빗변의 길이:',math.sqrt(c))
    
pytha2(3,4)
