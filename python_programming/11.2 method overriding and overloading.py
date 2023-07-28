"""
Types of polymorphism:
    -Method overloading : Not directly present in python (so we cannot creat two methods with a same name in a class)
    -Method overriding
"""

class student:
    
    def __init__(self,m1,m2):
        self.m1=m1
        self.m2=m2
    def sum(self,a=None,b=None,c=None):
        s=0
        if a!=None and b!=None and c!=None:
            s=a+b+c
        elif a!=None and b!=None:
            s=a+b
        else:
            s=a
        
        return s
    

s1=student(50,60)
print(s1.sum(5,10,15))

"""
Method overriding-
Method overriding is an ability of any object-oriented programming language 
that allows a subclass or child class to provide a specific implementation of a method 
that is already provided by one of its super-classes or parent classes. 
When a method in a subclass has the same name, same parameters and same return type(or sub-type) as a method in its super-class, 
then the method in the subclass is said to override the method in the super-class.
"""
class A:
    def show(self):
        print("in A show")
class B(A):
    def show(self):
        print("in B show")
a1=B()
a1.show()
