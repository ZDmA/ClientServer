//
//  ViewController.swift
//  VK
//
//  Created by Дмитрий Заика on 23.02.2022.
//

import UIKit

class ViewController: UIViewController {

    let b1 = Buyer()
    let b2 = Buyer()
    let b3 = Buyer()
    let notification = Notification.Name("event start")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived), name: notification, object: nil)
    }

    @objc func notificationReceived(_ notification: Notification) {
        print("Current notification received")
    }

    @IBAction func buttonAction(_ sender: UIButton) {
        let mySession = Session.shared
        mySession.name = "User Name"
        mySession.token = UUID().uuidString

        performSegue(withIdentifier: "login", sender: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: notification, object: nil)
    }
}

    //Observer

    struct WeakBuyer {
        weak var buyer: Buyer?
    }

    class Buyer {
        func takeInfo () {
            //здесь будет реакция на уведомление
            print("Shop send notify")
        }
    }

    class Shop {
        var listeners = [WeakBuyer]()

        func subscribe(_ buyer: Buyer) {
            let weakBuyer = WeakBuyer(buyer: buyer)
            listeners.append(weakBuyer)
        }

        func notify() {
            listeners.forEach { $0.buyer?.takeInfo() }
        }
}

