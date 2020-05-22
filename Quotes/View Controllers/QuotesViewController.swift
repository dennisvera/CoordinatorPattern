//
//  QuotesViewController.swift
//  Quotes
//
//  Created by Bart Jacobs on 30/05/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController {

    // MARK: - Properties
    
    private let quotes: [Quote] = [
        Quote(author: "Marie Curie",        content: "Be less curious about people and more curious about ideas."),
        Quote(author: "Albert Einstein",    content: "Life is like riding a bicycle. To keep your balance you must keep moving."),
        Quote(author: "Jane Goodall",       content: "Every individual matters. Every individual has a role to play. Every individual makes a difference."),
        Quote(author: "Dalai Lama",         content: "Be kind whenever possible. It is always possible."),
        Quote(author: "Margaret Atwood",    content: "A word after a word after a word is power."),
        Quote(author: "Bill Gates",         content: "Success is a lousy teacher. It seduces smart people into thinking they can't lose."),
        Quote(author: "J.K. Rowling",       content: "Happiness can be found, even in the darkest of times, if one only remembers to turn on the light."),
        Quote(author: "Steve Jobs",         content: "Design is not just what it looks like and feels like. Design is how it works."),
        Quote(author: "Rosalind Franklin",  content: "Science and everyday life cannot and should not be separated."),
        Quote(author: "Charles Darwin",     content: "A man who dares to waste one hour of time has not discovered the value of life.")
    ]
    
    // MARK: -
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            // Configure Table View
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Title
        title = "Quotes"
        
        // Setup Notification Handling
        setupNotificationHandling()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        
        if identifier == "Quote" {
            guard let destination = segue.destination as? QuoteViewController else {
                return
            }
            
            guard let indexPath = tableView.indexPathForSelectedRow else {
                return
            }
            
            // Fetch Quote
            let quote = quotes[indexPath.row]
            
            // Configure Destination
            destination.quote = quote
        }
    }
    
    // MARK: - Actions
    
    @IBAction func settings(_ sender: Any) {
        guard let settingsViewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: SettingsViewController.storyboardIdentifier) as? SettingsViewController else {
            fatalError("Unable to Instantiate Settings View Controller")
        }
        
        // Present Settings View Controller
        present(settingsViewController, animated: true)
    }
    
    // MARK: - Helper Methods

    private func setupNotificationHandling() {
        NotificationCenter.default.addObserver(forName: .fontSizeDidChange, object: nil, queue: .main) { [weak self] _ in
            self?.tableView.reloadData()
        }
        
        NotificationCenter.default.addObserver(forName: .fontWeightDidChange, object: nil, queue: .main) { [weak self] _ in
            self?.tableView.reloadData()
        }
    }

}

extension QuotesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuoteTableViewCell.reuseIdentifier, for: indexPath) as? QuoteTableViewCell else {
            fatalError("Unable to Dequeue Quote Table View Cell")
        }
        
        // Fetch Quote
        let quote = quotes[indexPath.row]
        
        // Configure Cell
        cell.configure(author: quote.author, content: quote.content)

        return cell
    }
    
}

extension QuotesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
