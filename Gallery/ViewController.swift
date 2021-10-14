//
//  ViewController.swift
//  Gallery
//
//  Created by Mac Mini on 12/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tbl: UITableView!
    var viewModel = ViewModel()
    
    var selectedRowIndex = -1
    var selectedRowIndexSecond = -1
    
    var fromBtnOne = Bool()
    var fromBtnTwo = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func openEventOne(sender: UIButton){
        fromBtnOne = true
        fromBtnTwo = false
        selectedRowIndexSecond = -1
        if selectedRowIndex == sender.tag {
            selectedRowIndex = -1
        } else {
            selectedRowIndex = sender.tag
        }
        let indexPath = IndexPath(row: sender.tag, section: 0)
        let cell = tbl.cellForRow(at: indexPath) as! customCell
        cell.viewFirst.isHidden = false
        cell.viewSecond.isHidden = true
        cell.btnFirst.layer.borderWidth = 10
        cell.btnSEcond.layer.borderWidth = 0
        cell.imgFirst.isHidden = false
        tbl.beginUpdates()
        tbl.endUpdates()
        
    }
    
    @objc func openEventTwo(sender: UIButton){
        fromBtnOne = false
        fromBtnTwo = true
        selectedRowIndex = -1
        if selectedRowIndexSecond == sender.tag {
            selectedRowIndexSecond = -1
        } else {
            selectedRowIndexSecond = sender.tag
        }
        let indexPath = IndexPath(row: sender.tag, section: 0)
        let cell = tbl.cellForRow(at: indexPath) as! customCell
        cell.viewSecond.isHidden = false
        cell.viewFirst.isHidden = true
        cell.btnFirst.layer.borderWidth = 0
        cell.btnSEcond.layer.borderWidth = 10
        cell.imgSecond.isHidden = false
        tbl.beginUpdates()
        tbl.endUpdates()
    }
    
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.aryBtnFirstImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath) as! customCell
        cell.btnFirst.setBackgroundImage(UIImage.init(named: viewModel.aryBtnFirstImages[indexPath.row]), for: .normal)
        cell.btnSEcond.setBackgroundImage(UIImage.init(named: viewModel.aryBtnSecondImages[indexPath.row]), for: .normal)
        cell.lblViewFirstTitle?.text = viewModel.aruViewFirstTitle[indexPath.row]
        cell.lblViewFirstSize?.text = viewModel.aruViewFirstSize[indexPath.row]
        cell.lblViewFirstDes?.text = viewModel.aruViewFirstDes[indexPath.row]
        cell.lblViewSecondTitle?.text = viewModel.aruViewSecondTitle[indexPath.row]
        cell.lblViewSecondSize?.text = viewModel.aruViewSecondSize[indexPath.row]
        cell.lblViewSecondDes?.text = viewModel.aruViewSecondDes[indexPath.row]
        cell.btnFirst.tag = indexPath.row
        cell.btnSEcond.tag = indexPath.row
        cell.btnFirst.addTarget(self, action: #selector(openEventOne(sender:)), for: .touchUpInside)
        cell.btnSEcond.addTarget(self, action: #selector(openEventTwo(sender:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let indexPath = IndexPath(row: indexPath.row, section: 0)
        let cell = tbl.cellForRow(at: indexPath) as? customCell
        if fromBtnOne == true {
            if indexPath.row == selectedRowIndex {
                cell?.imgFirst.isHidden = false
                cell?.imgSecond.isHidden = true
                return 435
            }
            cell?.imgFirst.isHidden = true
            cell?.imgSecond.isHidden = true
            cell?.btnFirst.layer.borderWidth = 0
            cell?.btnSEcond.layer.borderWidth = 0
            return 195
        }else if fromBtnTwo == true {
            if indexPath.row == selectedRowIndexSecond {
                cell?.imgFirst.isHidden = true
                cell?.imgSecond.isHidden = false
                return 435
            }
            cell?.imgFirst.isHidden = true
            cell?.imgSecond.isHidden = true
            cell?.btnFirst.layer.borderWidth = 0
            cell?.btnSEcond.layer.borderWidth = 0
            return 195
        }else{
            cell?.imgSecond.isHidden = true
            cell?.btnSEcond.layer.borderWidth = 0
            return 195
        }
    }
}
