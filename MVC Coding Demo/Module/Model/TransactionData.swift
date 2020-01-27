//
//  TransactionData.swift
//  MVC Coding Demo
//
//  Created by bharvee_parmar on 27/01/20.
//  Copyright © 2020 bharvee_parmar. All rights reserved.
//

import Foundation

class TransactionData {
    var transactionHistoryList : Array<TransactionHistory>?

}

struct TransactionHistory{
    var date : String?
    var type : String?
    var subType : String?
    var amount : Double?
    var transactionData : Dictionary<String,Any>?
    var earnBalance : Double?
    var referralBalance : Double?
}
