#f=open("./data/textTest.txt","r",encoding='UTF-8')
#print(f.read())
#f.close()

import os
os.chdir('C:/storage')
print(os.getcwd())
print(os.listdir('.'))
#os.mkdir('test')
#print(os.listdir('.'))
#os.chdir('test')
#print(os.getcwd('.'))
#os.chdir('../')
#print(os.getcwd())

#dir delete
#os.rmdir('test')
print(os.listdir('.'))

#한번에 여러개 만들때(디렉토리 만들고 또 만들때)
os.makedirs('test2/test3')
os.chdir('test2')
print(os.listdir('.'))
os.chdir('../')
os.removedirs('test2/test3')
print(os.listdir('.'))

import os.path

print(dir(os.path))

os.chdir('D:/pythonwork')
print(os.getcwd())
print(os.listdir('.'))
print(os.path.abspath('17etc.py'))

#디렉토리 경로까지 찍어주는 것
print(os.path.dirname('pythonwork/17etc.py'))

#파일 존재하는지 여부 확인
print(os.path.exists('D:/pythonwork/17etc.py'))
print(os.path.isfile('17etc.py'))
print(os.path.isdir('17etc.py'))
print(os.path.split('d:\\test\\test.txt'))
print(os.path.join('c:\\text','text.txt'))
print(os.path.getsize('17etc.py'))