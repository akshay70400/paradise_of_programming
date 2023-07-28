#instance method
#class method
#static method

project="Students and school" #Global variable
class student:
    school="Bajaj" #Class variable
    
    #Instance variable/method
    def __init__(self,m1,m2,m3):
        self.m1=m1
        self.m2=m2
        self.m3=m3
    def avg(self):
        return ((self.m1+self.m2+self.m3)/3)
    
    @classmethod #Decorator
    def getschool(cls):
        return cls.school
    
    @staticmethod #decorator
    def info():
        print("This is student class...in abc module")

s1=student(10,20,30)
s2=student(40,50,60)

print(s1.avg())
print(student.getschool())

student.info()