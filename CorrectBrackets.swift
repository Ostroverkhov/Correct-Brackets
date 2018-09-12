import Foundation 

func correctBrackets(_ string: String) -> Bool {
    var stack = [Character]()

    for s in string {
        switch s {
            case let left where leftBracket(left):
                stack.append(s)

            case let right where rightBracket(right):
                guard let left = stack.last, fit(left, right)  else {
                    return false
                }
                stack.removeLast()
            default:
                break
        }
    }
    return stack.isEmpty
}

func leftBracket(_ c: Character) -> Bool {
    let brakets = "({[" 
    return brakets.contains(c)
}

func rightBracket(_ c: Character) -> Bool {
    let brakets = ")}]" 
    return brakets.contains(c)
}

func fit(_ left: Character, _ right: Character) -> Bool {
    return (left == "(" && right == ")") ||
           (left == "{" && right == "}") ||
           (left == "[" && right == "]")
}

var s = "[()io{uiiii}hgj[](kjghk)]"
print(correctBrackets(s))