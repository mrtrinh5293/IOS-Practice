import UIKit

class House {
    var windows:Int = 0
    init(windows:Int){
        self.windows = windows
    }
}

class Villa: House{
    var hasGarage: Bool = false
    init(windows:Int, hasGarage:Bool)
    {
        self.hasGarage = hasGarage

        super.init(windows: windows)
    }
}

class Castle: House
{
    var towers:Int = 0

    init(windows:Int, towers:Int)
    {
        self.towers = towers

        super.init(windows: windows)
    }
}

let house:House = Castle(windows: 200, towers: 4) as Castle
//let house2:Castle = House(windows: 20) as! Castle
let castle:Castle = house as! Castle


print(house, "type of")
print(castle.towers)
//print(house2)
