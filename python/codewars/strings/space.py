# 1. Remove Leading and Trailing Spaces (strip()):
s = "  Hello World!  "
result = s.strip()  # Removes spaces from the start and end
print(result)  # Output: "Hello World!"

# 2. Remove All Spaces (internal and external) (replace()):
s = " H e l l o  W o r l d ! "
result = s.replace(" ", "")  # Replaces all spaces with an empty string
print(result)  # Output: "HelloWorld!"

# 3. Remove Only Leading Spaces (lstrip()):
s = "  Hello World! "
result = s.lstrip()  # Removes spaces from the left side
print(result)  # Output: "Hello World! "

# 4. Remove Only Trailing Spaces (rstrip()):
s = " Hello World!  "
result = s.rstrip()  # Removes spaces from the right side
print(result)  # Output: " Hello World!"

# 5. Remove Extra Spaces Between Words (Normalize Whitespace):
s = "Hello   World    from   Python"
result = " ".join(s.split())  # Splits on whitespace and joins back with a single space
print(result)  # Output: "Hello World from Python"

# 6. Remove Spaces with Regular Expressions (for more control):
import re
s = " H e l l o   W o r l d "
result = re.sub(r"\s+", "", s)  # Remove all types of whitespace
print(result)  # Output: "HelloWorld"

# Summary:
# strip(): Removes leading and trailing spaces.
# replace(" ", ""): Removes all spaces in the string.
# lstrip(): Removes leading spaces.
# rstrip(): Removes trailing spaces.
# split() + " ".join(): Removes extra internal spaces, leaving one space between words.
# re.sub(): More advanced control over whitespace removal using regular expressions.