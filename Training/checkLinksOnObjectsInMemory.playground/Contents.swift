import Foundation

//  1st check (check to destroy object of class):
final class Parent {
    var oneObjectOfChild = Child()
    
    deinit {
        print("\(#function) - Parent is deinitialized")
    }
}

final class Child {
    deinit {
        print("\(#function) - Child is deinitialized")
    }
}

var oneObjectOfParent: Parent? = Parent()
//  Stop debugging here
oneObjectOfParent = nil



//  2nd check (loop links):
class Guy {
    var girl: Girl?
    deinit {
        print("\(self) was uninstalled")
    }
}

class Girl {
    // We need add Weak or unowned to don't lose datas
    var guy: Guy?
    deinit {
        print("\(self) was uninstalled")
    }
}

var newGuy: Guy?
newGuy = Guy()
var newGirl: Girl?
newGirl = Girl()

newGuy?.girl = newGirl
newGirl?.guy = newGuy

newGuy = nil
newGirl = nil

