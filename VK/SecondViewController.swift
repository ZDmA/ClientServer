//
//  SecondViewController.swift
//  VK
//
//  Created by Дмитрий Заика on 23.02.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameSecond: UILabel!
    @IBOutlet weak var tokenSecond: UILabel!
    let notification = Notification.Name("event start")

    override func viewDidLoad() {
        super.viewDidLoad()

        nameSecond.text = Session.shared.name //session.name
        tokenSecond.text = Session.shared.token

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonSecondAction() {
        NotificationCenter.default.post(name: notification, object: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
