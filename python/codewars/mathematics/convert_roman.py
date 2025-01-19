# +--------+-------+
# | Symbol | Value |
# +--------+-------+
# |    M   |  1000 |
# |   CM   |   900 |
# |    D   |   500 |
# |   CD   |   400 |
# |    C   |   100 |
# |   XC   |    90 |
# |    L   |    50 |
# |   XL   |    40 |
# |    X   |    10 |
# |   IX   |     9 |
# |    V   |     5 |
# |   IV   |     4 |
# |    I   |     1 |
# +--------+-------+


class Numerals:
    @staticmethod
    def to_roman(number: int)-> str:
        roman_numbers = {
            1: 'I', 4: 'IV', 5: 'V', 9: 'IX', 10: 'X', 40: 'XL', 50: 'L',
            90: 'XC', 100: 'C', 400: 'CD', 500: 'D', 900: 'CM', 1000: 'M'
        }
        result =''
        for key in sorted(roman_numbers.keys(), reverse=True):
            while number >= key:
                result += roman_numbers[key]
                number -= key
        return result

    @staticmethod
    def from_roman(number: str) -> int:
        roman_numbers = {
            'I': 1, 'IV': 4, 'V': 5, 'IX': 9, 'X': 10, 'XL': 40, 'L': 50,
            'XC': 90, 'C': 100, 'CD': 400, 'D': 500, 'CM': 900, 'M': 1000
        }
        i = 0
        result = 0
        while i < len(number):
            if (i+1) < len(number) and number[i:i+2] in roman_numbers:
                result += roman_numbers[number[i:i+2]]
                i += 2
            else:
                result += roman_numbers[number[i]]
                i += 1


        return result

print(Numerals.to_roman(1401))
print(Numerals.from_roman('MCDI'))
