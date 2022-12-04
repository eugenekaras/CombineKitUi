//
//  ViewController.swift
//  CombineKitUi
//
//  Created by Евгений Карась on 5.12.22.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var tField: UITextField!
    @IBOutlet weak var pButton: UIButton!
    private var cancellable: AnyCancellable?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancellable = NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: tField)
            .map { $0.object as? UITextField }
            .compactMap { $0?.text }
            .map { str -> Bool in
                if let number = Double(str) {
                    return number > 10
                } else {
                    return false
                }
            }.assign(to: \.isEnabled, on: pButton)
        // Do any additional setup after loading the view.
    }


}

