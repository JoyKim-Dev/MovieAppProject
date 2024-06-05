//
//  LotteryGameViewController.swift
//  MovieAppProject
//
//  Created by Joy Kim on 6/5/24.
//

import UIKit
import SnapKit
import Alamofire

struct Lotto: Decodable {
    let drwNoDate: String
    let drwNo: Int
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
}

class LotteryGameViewController: UIViewController {
    
    let numberTextFIeld = UITextField()
    let dateLabel = UILabel()
    let infoLabel = UILabel()
    
    let lineView = UIView()
    
    let resultIntLabel = UILabel()
    let resultTextLabel = UILabel()
    
    let firstBall = UILabel()
    let secondBall = UILabel()
    let thirdBall = UILabel()
    let fourthBall = UILabel()
    let fifthBall = UILabel()
    let sixthBall = UILabel()
    let plusSpacing = UILabel()
    let bonusBall = UILabel()
    let bonusLabel = UILabel()
    
    lazy var ballStack = UIStackView()
    lazy var resultStack = UIStackView()
    
    let picker = UIPickerView()
    let drwNumbers = Array(1...1122)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setBallCornerRadius()
    }
    
    func setBallCornerRadius() {
        let balls = [firstBall, secondBall, thirdBall, fourthBall, fifthBall, sixthBall, bonusBall]
        
        for b in balls {
            b.layer.cornerRadius = b.frame.width / 2
            b.clipsToBounds = true
            b.textAlignment = .center
        }
    }
}

extension LotteryGameViewController {
    
    func configureUI() {
        view.backgroundColor = .white
        numberTextFIeld.inputView = picker
        picker.delegate = self
        
        let url = "\(APIUrl.lotteryApi)986"
        numberTextFIeld.text = "986"
        numberTextFIeld.clearButtonMode = .whileEditing
        
        hideKeyboardWhenTappedAround()
        
        
        
        
        AF.request(url).responseDecodable(of: Lotto.self ) { response in
            switch response.result {
            case .success(let value):
                
                self.firstBall.text = "\(value.drwtNo1)"
                self.secondBall.text = "\(value.drwtNo2)"
                self.thirdBall.text = "\(value.drwtNo3)"
                self.fourthBall.text = "\(value.drwtNo4)"
                self.fifthBall.text = "\(value.drwtNo5)"
                self.sixthBall.text = "\(value.drwtNo6)"
                self.bonusBall.text = "\(value.bnusNo)"
                self.resultIntLabel.text = "\(value.drwNo)회"
                self.dateLabel.text = "\(value.drwNoDate) 추첨"
                
            case .failure(_):
                self.numberTextFIeld.text = "해당하는 회차가 없습니다."
            }}
        
        numberTextFIeld.backgroundColor = .lightGray
        numberTextFIeld.layer.cornerRadius = 4
        numberTextFIeld.layer.borderWidth = 0.5
        numberTextFIeld.layer.borderColor = UIColor.lightGray.cgColor
        numberTextFIeld.placeholder = "회차를 선택하세요"
        numberTextFIeld.textColor = .black
        numberTextFIeld.textAlignment = .center
        numberTextFIeld.font = .boldSystemFont(ofSize: 20)
        
        
        
        infoLabel.layer.borderColor = .none
        infoLabel.text = "당첨번호 안내"
        infoLabel.textColor = .darkGray
        infoLabel.font = .boldSystemFont(ofSize: 14)
        infoLabel.textAlignment = .left
        
        dateLabel.layer.borderColor = .none

        dateLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        dateLabel.textColor = .gray
        
        lineView.backgroundColor = .gray.withAlphaComponent(0.5)
        

        resultIntLabel.font = .systemFont(ofSize: 25, weight: .heavy)
        resultIntLabel.textColor = .orange
        
        resultTextLabel.text = "당첨결과"
        resultTextLabel.font = .systemFont(ofSize: 25, weight: .heavy)
        resultTextLabel.textColor = .black
        
        
        firstBall.backgroundColor = .orange
        firstBall.textColor = .white
        firstBall.font = .boldSystemFont(ofSize: 15)
        
        
        secondBall.backgroundColor = .blue
        secondBall.textColor = .white
        secondBall.font = .boldSystemFont(ofSize: 15)
        
        
        thirdBall.backgroundColor = .blue
        thirdBall.textColor = .white
        thirdBall.font = .boldSystemFont(ofSize: 15)
        
        
        fourthBall.backgroundColor = .red
        fourthBall.textColor = .white
        fourthBall.font = .boldSystemFont(ofSize: 15)
        
        
        fifthBall.backgroundColor = .red
        fifthBall.textColor = .white
        fifthBall.font = .boldSystemFont(ofSize: 15)
        
        
        sixthBall.backgroundColor = .gray
        sixthBall.textColor = .white
        sixthBall.font = .boldSystemFont(ofSize: 15)
        
        
        plusSpacing.text = "+"
        plusSpacing.textAlignment = .center
        plusSpacing.backgroundColor = .white
        plusSpacing.textColor = .black
        plusSpacing.font = .boldSystemFont(ofSize: 15)
        
        
        bonusBall.backgroundColor = .gray
        bonusBall.textColor = .white
        bonusBall.font = .boldSystemFont(ofSize: 15)
        
        bonusLabel.text = "보너스"
        bonusLabel.backgroundColor = .white
        bonusLabel.textColor = .gray
        bonusLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        
        ballStack.axis = .horizontal
        ballStack.distribution = .fillEqually
        ballStack.spacing = 5
        
        resultStack.axis = .horizontal
        resultStack.distribution = .equalCentering
        resultStack.spacing = 3
    }
    
    
    
