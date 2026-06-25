func isValid(_ s: String) -> Bool {
    
    var stack : [Character] = []
    for ch in s {
        switch ch {
        case "(" :
            stack.append(ch)
        case ")" :
            if stack.isEmpty {
                return false
            }
            if stack.popLast() != "(" {
                return false
            }
        case "{" :
            stack.append(ch)
        case "}" :
            if stack.isEmpty {
                return false
            }
            if stack.popLast() != "{" {
                return false
            }
        case "[" :
            stack.append(ch)
        case "]" :
            if stack.isEmpty {
                return false
            }
            if stack.popLast() != "[" {
                return false
            }
        default :
            continue
            
        }
    }
    
    
        return stack.isEmpty
}

//Test
print(isValid("([)]"))
