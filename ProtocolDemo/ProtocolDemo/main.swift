
protocol canFly {
    func fly()
}

class Bird {
    
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("making new birs")
        }
    }
}

class Eagle: Bird, canFly {
    
    func fly() {
        print("eagle can flight")
    }
    
    func soar() {
        print(" eagle soaring")
    }
    
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: canFly) {
        flyingObject.fly()
    }
}
struct Airplane: canFly {
    func fly() {
        print("airplane flyy")
    }
}

class Penguin: Bird {
    func swim() {
        print("penguin swimmy")
    }
}

let eagle = Eagle()
let museum = FlyingMuseum()
let myPlane = Airplane()

eagle.fly()
myPlane.fly()

museum.flyingDemo(flyingObject: myPlane)
