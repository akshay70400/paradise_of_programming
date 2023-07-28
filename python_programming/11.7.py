
class computer(): #Defining a class
    def __init__(self):
        #To initialise the variable
        print("in it")

    def config(self): #Creating a method(function)
        print("4GB RAM, 5TB memory")
        
comp1=computer()
comp2 =computer()

# computer.config(comp1)
# computer.config(comp2)

comp1.config()
comp2.config()