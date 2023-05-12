#제어문
#조건문 if , elif
#반복문

#score = int(input('점수 입력:'))
#score=0

#if score>=85:
#    print('우수')
#elif score>=70:
#    print('보통')
#else:
#    print('미숙')

#print('당신의 점수: %d / 등급: %s'%(score))

#num=9
#result=0
#if(num>6):
#    result=num*2
#else:
#    result-num+2
#print(result)    

#위랑 같은 의미
#print(num*2 if num>6 else num+2)

#반복문
#while문
#cnt=tot=0
#datalst=[]
#while cnt<5:
#    cnt+=1
#    tot+=cnt
#    datalst.append(cnt)
#    print(cnt,tot)
#print(datalst)
 

#i=0
#while i<10:
#    if i==3:
#        continue
#    if i==6:
#        break
#    print(i,end='  ')
#print()
#for문
string='abcdfghijklmn'
print(len(string))
for s in string:
    print(s)
    
lst = [1,2,3,4,5,6,7]
for e in lst:
    print(e,end=' ')
print()
print(range(10))
for e in range(10):
    print(e,end=' ')
print()   
for e in range(3,10):
    print(e,end=' ')
print()
for e in range(1,10,2):
    print(e,end=' ')
print()

lst=['A','B','C']
if 'B' in lst:
    print("Ok")
else :
    print('No')
