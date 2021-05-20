 import UIKit
 import Alamofire
 import SVProgressHUD

 class ViewController: UIViewController {
    
    var fund: [Fund]?

    lazy var navBar: UINavigationBar = {
       let navBar = UINavigationBar()
       let navItem = UINavigationItem(title: "Fundos")
       navBar.backgroundColor = .darkGray
       navBar.setItems([navItem], animated: false)
       navBar.translatesAutoresizingMaskIntoConstraints =  false
       
        return navBar
    }()

   lazy var tableView: UITableView = {
       let tableView = UITableView(frame: .zero, style: .plain)
            tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.delegate = self
            tableView.dataSource = self
            tableView.allowsMultipleSelection = false
            tableView.separatorStyle = .singleLine
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 110
            tableView.keyboardDismissMode = .onDrag
            tableView.backgroundColor = .clear
            view.backgroundColor = .darkGray
    
            return tableView
    }()
    
    override func viewDidLoad() {
     super.viewDidLoad()
        
    
        createSubviews()
        setupConstraints()
        
        getFund()
    }
    
    func getFund() {
        startLoading() // abrindo alerta
        FundAPI.shared.getFund { fund in // fund -> retorno do request
         self.stopLoading() // fechando alerta
            
            
            if fund == nil {  // verificando se tem retorno do request
                 print("Falhou")
                return
            }
            
            self.fund = fund // atruibuindo valor a  nossa variável
            self.tableView.reloadData() // recarregando os dados da table view
       }
        
    }
    
    func startLoading() {
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setForegroundColor(.white)
        SVProgressHUD.setBackgroundColor(UIColor.lightGray)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.show()
    }
    
    func stopLoading() {
        SVProgressHUD.dismiss()
    }
    
    func createSubviews() {
        view.addSubview(navBar)
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            navBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navBar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            navBar.widthAnchor.constraint(equalTo: view.widthAnchor),
            navBar.heightAnchor.constraint(equalTo: view.heightAnchor),
            navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),


            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

 }
 
 extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 6
     }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let fund = self.fund else { // verifcando se tem informação
            return TableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell // criando a table view cell
         
        cell.setup(fund: fund[indexPath.row])
        return cell
    }
}

