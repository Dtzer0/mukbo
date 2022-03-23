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
    let snackImage : Array<UIImage> =  [UIImage(named: "candy.png")!, UIImage(named: "cookie.png")!, UIImage(named: "potatos.png")!, UIImage(named: "muffin.png")!, UIImage(named: "chocolate.png")!]
    let drinkImage : Array<UIImage> =  [UIImage(named: "coffie.png")!, UIImage(named: "soda.png")!, UIImage(named: "orange.png")!, UIImage(named: "lemonade.png")!, UIImage(named: "coke.png")!]
    
    var thispage = 0
    let testsnack = ["츄파춥스 레몬맛", "초코틴틴 초코맛", "포카칩 소금맛", "롤리폴리 초코맛", "가나 초콜릿"]
    let testdrink = ["콘트라베이스 라떼", "복숭아녹차", "게토레이", "레몬에이드", "환타 오렌지맛"]
    let testprice = ["1200", "1000", "1500", "2000", "1800"]
    
    //2초마다 실행되는 타이머
    func scrollTime() {
        let _ : Timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true){ (Timer) in
            self.scrollBanner()
        }
    }
    
    func scrollBanner() {
        if thispage == bannerImage.count - 1 { //마지막페이지라면
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
        
        if collectionView == advertise {
            return bannerImage.count
        } else if collectionView == snacks {
            return snackImage.count
        } else {
            return drinkImage.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //각 콜렉션뷰에 다른 정보가 기입되어야함 ( 하나의 뷰에 여러개의 cell )
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
            snackCells.snackImg.image = snackImage[indexPath.row]
            snackCells.snackLabel.text = testsnack[indexPath.row]
            snackCells.moneyLabel.text = testprice[indexPath.row]
            
            return snackCells
        } else {
            guard let drinkCells = drinks.dequeueReusableCell(withReuseIdentifier: "drink", for: indexPath) as? DrinkCollectionViewCell else {
                return UICollectionViewCell()
            }
            drinkCells.drinkImg.image = drinkImage[indexPath.row]
            drinkCells.driinkLabel.text = testdrink[indexPath.row]
            drinkCells.priceLabel.text = testprice[indexPath.row]
            
            return drinkCells
        }
    }
    
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == advertise {
            return CGSize(width: advertise.frame.size.width, height: advertise.frame.height)
        } else if collectionView == snacks {
            return CGSize(width: 180, height: 200)
        } else {
            return CGSize(width: 180, height: 200)
        }
        
    }
}
