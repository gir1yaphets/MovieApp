//
//  ViewController.swift
//  MovieMvvmApp
//
//  Created by 彭骁略 on 2020/2/20.
//  Copyright © 2020 xiaoluepeng. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = MovieViewModel()
    var dataSource: RxTableViewSectionedReloadDataSource<MovieSections>!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: MovieTableCell.identifier, bundle: nil), forCellReuseIdentifier: MovieTableCell.identifier)
        
        dataSource = RxTableViewSectionedReloadDataSource<MovieSections>(configureCell: { (dataSource, tableView, indexPath, item) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableCell.identifier, for: indexPath) as! MovieTableCell
            cell.configureCell(with: item)
            return cell
        })
        
        viewModel.fetchMovies()
        .asDriver(onErrorJustReturn: [])
        .drive(tableView.rx.items(dataSource: self.dataSource)).disposed(by: disposeBag)
    }

}

