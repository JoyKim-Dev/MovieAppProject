//
//  mainPageViewController.swift
//  MovieAppProject
//
//  Created by Joy Kim on 6/4/24.
//

import UIKit
import Alamofire
import SnapKit

class MainPageViewController: UIViewController {
    
    let mainImageView = UIImageView()
    let mainImageLabel = UILabel()
    let mainImagePlayBtn = UIButton()
    let mainImageAddListBtn = UIButton()
    
    let hotContentLabel = UILabel()
    let hotContentImageOne = UIImageView()
    let hotContentImageTwo = UIImageView()
    let hotContentImageThree = UIImageView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
    }


}

extension MainPageViewController {
    
    // 뷰에 추가 -> 순서 중요
    func configureHierarchy() {
        let array = [mainImageView, mainImageLabel, mainImagePlayBtn, mainImageAddListBtn, hotContentLabel, hotContentImageOne, hotContentImageTwo, hotContentImageThree]
        
        for i in array {
            view.addSubview(i)
        }
    }
    
    // 레이아웃 잡기
    
    func configureLayout() {
        mainImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(500)
        }
        
        mainImageLabel.snp.makeConstraints { make in
            make.bottom.equalTo(mainImageView).offset(-70)
            make.leading.equalTo(mainImageView).offset(20)
            make.trailing.equalTo(mainImageView).offset(-20)
        }
        
        mainImagePlayBtn.snp.makeConstraints { make in
            make.bottom.equalTo(mainImageView).offset(-50)
            make.leading.equalTo(mainImageView).offset(50)
            make.width.equalTo(100)
           
        }
        
        mainImageAddListBtn.snp.makeConstraints { make in
            make.bottom.equalTo(mainImageView).offset(-50)
            make.leading.equalTo(mainImageView).offset(30)
            make.trailing.equalTo(mainImageView).offset(50)
        }
        
        hotContentLabel.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(50)
        }
        
        hotContentImageOne.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(50)
        }
        
        hotContentImageTwo.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(50)
        }
    
        hotContentImageThree.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(50)
        }
        
    }
    
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        // SceneDelegate에서 네이게이션컨트롤 임베드 후 타이틀 설정
        navigationItem.title = "조이킴님"
        
        mainImageView.image = .노량
        mainImageView.layer.cornerRadius = 20
        mainImageView.clipsToBounds = true
        
        mainImageLabel.text = "응원하고픈, 흥미진진, 사극, 전투, 한국 작품"
        mainImagePlayBtn.setImage(.playNormal, for: .normal)
        mainImageAddListBtn.setImage(.playNormal, for: .normal)
        
        hotContentLabel.text = "지금 뜨는 콘텐츠"
        hotContentImageOne.image = .극한직업
        hotContentImageTwo.image = .도둑들
        hotContentImageThree.image = .범죄도시3
        
        
        
        
    }
}
