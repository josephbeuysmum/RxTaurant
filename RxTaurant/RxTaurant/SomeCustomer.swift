//
//  SomeCustomer.swift
//  DertischFive
//
//  Created by Richard Willis on 09/02/2019.
//  Copyright © 2019 Rich Text Format Ltd. All rights reserved.
//

import Dertisch
import UIKit

class SomeCustomerForSommelier: DtCustomerForSommelier {
	required init(_ key: String, _ customer: DtCustomer) {
		lo("YAY")
	}
}

class SomeCustomerForMaitreD: DtCustomerForMaitreD {
	required init(_ key: String, _ customer: DtCustomer) {
		
	}
}

class SomeCustomerForWaiter: DtCustomerForWaiter {
	required init(_ key: String, _ customer: DtCustomer) {
		
	}
}

class SomeCustomerForRestaurantTable: DtCustomerForRestaurantTable {
	required init(_ key: String, _ customer: DtCustomer) {
		
	}
}



//class SomeCustomerForSommelier: CustomerForSommelier {
//	required init() {}
//	
//	
//	
//	required init (_ key: String, _ customer: DtCustomer) {}
//}
//
//class SomeCustomerForMaitreD: CustomerForMaitreD {
//	private let customer: Customerable
//	private let key: String
//	
//	required init (_ key: String, _ customer: Customerable) {
//		self.customer = customer
//		self.key = key
//	}
//	
//	func showToTable() {
//		if let someRestaurantTable = customer.restaurantTable as? SomeRestaurantTable {
//			someRestaurantTable.button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
//		}
//	}
//	
//	public func layTable() {
//		lo()
//	}
//	
//	@IBAction private func buttonPressed(_ sender: UIButton) {
//		lo(key, customer.waiter(key), "COMMED OUT FOR NOW")
////		customer.waiter(key)?.give(CustomerOrder("teststring", 1), key)
//	}
//}
//
//class SomeCustomerForWaiter: CustomerForWaiter {
//	required init (_ key: String, _ customer: Customerable) {}
//
//	func present(dish dishId: String) {
//		lo(dishId)
//	}
//}
//
//class SomeCustomerForRestaurantTable: CustomerForRestaurantTable {
//	required init (_ key: String, _ customer: Customerable) {}
//}
