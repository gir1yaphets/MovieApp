//
//  ViewController.swift
//  MovieMvvmApp
//
//  Created by 彭骁略 on 2020/2/20.
//  Copyright © 2020 xiaoluepeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel : MovieViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel = MovieViewModel()
        tableView.dataSource = self
        
        viewModel.fetchMovies() { (movies : [MovieModel]?) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getMovieItemCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        configureCell(cell, rowAtIndexPath : indexPath)
        return cell
    }
    
    func configureCell(_ cell : UITableViewCell, rowAtIndexPath index : IndexPath) {
        cell.textLabel?.text = viewModel.getMovieInfo(movieItemIndex : index.item)
    }
}

