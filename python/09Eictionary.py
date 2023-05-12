#dict
dic = dict(key1=10,key2=20,key3=30)
print(dic)
dic1={'name':'alex','age':10,'gender':'man'}
print(dic1)
persons=[('a',10),('b',22),('c',33)]
perdic=dict(persons)
print(perdic)

print(dic['key1'])
dic1['name']='mark'
print(dic1)
del perdic['b'] #삭제
print(perdic)
perdic['d']=44  #추가
print(perdic)   
#print('name' in dic1)
#print(dic1['homo'],'name' in dic1) 요소가 있는지 없는지 확인

for key in dic.keys():
    print(key)
for val in dic.values():
    print(val)
for i in dic.items():
    print(i)


charset=['abc','code','rule','rule','adb']
wc={}
for key in charset:
    wc[key]= wc.get(key,0)+1
print(wc)
print(wc.get('kkkk','키 없음'))
wc.update(persons)
print(wc)

