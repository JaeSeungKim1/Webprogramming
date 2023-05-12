#리스트
a=[]
a=["Apple",10,False]
#a[1]="test"
print(a[1])

#list slicing
a=[1,10,11,20,21,30,31]
x=a[1:3]
print(x)
y=a[::2]  #0~7까지의 값을 표현,2는 1칸 뛴 2번째 값을 가져오겠다는 뜻
print(y)

b=["banana","drum",True]
b.append(99.9)
b[1]=44
del b[2]
print(b)
b.remove(99.9)
print(b)
b.insert(0,'zero')
print(b)

x=[1,2,3,4]
y=['apple','banana']
z=x+y
print(z)

x.extend(y)
print(x)
#반복
z=x*3
print(z)

q=['a','b','c']
w=[10,11,q,True,'string']
print(q+w)
print(w[2][0:2])

#List comprehension 리스트 내포
num=list(range(1,11))
print(num)
lst=[i**2 for i in num]
print(lst)
lst2 = ['even' if i%2==0 else 'odd' for i in num]
print(lst2)
lst3 = [i**2 for i in range(10) if i%2==0]
print(lst3)