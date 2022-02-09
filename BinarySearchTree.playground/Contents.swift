import Foundation

public class BinarySearchTree<T: Comparable> {
	private(set) public var value: T
	private(set) public var parent: BinarySearchTree?
	private(set) public var left: BinarySearchTree?
	private(set) public var right: BinarySearchTree?
	
	public init(value: T) {
		self.value = value
	}
	
	public func insert(value: T) {
		if value < self.value {
			if let left = left {
				left.insert(value: value)
			} else {
				left = BinarySearchTree(value: value)
				left?.parent = self
			}
		} else {
			if let right = right {
				right.insert(value: value)
			} else {
				right = BinarySearchTree(value: value)
				right?.parent = self
			}
		}
	}
	
	public func search(value: T) -> BinarySearchTree? {
		if value < self.value {
			return left?.search(value: value)
		} else if value > self.value {
			return right?.search(value: value)
		} else {
			return self
		}
	}
}

let tree = BinarySearchTree(value: 8)
tree.insert(value: 6)
tree.insert(value: 4)
