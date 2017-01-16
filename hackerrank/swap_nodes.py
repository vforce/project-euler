# Enter your code here. Read input from STDIN. Print output to STDOUT
from sys import stdin
from collections import defaultdict
class Node: 
    def __init__(self, data, left=None, right=None, level=1):
        self.data = data
        self.left = left
        self.right = right
        self.level = level
n = int(stdin.readline())
nodes = [Node(i+1) for i in xrange(n)]
for i in xrange(n):
    (l, r) = stdin.readline().split()
    l = int(l)
    r = int(r)
    if l!=-1:
        nodes[i].left = nodes[l-1]
        nodes[l-1].level = nodes[i].level+1
    if r!=-1:
        nodes[i].right = nodes[r-1]
        nodes[r-1].level = nodes[i].level+1
root = nodes[0]
t = int(stdin.readline())
levels = defaultdict(list)
for i in xrange(n):
    levels[nodes[i].level].append(nodes[i])
def inorder(node):
    if node is None:
        return
    inorder(node.left)
    print node.data,
    inorder(node.right)
num_level = len(levels.keys())
for i in xrange(t):
    k = int(stdin.readline())
    m = k
    while k<=num_level:
        for node in levels[k]:
            tmp = node.left
            node.left = node.right
            node.right = tmp
        k += m
    inorder(root)
    print 
