//
//  ViewController.swift
//  Firebase101
//
//  Created by gigas on 2021/03/22.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    
    var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ref = Database.database().reference()
        
        updateLabel()
        saveBasicTypes()
        saveCustomers()
    }
    
    func updateLabel() {
        ref.child("firstData").observeSingleEvent(of: .value) { (snapshot) in
            self.dataLabel.text = snapshot.value as? String
        }
    }
    
}

extension ViewController {
    func saveBasicTypes() {
        ref.child("int").setValue(3)
        ref.child("double").setValue(3.5)
        ref.child("str").setValue("string value - 여러분 안녕")
        ref.child("arrys").setValue(["a", "b", "c"])
        ref.child("dict").setValue(["id":"anyId", "age": 10, "city": "seoul"])
    }
    
    func saveCustomers() {
        let books = [
            Book(title: "Goods to Great", author: "Someone"),
            Book(title: "Hacking Growth", author: "Somebody"),
        ]
        let customer1 = Customer(id: "\(Customer.id)", name: "Son", books: books)
        Customer.id += 1
        
        let customer2 = Customer(id: "\(Customer.id)", name: "Dele", books: books)
        Customer.id += 1
        
        let customer3 = Customer(id: "\(Customer.id)", name: "Kane", books: books)
        Customer.id += 1
        
        ref.child("customers")
            .child(customer1.id)
            .setValue(customer1.toDictionary)
        
        ref.child("customers")
            .child(customer2.id)
            .setValue(customer2.toDictionary)
        
        ref.child("customers")
            .child(customer3.id)
            .setValue(customer3.toDictionary)
    }
}

struct Customer {
    let id: String
    let name: String
    let books: [Book]
    
    static var id: Int = 0
    
    var toDictionary: [String:Any] {
        let booksArray = books.map { $0.toDictionary }
        let dict: [String:Any] = ["id": id, "name": name, "books": booksArray]
        
        return dict
    }
}

struct Book {
    let title: String
    let author: String
    
    var toDictionary: [String:Any] {
        let dict: [String: Any] = ["title": title, "author": author]
        return dict
    }
}

