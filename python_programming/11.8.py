class computer:
    def __init__(self):
        self.name="Navin"
        self.age=50
    def update(self):
        self.age=3000
    def compare(self,other):
        if self.age==other.age:
            return True
        else:
            return False
    
c1=computer() 
c2=computer()

#Objects are stored in Heap Memory
#Size of the object depends on number of variables and size of the variables
#COnstructor [computer()]allocatessize to the object
# print(id(c1))
# print(id(c2))

if c1.compare(c2):
    print("They are of same AGE")
else:
    print("They are of different AGE")

print(c1.name,c1.age)
print(c2.name,c2.age)

c1.name="Rashichakra"
c1.age=4444
print(c1.name,c1.age)
print(c2.name,c2.age)

c1.update()
print(c1.name,c1.age)

if c1.compare(c2):
    print("They are same")
else:
    print("They are different")