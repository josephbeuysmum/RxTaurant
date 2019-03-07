//
//  RxWaiter.swift
//  RxTaurant
//
//  Created by Richard Willis on 05/03/2019.
//  Copyright © 2019 Rich Text Format Ltd. All rights reserved.
//

import Dertisch
import Foundation

//fileprivate var rota: [String: RxWaiter] = [:]
//
//
//
//public protocol BasicRxWaiter {
//	func customer(_ key: String) -> CustomerForWaiter?
//	func headChef(_ key: String) -> HeadChefForWaiter?
//}
//
//public protocol RxWaiterFacet {
//	init(_ waiter: RxWaiter, _ key: String)
//}
//
//public protocol RxWaiterForCustomer: class, RxWaiterFacet {}
//
//
//
//extension RxWaiterForCustomer {}
//
//
//
//public protocol RxWaiterProtocol {
//	func forRxCustomer(_ key: String) -> RxWaiterForCustomer?
//}
//
//internal protocol RxWaiterInternal: WorkShiftable, StaffMember {
//	init(
//		_ key: String,
//		_ forRxCustomer: BasicWaiterForCustomer.Type,
//		_ forHeadChef: WaiterForHeadChef.Type?)
//	func inject(_ customer: CustomerForWaiter?, _ headChef: HeadChefForWaiter?)
//}
//
//public class RxWaiter {
//	private let
//	private_key: String
//	
//	fileprivate var
//	_forRxCustomer: RxWaiterForCustomer?,
//	_forHeadChef: WaiterForHeadChef?,
//	_forWaiter: WaiterForWaiter?,
//	_customer: CustomerForWaiter?,
//	_headChef: HeadChefForWaiter?
//	
//	internal required init(
//		_ key: String,
//		_ forRxCustomer: BasicWaiterForCustomer.Type,
//		_ forHeadChef: WaiterForHeadChef.Type?) {
//		private_key = key
//		_forRxCustomer = forRxCustomer.init(self, key) as? RxWaiterForCustomer
//		_forHeadChef = forHeadChef != nil ? forHeadChef!.init(self, key) : nil
//		_forWaiter = GeneralWaiterForWaiter(self, key)
//		rota[private_key] = self
//		lo("BONJOUR  ", self)
//	}
//	
//	deinit { lo("AU REVOIR", self) }
//}
//
//extension RxWaiter: BasicWaiter {
//	public func customer(_ key: String) -> CustomerForWaiter? {
//		return nil
//	}
//	
//	public func headChef(_ key: String) -> HeadChefForWaiter? {
//		return nil
//	}
//}
//
//extension RxWaiter: RxWaiterProtocol {
//	public func forRxCustomer(_ key: String) -> RxWaiterForCustomer? {
//		return key == private_key ? _forRxCustomer : nil
//	}
//}
//
//extension RxWaiter: RxWaiterInternal {
//	internal func beginShift() {}
//	internal func endShift() {}
//	
//	func inject(_ customer: CustomerForWaiter?, _ headChef: HeadChefForWaiter?) {
//		self._customer = customer
//		self._headChef = headChef
//	}
//}
