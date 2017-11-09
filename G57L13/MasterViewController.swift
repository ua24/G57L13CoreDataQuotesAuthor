//
//  MasterViewController.swift
//  G57L12
//
//  Created by Ivan Vasilevich on 11/2/17.
//  Copyright © 2017 RockSoft. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController {

	@IBOutlet weak var refresher: UIRefreshControl!
	var objects = [Quote]()


	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		fetchData()
	}
	
	func fetchData() {
		
		let fetchRequest: NSFetchRequest<Quote> = Quote.fetchRequest()
		let result = try! appDel.context.fetch(fetchRequest)
		self.objects = result
		self.tableView.reloadData()
		self.refresher.endRefreshing()
		
	}

	@IBAction func updateResults(_ sender: UIRefreshControl) {
		fetchData()
	}

	// MARK: - Table View

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return objects.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

		let object = objects[indexPath.row]
		cell.textLabel!.text = object.text
		return cell
	}


}

