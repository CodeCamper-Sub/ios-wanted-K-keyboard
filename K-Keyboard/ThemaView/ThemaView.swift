//
//  FourView.swift
//  K-Keyboard
//
//  Created by so on 2022/09/30.
//

import UIKit

class ThemaView: UIView {
    
    let buy : UILabel = {
        let buy = UILabel()
        buy.translatesAutoresizingMaskIntoConstraints = false
        buy.text = "이 테마를 어떻게 생각하나요?"
        buy.textColor = .black
        return buy
    }()
    let immoge: [String] = ["☺️","😍","😉","🤣"]
    var b1 : [String] = ["맘에들어요", "심쿵했어요", "응원해요","갖고싶어요"]
    var c1 : Int = 0
//    var c1 : [String] = ["0","1","0","0"]
    let collectionView : UICollectionView = {
        let collectionView = UICollectionViewFlowLayout()
        //        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //        let layout = UICollectionViewFlowLayout()
        collectionView.minimumInteritemSpacing = 38
//        collectionView.minimumLineSpacing = 38
        collectionView.scrollDirection = .vertical
//        collectionView.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionView)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    private func setupView() {
        collectionView.register(ThemaCollectionViewCell.self, forCellWithReuseIdentifier: ThemaCollectionViewCell.identifier)
        collectionView.delegate = self
        
        //컬렉션뷰 크기
        collectionView.heightAnchor.constraint(equalToConstant: 66).isActive = true
        collectionView.dataSource = self
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit(){
        self.addSubview(buy)
        addSubview(collectionView)
        constraintCustomView()
        setupView()
    }
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            buy.topAnchor.constraint(equalTo: self.topAnchor),
            buy.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buy.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: buy.bottomAnchor,constant: 24),
            collectionView.leadingAnchor.constraint(equalTo: buy.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
extension ThemaView: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThemaCollectionViewCell", for: indexPath) as? ThemaCollectionViewCell else {return ThemaCollectionViewCell()}
        cell.imoge.text = immoge[indexPath.row]
        cell.feel.text = b1[indexPath.row]
        cell.count.text = "\(c1)"
//        cell.count.text = c1[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 56 , height: 66)
    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//     
//           c1 += 1
//        collectionView.reloadData()
//        }
    }




