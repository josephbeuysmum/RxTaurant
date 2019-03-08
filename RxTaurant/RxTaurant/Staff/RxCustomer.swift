//
//  RxCustomer.swift
//  RxTaurant
//
//  Created by Richard Willis on 08/03/2019.
//  Copyright © 2019 Rich Text Format Ltd. All rights reserved.
//

import Dertisch

fileprivate var rota: [String: RxCustomer] = [:]



public protocol RxCustomerFacet {
	init(_ key: String, _ waiter: RxCustomer)
}



public protocol RxCustomerForSeat: BasicCustomerForSeat, RxCustomerFacet {}

extension RxCustomerForSeat {}



public protocol RxCustomerForWaiter: BasicCustomerForWaiter, RxCustomerFacet {}

extension RxCustomerForWaiter {}



public protocol RxCustomerForMaitreD: BasicCustomerForMaitreD, RxCustomerFacet {}

extension RxCustomerForMaitreD {}



public protocol RxCustomerForSommelier: BasicCustomerForSommelier, RxCustomerFacet {}

extension RxCustomerForSommelier {}



internal protocol RxCustomerInternal {
	init(
		_ key: String,
		_ restaurantTable: Seat,
		_ forSeatType: RxCustomerForSeat.Type,
		_ forMaitreDType: RxCustomerForMaitreD.Type,
		_ forSommelierType: RxCustomerForSommelier.Type,
		_ forWaiterType: RxCustomerForWaiter.Type?)
	func inject(_ waiter: RxWaiterForCustomer?)
	func forMaitreD(_ key: String) -> RxCustomerForMaitreD?
	func forSommelier(_ key: String) -> RxCustomerForSommelier?
	func forSeat(_ key: String) -> RxCustomerForSeat?
}



public class RxCustomer {
	private let private_key: String
	private let restaurant_table: Seat
	
	fileprivate var for_restaurant_table: RxCustomerForSeat?
	fileprivate var for_maitre_d: RxCustomerForMaitreD?
	fileprivate var for_sommelier: RxCustomerForSommelier?
	fileprivate var for_waiter: RxCustomerForWaiter?
	fileprivate var waiter_: RxWaiterForCustomer?
	
	internal required init(
		_ key: String,
		_ restaurantTable: Seat,
		_ forSeatType: RxCustomerForSeat.Type,
		_ forMaitreDType: RxCustomerForMaitreD.Type,
		_ forSommelierType: RxCustomerForSommelier.Type,
		_ forWaiterType: RxCustomerForWaiter.Type?) {
		private_key = key
		restaurant_table = restaurantTable
		for_restaurant_table = forSeatType.init(key, self)
		for_maitre_d = forMaitreDType.init(key, self)
		for_sommelier = forSommelierType.init(key, self)
		for_waiter = forWaiterType?.init(key, self)
		rota[private_key] = self
		lo("BONJOUR  ", self)
	}
	
	deinit { lo("AU REVOIR", self) }
}

extension RxCustomer {
	public final var seat: Seat { return restaurant_table }
	
	public final func forWaiter(_ key: String) -> RxCustomerForWaiter? {
		return key == private_key ? for_waiter : nil
	}
}

extension RxCustomer: WorkShiftable {
	public func beginShift() { lo() }
	public func endShift() { lo() }
}

extension RxCustomer: CigaretteBreakable {
	public func beginBreak() { lo() }
	public func endBreak() { lo() }
}

extension RxCustomer: Customerable {
	final public func waiter(_ key: String) -> BasicWaiterForCustomer? {
		return key == private_key ? waiter_ : nil
	}
}

extension RxCustomer: RxCustomerInternal {
	final func inject(_ waiter: RxWaiterForCustomer?) {
		waiter_ = waiter
	}
	
	final func forMaitreD(_ key: String) -> RxCustomerForMaitreD? {
		return key == private_key ? for_maitre_d : nil
	}
	
	final func forSommelier(_ key: String) -> RxCustomerForSommelier? {
		return key == private_key ? for_sommelier : nil
	}
	
	final func forSeat(_ key: String) -> RxCustomerForSeat? {
		return key == private_key ? for_restaurant_table : nil
	}
}
