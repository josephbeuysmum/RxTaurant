//
//  RxWaiter.swift
//  RxTaurant
//
//  Created by Richard Willis on 05/03/2019.
//  Copyright © 2019 Rich Text Format Ltd. All rights reserved.
//

import Dertisch

fileprivate var rota: [String: RxWaiter] = [:]



public protocol RxWaiterFacet {
	init(_ key: String, _ waiter: RxWaiter)
}



public protocol RxWaiterForCustomer: BasicWaiterForCustomer, RxWaiterFacet {}

public extension RxWaiterForCustomer {}



public protocol RxWaiterForHeadChef: BasicWaiterForHeadChef, RxWaiterFacet {}

public extension RxWaiterForHeadChef {}



public protocol RxWaiterForWaiter: BasicWaiterForWaiter, RxWaiterFacet {}

public extension RxWaiterForWaiter {}



internal protocol RxWaiterInternal: Waiterable {
	init(
		_ key: String,
		_ forCustomer: BasicWaiterForCustomer.Type,
		_ forHeadChef: BasicWaiterForHeadChef.Type?)
	func inject(_ customer: BasicCustomerForWaiter?, _ headChef: BasicHeadChefForWaiter?)
	func forCustomer(_ key: String) -> RxWaiterForCustomer?
	func forRxHeadChef(_ key: String) -> RxWaiterForHeadChef?
}



public class RxWaiter {
	private let private_key: String
	
	// tood change to lets?
	fileprivate var for_customer: RxWaiterForCustomer?
	fileprivate var for_head_chef: RxWaiterForHeadChef?
	fileprivate var for_waiter: GeneralWaiterForWaiter?
	fileprivate var customer_: RxCustomerForWaiter?
	fileprivate var head_chef: HeadChefForWaiter?
	
	internal required init(
		_ key: String,
		_ forCustomer: BasicWaiterForCustomer.Type,
		_ forHeadChef: BasicWaiterForHeadChef.Type?){
		private_key = key
		if let forCustomerType = forCustomer as? RxWaiterForCustomer.Type {
			for_customer = forCustomerType.init(key, self)
		}
		if let forHeadChefType = forHeadChef as? RxWaiterForHeadChef.Type {
			for_head_chef = forHeadChefType.init(key, self)
		}
		for_waiter = GeneralWaiterForWaiter(key, self)
		rota[private_key] = self
		lo("BONJOUR  ", self)
	}
	
	deinit { lo("AU REVOIR", self) }
}

extension RxWaiter: WorkShiftable {
	public func beginShift() { lo() }
	public func endShift() { lo() }
}

extension RxWaiter: CigaretteBreakable {
	public func beginBreak() { lo() }
	public func endBreak() { lo() }
}

extension RxWaiter: Waiterable {
	public final func headChef(_ key: String) -> HeadChefForWaiter? {
		return key == private_key ? head_chef : nil
	}
}

extension RxWaiter: RxWaiterInternal {
	func inject(_ customer: BasicCustomerForWaiter?, _ headChef: BasicHeadChefForWaiter?) {
		customer_ = customer as? RxCustomerForWaiter
		head_chef = headChef as? HeadChefForWaiter
	}
	
	func forCustomer(_ key: String) -> RxWaiterForCustomer? {
		return key == private_key ? for_customer : nil
	}
	
	func forRxHeadChef(_ key: String) -> RxWaiterForHeadChef? {
		return key == private_key ? for_head_chef : nil
	}
}
