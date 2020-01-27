//
//  ViewController.swift
//  MVC Coding Demo
//
//  Created by bharvee_parmar on 27/01/20.
//  Copyright © 2020 bharvee_parmar. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet var transactionTableView: UITableView!
    let transactionService = TransactionService()
    let transactionDataManager = DataManager()
    var transactionHistorYArray = Array<TransactionHistory>()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTransactionHistoryList()

    }
    func fetchTransactionHistoryList(){
        let paramDict =  self.transactionDataManager.prepareDataForTransacationHistoryRequest()

        if paramDict.count > 0 {
            transactionService.getTransactionHistoryList(paramDict: paramDict, completionHandler: {
                (transactionHistoryResponse) in

                if transactionHistoryResponse != nil{
                    self.transactionHistoryReceivedSucceed(transactionData: transactionHistoryResponse!)
                }
            }) {
                (errorObject) in
                print("error")
            }
        }

    }
    func transactionHistoryReceivedSucceed(transactionData : TransactionData) {
        if transactionData.transactionHistoryList?.count ?? 0  > 0 {
            self.transactionHistorYArray =  transactionData.transactionHistoryList!
            self.transactionTableView.reloadData()
        }
    }
    
}
extension ViewController : UITableViewDelegate ,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionHistorYArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCellID", for: indexPath)as! TransactionViewCell
        let transactionHistory = transactionHistorYArray[indexPath.row]
        cell.prepareData(modal : transactionHistory)
        return cell
    }
}
