

class student:
    def __init__(self,name,roll):
        self.name=name
        self.roll=roll
        self.lap=self.laptop()
        
    def show(self):
        print(self.name,self.roll)
        
    class laptop:
        def __init__(self):
            self.brand="HP"
            self.cpu="i5"
            self.ram=8
        def show(self):
            print(self.brand,self.cpu,self.ram)
s1=student('Navin',20)
s2=student("Jenny",33)

s1.show()
# #s1.lap.brand()
# lap1=s1.lap
# lap2=s2.lap
s1.lap.show()











