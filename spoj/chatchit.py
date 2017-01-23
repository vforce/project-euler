from sys import stdin
import re
words = {
    'k': 'khong',
    'ko': 'khong',
    'ng': 'nguoi',
    'n': 'nhieu',
    'dc': 'duoc',
    'hok': 'khong',
    'ntn': 'nhu the nao',
    'kq': 'ket qua'
}

strings = {
    'j': 'gi',
    'w': 'qu',
    'f': 'ph',
    'dz': 'd',
    'z': 'd'
}
for line in stdin:
    for key, value in words.iteritems():
        line = re.sub((r"\b"+key+r"\b"), value, line)
    for key, value in strings.iteritems():
        line = re.sub(key, value, line)
print line
