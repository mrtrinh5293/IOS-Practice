class Dragon: Enemy {
    var wingSpan = 2
    
    func talk(speech:String) {
        print("Says: \(speech)")
    }
    
    override func attack() {
        super.attack()
        
    }
}
