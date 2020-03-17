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
        tableView.register(UINib(nibName: "MovieTableCell", bundle: nil), forCellReuseIdentifier: "ReusebleCell")
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusebleCell", for: indexPath) as! MovieTableCell
        configureCell(cell, rowAtIndexPath : indexPath)
        return cell
    }
    
    func configureCell(_ cell : MovieTableCell, rowAtIndexPath index : IndexPath) {
        cell.movieLabel?.text = viewModel.getMovieInfo(movieItemIndex : index.item)
    }
}

