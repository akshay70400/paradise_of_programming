"""
Behaviour of constructor in a class
Use of super() -To access parent class methods
Mehtod resolution order
"""

class A:
    def __init__(self): #COnstructor of calss A
        print("in A init")
    def feature1(self):
        print("Feature 1-A working")
    def feature2(self):
        print("Feature 2-A working")

class B(A): 
    def __init__(self): #COnstructor of calss B
        super().__init__() #If you want to call init of superclass as well
        print("in B init")
    def feature3(self):
        print("Feature 3 working")
    
class C: 
    def __init__(self):
        print("in C init")
    def feature1(self):
        print("Feature 1-C working")

        
class D(A,C): 
    def __init__(self):
        super().__init__() #Here it takes A as super not B. Goes from left to right(A,B)
        print("in D init")
    def feature7(self):
        print("Feature 7 working")
    def feat(self):
        super().feature2()
        #Super() can be used to call any methos from parent calss

#Due to inheritance; object of B, is also calling the constructor of A
b=B()
print("----")
d=D()
print("----")
d.feature1() 
'''Here also since the names of feature1 same in both class A and C, 
but prefernce given to A while inheriting, as it goes from left ot right (A,C)
this is what METHOD RESOLUTION ORDER
'''
print("----")
d.feat()