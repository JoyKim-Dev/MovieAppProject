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
    
    let mainImageView = {
        let view = UIImageView()
        view.image = .노량
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    let mainImageLabel = {
        let view = UILabel()
        view.text = "응원하고픈 ・ 흥미진진 ・ 사극 ・ 전투 ・ 한국 작품"
        view.backgroundColor = .black.withAlphaComponent(0.5)
        view.font = .systemFont(ofSize: 15, weight: .semibold)
        view.textAlignment = .center
        return view
    }()
    let mainImagePlayBtn = {
        let view = UIButton()
        view.setImage(.playNormal, for: .normal)
        view.contentMode = .scaleToFill
        return view
    }()
    let mainImageAddListBtn = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "plus"), for: .normal)
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        view.tintColor = .white
        view.setTitle(" 내가 찜한 리스트", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = .boldSystemFont(ofSize: 14)
        return view
    }()
    
    let hotContentLabel = {
        let view = UILabel()
        view.text = "지금 뜨는 콘텐츠"
        return view
    }()
    let hotContentImageOne = {
        let view = UIImageView()
        view.image = .극한직업
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    let hotContentImageTwo = {
        let view = UIImageView()
        view.image = .도둑들
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    let hotContentImageThree = {
        let view = UIImageView()
        view.image = .범죄도시3
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    lazy var contentsStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var btnStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        return stackView
        
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureHierarchy()
        configureLayout()
        configureBarbuttonItem()
    }


}

extension MainPageViewController {
    
    // 뷰에 추가 -> 순서 중요
    func configureHierarchy() {
        let array = [mainImageView, mainImageLabel,hotContentLabel]
        
        for i in array {
            view.addSubview(i)
        }
        
        view.addSubview(contentsStackView)
        view.addSubview(btnStackView)

        let hotContentsArray = [hotContentImageOne, hotContentImageTwo, hotContentImageThree]
        
        for i in hotContentsArray {
            contentsStackView.addArrangedSubview(i)
        }
        
        let btnArray = [mainImagePlayBtn, mainImageAddListBtn]
        
        for i in btnArray {
            btnStackView.addArrangedSubview(i)
        }
        
 
    }
    
    // 레이아웃 잡기
    func configureLayout() {
        mainImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(450)
        }
        
        mainImageLabel.snp.makeConstraints { make in
            make.bottom.equalTo(mainImageView).offset(-70)
            make.leading.equalTo(mainImageView).offset(20)
            make.trailing.equalTo(mainImageView).offset(-20)
        }
        
        btnStackView.snp.makeConstraints { make in
            make.top.equalTo(self.mainImageLabel.snp.bottom).offset(20)
            make.leading.equalTo(mainImageView).offset(20)
            make.trailing.equalTo(mainImageView).offset(-20)
            make.height.equalTo(25)
        }
        
        hotContentLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView).offset(450)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
        
        contentsStackView.snp.makeConstraints { make in
            make.top.equalTo(hotContentLabel).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    func configureBarbuttonItem() {
        
        let item = UIBarButtonItem(image: .singleLarge , style: .plain, target: self, action: #selector(NetflixIconClicked))
        item.tintColor = .red
        navigationItem.rightBarButtonItem = item
    }
    
    @objc func NetflixIconClicked() {
        let vc = LoginPageViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
