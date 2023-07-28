"""
INHERITANCE: Using the features of existing class
-Single level
-Multi level
-Multiple

Sub-class can access all objects of superclass but reverse is not true
"""

class A:
    def feature1(self):
        print("Feature 1 working")
    
    def feature2(self):
        print("Feature 2 working")

#B is child class of parent class A 
#B is inheriting from A
class B(A): 
    def feature3(self):
        print("Feature 3 working")
    
    def feature4(self):
        print("Feature 4 working")

#Multi level inheritance
#C inheriting from B and B inturn from A
class C(B):
    def feature5(self):
        print("Feature 5 is working")

#Multiple Inheritance
 class D(A,B):
    def feature6(self):
        print("Feature 6 is working")   

a1=A()

a1.feature1()
a1.feature2()

b1=B()

c1=C()
c1.