"""
POLYMORPHISM -many forms of an object
Use in - Loose coupling, Dependency injection, Interface

Ways of implementing polymorphism -
Duck typing, Operator overloading, Method overloading, Method overriding
"""

"""
DUCK TYPING-
Duck typing is a concept related to dynamic typing, where the type or the class of an object 
is less important than the methods it defines. 
When you use duck typing, you do not check types at all. 
Instead, you check for the presence of a given method or attribute.
For example, you can call len() on any Python object that defines a .__len__() method:
Duck-typing emphasis what the object can really do, rather than what the object is.
"""
class PyCharm:
    def ducking(self):
        print("Compiling")
        print("Running")

class MyEditor:
    def ducking(self):
        print("Spell check")
        print("Convention Check")

class Laptop:
    def code(self,ide):
        ide.ducking()
        
ide=MyEditor()
lap1=Laptop()
lap1.code(ide)
    
"""
OPERATOR OVERLOADING-defining a method for existing operator for operations on objects.
Operator Overloading means giving extended meaning beyond their predefined operational meaning. 
For example operator + is used to add two integers as well as join two strings and merge two lists. 
It is achievable because ‘+’ operator is overloaded by int class and str class. 
You might have noticed that the same built-in operator or function 
shows different behavior for objects of different classes, this is called Operator Overloading.

How to overload the operators in Python? 
Consider that we have two objects which are a physical representation of a class (user-defined data type) 
and we have to add two objects with binary ‘+’ operator it throws an error, 
because compiler don’t know how to add two objects. 
So we define a method for an operator and that process is called operator overloading. 
We can overload all existing operators but we can’t create a new operator. 
To perform operator overloading, Python provides some special function or magic function 
that is automatically invoked when it is associated with that particular operator. 
For example, when we use + operator, the magic method __add__ is automatically invoked 
in which the operation for + operator is defined
"""
a=5
b=6
print("-------\n",a+b)
print(int.__add__(a,b))

class student:
    
    def __init__(self,m1,m2):
        self.m1=m1
        self.m2=m2
    def __add__(self,other):
        m1=self.m1+other.m1
        m2=self.m2+other.m2
        s3=student(m1,m2)
        return s3
    def __gt__(self, other):
        r1=self.m1+self.m2
        r2=other.m1+other.m2
        if r1>r2:
            True
        else:
            False
    def __str__(self):
        return '{} {}'.format(self.m1, self.m2)
    
s1=student(50,60)
s2=student(60,65)

#s3=s1+s2 ---> This gives an error if def _add_ is absent
s3=s1+s2
print(s3.m1,s3.m2)

if s1>s2:
    print("s1 wins")
else:
    print("s2 wins") 


a=9
print(a.__str__())
#print(s1.__str__()) or
print(s1)
print(s2)