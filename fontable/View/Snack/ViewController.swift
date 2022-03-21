//
//  ViewController.swift
//  fontable
//
//  Created by 홍태희 on 2022/03/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var advertise: UICollectionView!
    @IBOutlet weak var snacks: UICollectionView!
    @IBOutlet weak var drinks: UICollectionView!
    
    //임시 데이터
    let bannerImage : Array<UIImage> = [UIImage(named: "first.png")!, UIImage(named: "second.png")!, UIImage(named: "third.png")!]
    
    var thispage = 0
    let testsnack = ["새우깡 매운맛", "초코틴틴 말차맛", "빅파이 딸기맛", "롤리폴리 초코맛", "삽립 피자호빵"]
    let testdrink = ["2% 부족할때 복숭아맛", "파워에이드", "게토레이", "파워오투 오렌지향", "복숭아녹차"]
    
    //2초마다 실행되는 타이머
    func scrollTime() {
        let _ : Timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true){ (Timer) in
            self.scrollBanner()
        }
    }
    
    func scrollBanner() {
        if thispage == bannerImage.count - 1 { //마지막페이지
            advertise.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            thispage = 0
        } else {
            thispage += 1
            advertise.scrollToItem(at: NSIndexPath(item: thispage, section: 0) as IndexPath, at: .right, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        advertise.delegate = self
        advertise.dataSource = self
        
        snacks.delegate = self
        snacks.dataSource = self
        
        drinks.delegate = self
        drinks.dataSource = self
        
        scrollTime()
    }

    
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //각 콜렉션뷰에 다른 정보가 기입되어야함
        if collectionView == advertise {
            guard let bannerCells = advertise.dequeueReusableCell(withReuseIdentifier: "banner", for: indexPath) as? BannerCell else {
                return UICollectionViewCell()
            }
            bannerCells.banners.image = bannerImage[indexPath.row]
            
            return bannerCells
        } else if collectionView == snacks {
            guard let snackCells = snacks.dequeueReusableCell(withReuseIdentifier: "snack", for: indexPath) as? SnackCollectionViewCell else {
                return UICollectionViewCell()
            }
            snackCells.snackImg.image = bannerImage[indexPath.row]
            snackCells.snackLabel.text = testsnack[indexPath.row]
            
            return snackCells
        } else {
            guard let drinkCells = drinks.dequeueReusableCell(withReuseIdentifier: "drink", for: indexPath) as? DrinkCollectionViewCell else {
                return UICollectionViewCell()
            }
            drinkCells.drinkImg.image = bannerImage[indexPath.row]
            drinkCells.driinkLabel.text = testdrink[indexPath.row]
            
            return drinkCells
        }
    }
    
}
