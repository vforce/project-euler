from sys import stdin
class Node:
    def __init__(self, branch):
        self.left = None
        self.right = None
        self.parent = self
        self.branch = branch
root = Node()
node = root
for line in stdin:
    if line == 'IF':
        node.left = Node(line) 
    elif line == 'ELIF':
        if node.branch == 'IF':

