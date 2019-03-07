//
//  Protocols.swift
//  RxTaurant
//
//  Created by Richard Willis on 05/03/2019.
//  Copyright © 2019 Rich Text Format Ltd. All rights reserved.
//

import Dertisch

// todo this is duplicated from Dertisch, is that OK?
internal protocol WorkShiftable: StaffRelatable {
//	var internalKey: String { get }
	func beginShift()
	func endShift()
}
