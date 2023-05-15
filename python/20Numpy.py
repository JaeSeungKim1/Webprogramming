'''
NumPy(넘파이)
행렬 / 배열 처리 및 연산
'''
import numpy as np
#중첩 list
a=[[1,2,3],[4,5,6],[7,8,9]]
print(a)
b=np.array(a)
print(b)
print(b.ndim)
print(b.shape)
print(b[0,0])
a=[[1,2,3],[4,5,6],[7,8,9]]
print(b.mean(),b.var(),b.std()) #평균,분산, 표준편차

print(np.arange(5,10))
print(np.zeros((3,3)))
print(np.ones((2,4)))
print(np.full((2,3),7))

#단위 행렬 (1,0,0
#          0,1,1
#          0,0,1)
print(np.eye(3))

x=np.arange(25)
print(x)
y=x.reshape((5,5))
print(y)
#print(y[0:2, 0:2])
z=y[0:2, 0:2]
print(z,z.shape)

a= np.arange(1,4)
b=np.array([4,5,6])
#c=a+b
c=np.add(a,b)

print(c)
print(a-b,np.subtract(a,b))
print(a*b,np.multiply(a,b))
print(a/b,np.divide(a,b))

k=np.array([[1,2,3],[4,5,6]])
print(k.sum())
print(k.sum(axis=0)) #배열 안에 첫번째 두번째 세번째 자리 위치에 맞게 더하기
print(k.sum(axis=1)) #배열 안에 수를 더하는 것
print(k.prod()) #배열 안에 전부다 곱하기

arr1 = np.array([[1,2],[3,4]])  #1*5 + 2*7 = 19
                                #1*6 + 2*8 = 22
                                #3*5 + 4*7 = 43
                                #3*6 + 4*8 = 50
arr2 = np.array([[5,6],[7,8]])
arrR = np.dot(arr1,arr2)
print(arrR)

x=np.random.uniform(size=100)
x.reshape(20,5)
print(x)

s=np.random.normal(0,1,1000)

import matplotlib.pyplot as plt
plt.hist(s)
plt.show()
