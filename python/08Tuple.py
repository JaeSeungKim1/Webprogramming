#Tuple 튜플 (sql db 구조에서) row, record? 소괄호() 사용되면 튜블이다
t = ('apple',10,True)
print(t)
t1 = (100)
print(t1,type(t1))
t2 = (100,)
print(t2,type(t2))

print(t[1],t[1:3],t[-1])

print(t+t2)
print(t*3)

city,town = ("seoul","Guro")
print(city,town)