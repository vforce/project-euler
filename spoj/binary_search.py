import unittest

def binary_sort(array):
    if array is None or array == [] or len(array) == 1:
        return array
    index = len(array)/2
    l = len(array)
    left = [array[i] for i in xrange(l) if array[i]<array[index] and i!=index]
    right = [array[i] for i in xrange(l) if array[i]>=array[index] and i!=index]
    return binary_sort(left) + [array[index]] + binary_sort(right)

class TestBinarySort(unittest.TestCase):
    def test_null_case(self):
        self.assertEqual(binary_sort(None), None)
    def test_empty_case(self):
        self.assertEqual(binary_sort([]), [])
    def test_normal_case(self):
        self.assertEqual(binary_sort([3,2,5]), [2,3,5])
        self.assertEqual(binary_sort([3,2,5,6,1]), [1,2,3,5,6])
