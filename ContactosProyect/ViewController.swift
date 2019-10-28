//
//  ViewController.swift
//  ContactosProyect
//
//  Created by Raul Armas Santiago on 10/11/19.
//  Copyright © 2019 Sento40. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let constactStore = CNContactStore()
        var constacts = [CNContact]()
        let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]
        let request = CNContactFetchRequest(keysToFetch: keys)
        let formatter = CNContactFormatter()
        formatter.style = .fullName
        
        do {
            try constactStore.enumerateContacts(with: request) {
                (contact, stop) in
                constacts.append(contact)
                if let name = formatter.string(from: contact) {
                    print(name)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        // Do any additional setup after loading the view.
    }


}

