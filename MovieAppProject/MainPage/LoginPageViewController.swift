//
//  LoginPageViewController.swift
//  MovieAppProject
//
//  Created by Joy Kim on 6/4/24.
//

import UIKit
import Alamofire
import SnapKit

class LoginPageViewController: UIViewController {

    let mainLabel = {
        let view = UILabel()
        view.textColor = .red
        view.font = .systemFont(ofSize: 30, weight: .black)
        view.textAlignment = .center
        view.backgroundColor = .none
        view.text = "JOYFLIX"
        return view
    }()
    let emailTf = {
        let view = UITextField()
        view.textColor = .white
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        view.textAlignment = .center
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        view.backgroundColor = .darkGray
        view.keyboardType = .emailAddress
        view.placeholder = "이메일 주소 또는 전화번호"
        return view
    }()
    
    let passwordTf = {
        let view = UITextField()
        view.textColor = .white
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        view.textAlignment = .center
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        view.backgroundColor = .darkGray
        view.keyboardType = .default
        view.placeholder = "비밀번호"
        return view
    }()
    
    let nicknameTf = {
        let view = UITextField()
        view.textColor = .white
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        view.textAlignment = .center
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        view.backgroundColor = .darkGray
        view.keyboardType = .default
        view.placeholder = "닉네임"
        return view
    }()
    
    let addressTf = {
        let view = UITextField()
        view.textColor = .white
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        view.textAlignment = .center
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        view.backgroundColor = .darkGray
        view.keyboardType = .default
        view.placeholder = "위치"
        return view
    }()
    
    let recomCodeTf = {
        let view = UITextField()
        view.textColor = .white
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        view.textAlignment = .center
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        view.backgroundColor = .darkGray
        view.keyboardType = .numberPad
        view.placeholder = "추천 코드 입력"
        return view
    }()
    
    let SignInLabel = {
        let view = UILabel()
        view.text = "회원가입"
        view.backgroundColor = .white
        view.textColor = .black
        view.font = .systemFont(ofSize: 17, weight: .bold)
        view.textAlignment = .center
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        return view
    }()
    
    let additionalInfoLabel = {
        let view = UILabel()
        view.text = "추가 정보 입력"
        view.textColor = .white
        view.font = .systemFont(ofSize: 15, weight: .semibold)
        view.textAlignment = .left
        return view
    }()
    
    let infoSwitch = {
        let view = UISwitch()
        view.onTintColor = .red
        view.thumbTintColor = .white
        return view
    }()
    
    lazy var userInputStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureHierarchy()
        configureLayout()
        configureUI()
        
        let userInputArray = [emailTf,passwordTf,nicknameTf,addressTf,recomCodeTf]
        
        for i in userInputArray {
            i.delegate = self
        }
        
       
    }
    
    

}

extension LoginPageViewController {
    
    // 뷰에 추가 -> 순서 중요
    func configureHierarchy() {
        
        view.addSubview(mainLabel)
        view.addSubview(infoSwitch)
        view.addSubview(additionalInfoLabel)
        view.addSubview(userInputStackView)
        
        let userInputArray = [emailTf,passwordTf,nicknameTf,addressTf,recomCodeTf,SignInLabel]
        
        for i in userInputArray {
            userInputStackView.addArrangedSubview(i)
        }
        
    }
    
    // 레이아웃 잡기
    
    func configureLayout() {
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        // 하나만 설정해도 다 적용되는군...why...
        emailTf.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        userInputStackView.snp.makeConstraints { make in
            make.centerY.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
        }
        
        additionalInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(self.userInputStackView.snp.bottom).offset(20)
            make.leading.equalTo(50)
        }
        
        infoSwitch.snp.makeConstraints { make in
            make.top.equalTo(self.userInputStackView.snp.bottom).offset(20)
            make.trailing.equalTo(-50)
        }
        
        
    }
    
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
           tap.cancelsTouchesInView = false
           view.addGestureRecognizer(tap)
        
    }
    
}

extension LoginPageViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
        textField.clearButtonMode = .whileEditing
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    }
    
