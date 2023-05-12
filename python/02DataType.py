# 기본 자료형
# 리터럴 상수(Scalar data type)-int, float, bool, None
#  리스트(list), 튜플(tuple), 딕션(dictionary), 집합(set)

var1 = "Hello python"
print(var1)
print(type(var1))

var1=100
print(var1)
print(type(var1))

var1 = 123.23
print(var1)
print(type(var1))

var1 = True
print(var1)
print(type(var1))

# 자료형 변환(casting)
a = int(10.5)
b = int(20.14)
sum = a+b
print('합계',sum)

c = int(True)
d= int(False)
print(c,d)

ss='2'
print(int(ss)*4)
# print(str**3)


# 문자열
# 따옴표 (',')(",")(''' .... ''')
oneLine = 'abcdefghijklmnopqrstuvwxyz'
print(oneLine)
oneLine = "abcdefghijklmnopqrstuvwxyz"
print(oneLine)
multiLine = '''abcd
efghijkl
mnopqrstu
vwxyz'''
print(multiLine) 

multiLine="abcdefg\nhijklmn\nopqrstuvwxyz"
print(multiLine)

input="나는 열심히 공부하는 학생입니다."
print(input[7:14])
print(input[-1])
print('python'+"application")
print('python'+repr)