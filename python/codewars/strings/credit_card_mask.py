# "4556364607935616" --> "############5616"
#      "64607935616" -->      "#######5616"
#                "1" -->                "1"
#                 "" -->                 ""
#
# // "What was the name of your first pet?"
# "Skippy" --> "##ippy"
# "Nananananananananananananananana Batman!" --> "####################################man!
# Your task is to write a function maskify, which changes all but the last four characters into '#'.


# return masked string
def maskify(cc):
    # if len(cc) <= 4:
    #     return cc
    # In Python, multiplying a string by a negative number or zero results in an empty string.
    return '#'  * (len(cc)-4) + cc[-4:]


# print(maskify("123456789"))
print(maskify("12"))