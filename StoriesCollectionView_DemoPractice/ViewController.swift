//
//  ViewController.swift
//  StoriesCollectionView_DemoPractice
//
//  Created by tmtech1 on 18/10/22.
//

import UIKit

struct Model {
    let imgName: String
    
    init(imgName: String) {
        self.imgName = imgName
    }
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private var myCollectionView: UICollectionView?
    
    private var aryModel: [Model] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        // append new element in array model
        for index in 1...10 {
            
            self.aryModel.append(Model(imgName: "Car-\(index)"))
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        myCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        myCollectionView?.register(CircleCollectionViewCell.self, forCellWithReuseIdentifier: CircleCollectionViewCell.identifier)
        
        myCollectionView?.delegate = self
        myCollectionView?.dataSource = self
        myCollectionView?.showsHorizontalScrollIndicator = false
        myCollectionView?.backgroundColor = .white
        
        guard let collectionview = myCollectionView else { return }
        view.addSubview(collectionview)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myCollectionView?.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 140)
    }

    //MARK: - collectionview delegate methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return aryModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleCollectionViewCell.identifier, for: indexPath) as! CircleCollectionViewCell
        
        cell.configure(with: aryModel[indexPath.row].imgName)
        
        return cell
    }
}

