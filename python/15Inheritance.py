class Person:
    def __init__(self,fname,lname):
        self.firstname=fname
        self.lastname=lname
    def printname(self):
        print(self.firstname,self.lastname)
        
#x=Person('hojin','park')
#x.printname()
class Member(Person):
    def __init__(self, fname, lname,grade):
        super().__init__(fname,lname)
        self.grade=grade
    
    def welcome(self):
        print("Welcome",self.firstname,self.lastname,self.grade)
        
    def printname(self):
        print(self.firstname,self.lastname,self.grade)

  

x=Member('Mutal','Jenny','VIP')
x.printname()
        