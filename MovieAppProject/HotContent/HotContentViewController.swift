//
//  HotContentViewController.swift
//  MovieAppProject
//
//  Created by Joy Kim on 6/4/24.
//

import UIKit

import Alamofire
import SnapKit


struct BoxOfficeResponse: Decodable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Decodable {
    let boxofficeType: String
    let showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

struct DailyBoxOfficeList: Decodable {
    let rnum: String
    let rank: String
    let rankInten: String
    let rankOldAndNew: String
    let movieCd: String
    let movieNm: String
    let openDt: String
    let salesAmt: String
    let salesShare: String
    let salesInten: String
    let salesChange: String
    let salesAcc: String
    let audiCnt: String
    let audiInten: String
    let audiChange: String
    let audiAcc: String
    let scrnCnt: String
    let showCnt: String
}

class HotContentViewController: UIViewController {
    
    let movieTextField = {
        let tF = UITextField()
        tF.placeholder = "날짜를 20200401형식으로 입력하세요"
        return tF
    }()
    let searchBtn = {
        let btn = UIButton()
        btn.setTitle("검색", for: .normal)
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
   
        return btn
    }()
    let lineView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    lazy var searchStack = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 10
        return stack
    }()
    let movieTableVIew = UITableView()
    
    var list: [DailyBoxOfficeList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
}

extension HotContentViewController {
    
    func configureHierarchy() {
        view.addSubview(lineView)
        view.addSubview(movieTableVIew)
        view.addSubview(searchStack)
        
        searchStack.addArrangedSubview(movieTextField)
        searchStack.addArrangedSubview(searchBtn)
    }
    func configureLayout() {
        
        searchBtn.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
        searchStack.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(searchStack.snp.bottom).offset(3)
            make.horizontalEdges.equalTo(movieTextField)
            make.height.equalTo(3)
        }
        
        movieTableVIew.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(15)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func configureUI() {
        view.backgroundColor = .white
        
        movieTableVIew.delegate = self
        movieTableVIew.dataSource = self
        movieTextField.delegate = self
        
        movieTableVIew.rowHeight = 55
        movieTableVIew.register(HotContentTableViewCell.self, forCellReuseIdentifier: HotContentTableViewCell.identifier)
        
        searchBtn.addTarget(self, action: #selector(callRequest), for: .touchUpInside)
        
    }
   @objc func callRequest() {
        
        print(#function, "333333")
        
        let url = "\(APIUrl.movieRankApi)\(movieTextField.text ?? "20240604")"
        AF.request(url).responseDecodable(of: BoxOfficeResponse.self) { response in
            switch response.result {
                
            case .success(let value):
                print("SUCCESS")
                
                // 네트워크 통신 성공했다면 list에 그 값을 넣어달라
                self.list = value.boxOfficeResult.dailyBoxOfficeList
                // list에 변동이 있기 때문에 tableview 갱신필요
                self.movieTableVIew.reloadData()
                
            case .failure(let error):
                self.alert()
                self.list = []
                self.movieTextField.text = ""
                self.movieTableVIew.reloadData()
                
            }
        }
        print(#function, "444444")
        
    }
    
    func alert() {
        let alert = UIAlertController(
            title: "값이 없습니다!",
            message: "어제일자까지만 검색이 가능합니다!\n20240607 형식으로 입력했는지 확인하세요",
            preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(ok)

        present(alert, animated: true)
    }
}


extension HotContentViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.clearButtonMode = .whileEditing
    }
}

extension HotContentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HotContentTableViewCell.identifier, for: indexPath) as! HotContentTableViewCell
        
        let movie = list[indexPath.row]
        cell.rankLabel.text = movie.rank
        cell.movieTitleLabel.text = movie.movieNm
        cell.issueDateLabel.text = movie.openDt
        
        
        return cell
    }
    
}
