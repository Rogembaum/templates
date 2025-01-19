# The rules for a valid password are as follows:
#
# There needs to be at least 1 uppercase letter.
# There needs to be at least 1 lowercase letter.
# There needs to be at least 1 number.
# The password needs to be at least 8 characters long.
# -----------------------------------------------------
# password("Abcd1234"); ===> true
# password("Abcd123"); ===> false
# password("abcd1234"); ===> false
# password("AbcdefGhijKlmnopQRsTuvwxyZ1234567890"); ===> true
# password("ABCD1234"); ===> false
# password("Ab1!@#$%^&*()-_+={}[]|\:;?/>.<,"); ===> true;
# password("!@#$%^&*()-_+={}[]|\:;?/>.<,"); ===> false;

import re

def password(st):
    if re.search(r'\d',st) and re.search(r'[a-z]',st)  and re.search(r'[A-Z]',st)  and re.search(r'[^a-zA-Z0-9]',st) and len(st) >= 8:
        return True
    else:
        return False

# ----------------------------------------------
CRITERIA = (str.islower, str.isupper, str.isdigit)

def password_refactoring(s):
    return len(s)>7 and all( any(map(f,s)) for f in CRITERIA)