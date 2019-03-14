//
//  SomeCustomer.swift
//  DertischFive
//
//  Created by Richard Willis on 09/02/2019.
//  Copyright © 2019 Rich Text Format Ltd. All rights reserved.
//

import Dertisch
import UIKit

class SomeRxCustomerForSommelier: RxCustomerForSommelier {
	private let key: String
	private let customer: RxCustomer
	
	required init(_ key: String, _ customer: RxCustomer) {
		lo("YAY")
		self.key = key
		self.customer = customer
	}
}

class SomeRxCustomerForMaitreD: RxCustomerForMaitreD {
	required init(_ key: String, _ customer: RxCustomer) {
	}
}

class SomeRxCustomerForWaiter: RxCustomerForWaiter {
	required init(_ key: String, _ customer: RxCustomer) {
		
	}
}

class SomeRxCustomerForSeat: RxCustomerForSeat {
	required init(_ key: String, _ customer: RxCustomer) {
		
	}
}



class SomeCustomerForSommelier: CustomerForSommelier {
	private let key: String
	private let customer: Customer

	required init(_ key: String, _ customer: Customer) {
		lo("YAY")
		self.key = key
		self.customer = customer
	}
}

class SomeCustomerForMaitreD: CustomerForMaitreD {
	required init(_ key: String, _ customer: Customer) {

	}
}

class SomeCustomerForWaiter: CustomerForWaiter {
	required init(_ key: String, _ customer: Customer) {

	}
}

class SomeCustomerForSeat: CustomerForSeat {
	required init(_ key: String, _ customer: Customer) {

	}
}
