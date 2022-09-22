//
//  ViewController.swift
//  NewsApp
//
//  Created by Furkan on 16.09.2022.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var tblView: UITableView!

    var newsList = [News]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tblView.delegate = self
        tblView.dataSource = self
       
        fetchNews(konu:"general")
    }
    
    func fetchNews(konu:String){
        let headers = [
          "content-type": "application/json",
          "authorization": "apikey 6Rafjtw7wDBewl4Quv6OAk:17ma04CochSnMbLJdYlRrM"
        ]

        var request = URLRequest(url: URL(string: "https://api.collectapi.com/news/getNews?country=tr&tag=\(konu)")!,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        URLSession.shared.dataTask(with: request, completionHandler: { data,response,error in
            if data == nil && error != nil{
                print(error.debugDescription,"Error")
                return
            }
            do {
                let json =  try JSONDecoder().decode(NewsCevap.self, from: data!)
                if let newData = json.result{
                    self.newsList = newData
                }
                
                DispatchQueue.main.async {
                    print(self.newsList.count)
                    self.tblView.reloadData()
                }
            } catch  {
                print(error.localizedDescription)
            }
        }).resume()
        }


}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! TableViewCell
        
        cell.lblTitle.text = newsList[indexPath.row].name
        cell.lblDesc.text = newsList[indexPath.row].description
        cell.lblSource.text = newsList[indexPath.row].source
        cell.imgView.sd_setImage(with: URL(string: newsList[indexPath.row].image))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIApplication.shared.open(URL(string: newsList[indexPath.row].url)!)
    }
}

