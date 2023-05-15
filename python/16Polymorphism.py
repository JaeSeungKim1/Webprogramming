class Char:
    def __init__(self,name):
        self.name=name
    def do(self):
        print("do")
class Fighter(Char):
    def do(self):
        print("fight")
class Healer(Char):
    def do(self):
        print("healing")        
class Wizard(Char):
    def do(self):
        print("magic")
        
fighter1 = Fighter('dodo')
healer1 = Healer('Andrew')
wizard1 = Wizard('Emma')

for x in ( fighter1,healer1,wizard1):
    print(x.name,end=' ')
    x.do()