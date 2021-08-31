//
//  PostTableViewController.swift
//  DcardImitation
//
//  Created by Machir on 2021/8/25.
//

import UIKit

class PostTableViewController: UITableViewController {
    
    var posts = [Post]()
    
    @objc func loadData() {
        let urlStr = "https://dcard.tw/_api/posts?popular=true"
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                let decoder = JSONDecoder()
                //decoder.dataDecodingStrategy = .iso8601
                if let data = data {
                    do {
                        let posts = try decoder.decode([Post].self, from: data)
                        self.posts = posts
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        refreshControl()
    }
    
    //下拉更新功能
    func refreshControl() {
        
        refreshControl = UIRefreshControl()
        
        //顯示文字的顏色
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.green]
        
        //顯示文字內容
        refreshControl?.attributedTitle = NSAttributedString(string: "更新中", attributes: attributes)
        
        //設定元件顏色
        refreshControl?.tintColor = UIColor.green
        
        //設定下拉背景顏色
        refreshControl?.backgroundColor = UIColor.green
        
        //下拉後執行動作
        refreshControl?.addTarget(self, action: #selector(loadData), for: UIControl.Event.valueChanged)
        
        //將元件加入TableView的視圖中
        tableView.addSubview(refreshControl!)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell

        // Configure the cell...
        let post = posts[indexPath.row]
        
        if post.school == nil {
            cell.schoolLabel.text = "匿名"
        } else {
            cell.schoolLabel.text = post.school
        }
        
        if post.likeCount != 0 {
            cell.likeCountImage.tintColor = UIColor.systemRed
        } else {
            cell.likeCountImage.tintColor = UIColor.systemGray
        }
        
        if post.gender == "M" {
            cell.genderImageView.image = UIImage(named: "boy")
        } else {
            cell.genderImageView.image = UIImage(named: "girl")
        }
        
        cell.likeCountLabel.text = "\(post.likeCount)"
        cell.forumNameLabel.text = post.forumName
        cell.titleLabel.text = post.title
        cell.excerptLabel.text = post.excerpt
        cell.commonCountLabel.text = "\(post.commentCount)"
        
        if post.mediaMeta.count != 0 {
            let imageUrl = post.mediaMeta[0].url
            URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                if let data = data {
                    DispatchQueue.main.async {
                        cell.postImage.isHidden = false
                        cell.postImage.image = UIImage(data: data)
                    }
                }
            }.resume()
        } else {
            cell.postImage.isHidden = true
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let row = tableView.indexPathForSelectedRow?.row, let controller = segue.destination as? PostDetailTableViewController {
            let post = posts[row]
            controller.post = post
        }
    }
    

}
