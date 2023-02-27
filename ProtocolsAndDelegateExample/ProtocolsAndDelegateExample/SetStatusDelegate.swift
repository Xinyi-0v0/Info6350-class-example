//
//  SetStatusDelegate.swift
//  ProtocolsAndDelegateExample
//
//  Created by Xinyi Zhang on 2/18/23.
//

import Foundation

// this is a protoco: create functions with no body; this class defines a set of methods that the delegate object can implement
protocol SetStatusDelegate{
    func setStatus(status: String)
}
