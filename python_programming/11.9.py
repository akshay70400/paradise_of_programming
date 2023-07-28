
class computer(): #Defining a class
    def __init__(self,cpu,ram):
        self.cpu=cpu
        self.ram=ram
    def config(self): #Creating a method(function)
        print("Config is: ",self.cpu,self.ram)
        
comp1=computer("i5",16)
comp2 =computer("Ryzen",40)

# computer.config(comp1)
# computer.config(comp2)

comp1.config()
comp2.config()



















