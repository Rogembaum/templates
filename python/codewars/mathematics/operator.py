def basic_op(operator, value1, value2):
   match operator:
        case '+':
            return value1 + value2
        case '-':
            return value1 - value2
        case '*':
            return value1 * value2
        case '/':
            if value2 == 0:
                return "Error: division by zero"
            else:
                return value1 / value2
        case _:
            return "Invalid operator: please change to +,-,*,/"


# refactoring
def basic_op(operator, value1, value2):
    return eval(f'{value1}{operator}{value2}')
# Security: The eval() function can be dangerous
# if you pass unsanitized input, as it can execute arbitrary code.
# For example, eval('os.system("rm -rf /")') would execute a command that
# Performance: Using eval() is generally less efficient than
# using simple conditionals or operator mappings (like in the if-else or match-case structures).


def basic_op(o, a, b):
    return {'+':a+b,'-':a-b,'*':a*b,'/':a/b}.get(o)
# Important: If the operator o does not exist in the dictionary
# (e.g., if o is an invalid operator like '^'), .get() will return None by default.
# This is different from using [], which would raise a KeyError if the key is not found.

def basic_op(operator, value1, value2):
    return eval("{}{}{}".format(value1, operator, value2))

def basic_op(operator, value1, value2):
    return eval(str(value1) + operator + str(value2))

def basic_op(operator, value1, value2):
    return eval(f'{value1}{operator}{value2}')