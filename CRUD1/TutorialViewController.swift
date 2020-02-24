//
//  ViewController.swift
//  CRUD1
//
//  Created by Tanaka Soushi on 2020/02/02.
//  Copyright © 2020 Tanaka Soushi. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var messageText: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    
    typealias descriptionTuple = (title:String , message:String, imageName:String)
    let descriptionArray:[descriptionTuple] = [
        (title:"ダウンロードいただき\nありがとうございます" , message:"ワークスポット(WorkSpot)は、\n単発バイト専用サービスです。", imageName: "image01"),
        (title:"Step1 プロフィールを登録しよう！" , message:"仕事に応募する前に、\nまずはプロフィールの登録を\n済ませておきましょう。", imageName: "image02"),
        (title:"Step2 仕事に応募してみよう！" , message:"自分の働きたい場所や時給について、\n納得のいく仕事を探してみましょう。", imageName: "image03"),
        (title:"Step3 面接は一切なし！" , message:"面倒な面接は一切ありません。\n応募が完了したら、\n当日まで待つだけです。", imageName: "image04"),
        (title:"Step4 お金を受け取ろう！" , message:"毎月25日に、お給料が振り込まれます。\nお給料はプロフィールから\n確認することができます！", imageName: "image05"),
        (title:"Step5 はじめよう！" , message:"さっそくはじめよう！", imageName: "image06"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleText.text = descriptionArray[0].title
        messageText.text = descriptionArray[0].message
        image.image = UIImage(named: descriptionArray[0].imageName)
        titleText.textAlignment = .center
        messageText.textAlignment = .center
        titleText.numberOfLines = 3
        messageText.numberOfLines = 3
        backButton.setTitle("戻る", for: .normal)
        nextButton.setTitle("次へ", for: .normal)
        backButton.isHidden = true
        pageControl.numberOfPages = descriptionArray.count
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        pageControlAction(pageControl, true)
    }
    @IBAction func backButtonAction(_ sender: Any) {
        pageControlAction(pageControl, false)
    }
    @IBAction func pageControlAction(_ sender: UIPageControl, _ next:Bool) {
        //next == true で次のページの処理
        if next, sender.currentPage < descriptionArray.count - 1 {
            backButton.isHidden = false
            pageUpdaete(page: sender.currentPage + 1)
        } else if !next, sender.currentPage >= 1 {
            pageUpdaete(page: sender.currentPage - 1)
            nextButton.isHidden = false
            if sender.currentPage == 0 {
                backButton.isHidden = true
            }
        } else if sender.currentPage == descriptionArray.count - 1 {
            performSegue(withIdentifier: "goStart", sender: nil)
        }
    }
    private func pageUpdaete(page:Int) {
        pageControl.currentPage = page
        //最後のページになった時
        if page == descriptionArray.count - 1 {
            nextButton.setTitle("はじめる", for: .normal)
            backButton.isHidden = false
            titleText.text = descriptionArray[page].title
            messageText.text = descriptionArray[page].message
            image.image = UIImage(named: descriptionArray[page].imageName)
        } else {
            nextButton.setTitle("次へ", for: .normal)
            self.titleText.text = self.descriptionArray[page].title
            self.messageText.text = self.descriptionArray[page].message
            image.image = UIImage(named: descriptionArray[page].imageName)
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }


}

//DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
////1秒後に実行したい処理をここに書く
//}