    func configureHierarchy() {
        view.addSubview(numberTextFIeld)
        view.addSubview(infoLabel)
        view.addSubview(dateLabel)
        view.addSubview(lineView)
        view.addSubview(ballStack)
        view.addSubview(resultStack)
        view.addSubview(bonusLabel)
        
        resultStack.addArrangedSubview(resultIntLabel)
        resultStack.addArrangedSubview(resultTextLabel)
        
        let ballArray = [firstBall,secondBall,thirdBall,fourthBall,fifthBall,sixthBall,plusSpacing,bonusBall]
        
        for i in ballArray {
            ballStack.addArrangedSubview(i)
        }
    }
    
    func configureLayout() {
        
        numberTextFIeld.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(40)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(numberTextFIeld.snp.bottom).offset(20)
            make.leading.equalTo(20)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(numberTextFIeld.snp.bottom).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(10)
            make.height.equalTo(1)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        resultIntLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        
        resultStack.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(30)
            make.centerX.equalTo(lineView)
        }
        
        firstBall.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            
        }
        
        ballStack.snp.makeConstraints { make in
            make.top.equalTo(resultStack.snp.bottom).offset(20)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        // 이걸 추가하면 viewDidLayoutSubview가 실행안된 상태로 시작됨..회차 클릭하면 다시 당첨공이 정원이 되긴 함. 주석처리하면 처음부터 정원으로 보여짐.. 무슨 차이일까!!
        bonusLabel.snp.makeConstraints { make in
            make.top.equalTo(ballStack.snp.bottom).offset(5)
            make.trailing.equalTo(ballStack.snp.trailing)
        }
        
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
}
extension LotteryGameViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1122
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        return String(drwNumbers[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let url = "\(APIUrl.lotteryApi)\(drwNumbers[row])"
        numberTextFIeld.text = "\(drwNumbers[row])"
        numberTextFIeld.clearButtonMode = .whileEditing
        
        self.hideKeyboardWhenTappedAround()
        
        
        
        
        AF.request(url).responseDecodable(of: Lotto.self ) { response in
            switch response.result {
            case .success(let value):
                
                self.firstBall.text = "\(value.drwtNo1)"
                self.secondBall.text = "\(value.drwtNo2)"
                self.thirdBall.text = "\(value.drwtNo3)"
                self.fourthBall.text = "\(value.drwtNo4)"
                self.fifthBall.text = "\(value.drwtNo5)"
                self.sixthBall.text = "\(value.drwtNo6)"
                self.bonusBall.text = "\(value.bnusNo)"
                self.resultIntLabel.text = "\(value.drwNo)회"
                self.dateLabel.text = "\(value.drwNoDate) 추첨"
                
            case .failure(_):
                self.numberTextFIeld.text = "해당하는 회차가 없습니다."
                
                
            }
        }
    }
    
    
    
}

