//
//  SomeHeadChef.swift
//  DertischFive
//
//  Created by Richard Willis on 09/02/2019.
//  Copyright © 2019 Rich Text Format Ltd. All rights reserved.
//

import Dertisch

class SomeHeadChefForSousChef: HeadChefForSousChef {
	required init(_ headChef: HeadChef, _ key: String) {}
	
	func give(_ prep: InternalOrder) {
		lo(prep)
	}
}

class SomeHeadChefForWaiter: HeadChefForWaiter {
	private let headChef: HeadChef
	private let key: String
	
	required init(_ headChef: HeadChef, _ key: String) {
		self.headChef = headChef
		self.key = key
	}
	
	func give(_ order: CustomerOrder, _ key: String) {
		lo(order, "COMMED OUT FOR NOW")
//		headChef.waiter(key)?.serve(main: FulfilledOrder("allDone"), key)
	}
}
