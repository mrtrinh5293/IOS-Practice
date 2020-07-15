protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    
    func assessSituation() {
        print("Can you tell me about hat happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("chest compresion")
    }
}

class Doctor: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("doctor doing cpr")
    }
    
    func anotherFunc() {
        print("another one")
    }
    
}

class Surgeon: Doctor {
    override func performCPR() {
        print("override cpr")
    }
}

let duc = EmergencyCallHandler()
let dang = Surgeon(handler: duc)

duc.assessSituation()
duc.medicalEmergency()

//dang.performCPR()
