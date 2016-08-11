//
//  ViewController.swift
//  RealmPractice
//
//  Created by JHJG on 2016. 4. 3..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //items 데이를 가져옴 
    var items = DBManager.instance.getList()
    var p: Person?
    
    @IBOutlet weak var mTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for i in 0  ..< 100  {
////            items.append("홍길동\(i)")
//            
//        }
        
        //자동적으로 스크롤러 크기조정
//        self.automaticallyAdjustsScrollViewInsets = false
        
    }

    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("SUBTITLE_CELL", forIndexPath: indexPath)
        //title
        cell.textLabel?.text = items[indexPath.row].name
        cell.detailTextLabel?.text = items[indexPath.row].age
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    //talbe view가 editing 모드로 진입했을때 스타일 지정
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .Delete
    }
    
    //editing모드에서의 이벤트를 가져옴
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            print(indexPath.row)
            //데이터를 지움
//            items.removeAtIndex(indexPath.row)
            
            p = items[indexPath.row]
            //realm delte
            if let a = p{
                DBManager.instance.delete(a)
            }
            
            
            //view를 지움. 애니메이션 있음
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            //위에처럼 view도 지워줄수 있지만, 안드로이드 처럼 notify같이 할수도있다. 하지만 애니메이션 없음
            tableView.reloadData()
        }
    }
    
    //add 했을때 뷰를 다시 그려준다.
    override func viewWillAppear(animated: Bool) {
        mTableView.reloadData()
    }
    
    
    //edit button action
    @IBAction func onEditClick(sender: UIBarButtonItem) {
        //editing 모드로 들어갈수 있게해줌
        //여기서 나오는 버튼은 위의 func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle { 쪽에서 바꿔줄수 있다.
        mTableView.setEditing(!mTableView.editing, animated: true)
    }
    
    
    
    

}

