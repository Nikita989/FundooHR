//
//  ViewController.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 06/12/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//


import UIKit
import JTAppleCalendar
import CoreData

//import <MGCollapsingHeaderView.h>


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,bankviewProtocol,personalviewProtocal,profileViewProtocal,trackingViewProtocol,enggInfoViewProtocol,hrviewProtocal,attendanceViewProtocol{

    
    @IBOutlet weak var employeeNameLabel: UILabel!
    
    @IBOutlet weak var inOutTimeView: UIView!
    @IBOutlet weak var reasonView: UIView!
    @IBOutlet weak var attendanceCollectionView: UICollectionView!
    @IBOutlet weak var attendanceMarkView: UIView!
    @IBOutlet weak var attendancePopupOutlet: AttendancePopUp!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet var tableView:UITableView?
    @IBOutlet weak var trackingOutlet: trackingView!
    @IBOutlet weak var containerHeight: NSLayoutConstraint!
    @IBOutlet weak var profileOutlet: profileView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var calenderView: JTAppleCalendarView!
    @IBOutlet weak var customPicker: UIPickerView!
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var bankOutlet: bankView!
    @IBOutlet weak var hrDataOutlet: HRDataView!
    @IBOutlet weak var engineerInfoOutlet: engineerInfoView!
    @IBOutlet weak var personalOutlet: personalView!
    @IBOutlet weak var attendanceOutlet: attendanceView!
    
    var hrDataViewModelVar = hrDataViewModel()
    var personalViewModelVar = personalViewModel()
    var profileViewModelVar = profileDataViewModel()
    var bankViewModelObj = bankViewModel()
    var trackingViewModelObj = trackingDataViewModel()
    var enggInfoObj = enggInfoViewModel()
    var attendanceViewModelObj = attendanceViewModel()
    var index:Int?
    var layer:CGLayer?
    var att:attendanceView?
    var dateChange:Bool = false
    var strDate:String?
    var strMonth:String?
    var strYear:String?
    var tapGesture:UITapGestureRecognizer?
    var flag:Bool = false
    var myCustomCell:CellView!
    var selectedRow:Int!
    var cellImage:UIImage?
    var selectedCol:Int!
    var check0:Bool? = false
    var check1:Bool = false
    var check2:Bool = false
    var check3:Bool = false
    var date1:String?
    var trainingVal:[String] = []
    var dAteQW:Date?
    var leavesTaken:Int!
    var myString:String!
    var attendanceKeys:[String]?
    var attendanceValues:[attendanceModel]?
    var i:Int = 0
    var j:Int = 0
    var count:Int = 0
    var valueSet:Bool = false
    var selectedImage:UIImage?
    var first:Bool = false
    var timeStamp:Double?
    var markedStatus:Bool = false
    var selectedAttendance:String?
    var inTime:String?
    var outTime:String?
    var reason:String?
    var timestamp2:Double!
    var dateObj:Date?
    var currentTimeStamp:Double!
    var didSelectDate:Bool = false
    let menuOptions : [String] = ["Attendance Details","Personal Details","Profile Details","HR Details","Bank Details","Tracking Details"]
    var monthArray:NSMutableArray = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    var yearArray:NSMutableArray = ["2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023", "2024", "2025", "2026", "2027", "2028", "2029", "2030", "2031", "2032", "2033", "2034", "2035", "2036", "2037"]

    override func viewDidLoad() {
            super.viewDidLoad()
            enggInfoObj.fetchDataFromController()
            attendanceCollectionView.delegate = self
            attendanceCollectionView.dataSource = self
            calenderView.layer.borderWidth = 3
            calenderView.layer.borderColor = UIColor(red: 180/255, green: 221/255, blue: 239/255, alpha: 1).cgColor
            calenderView.layer.masksToBounds = false
            calenderView.layer.shadowColor = UIColor.black.cgColor
            calenderView.layer.shadowOffset = CGSize(width:0.0,height: 2.0)
            calenderView.layer.shadowRadius = 2.0
            calenderView.layer.shadowOpacity = 0.6
            calenderView.dataSource = self
            calenderView.delegate = self
            calenderView.registerCellViewXib(file: "CellView")
            calenderView.cellInset = CGPoint(x: 0, y: 0)
            customPicker.dataSource = self
            customPicker.delegate = self
            let formatter = DateFormatter()
            let formatter1 = DateFormatter()
            formatter.setLocalizedDateFormatFromTemplate("MMMM")
            formatter1.setLocalizedDateFormatFromTemplate("yyyy")
            let currentMonth = formatter.string(from: Date())
            let currentYear = formatter1.string(from: Date())
            
            for var i in 0..<monthArray.count {
                if monthArray.object(at: i)as! String == currentMonth {
                    customPicker.selectRow(i, inComponent: 0, animated: true)
                    break
                }
            }
            for var j in 0..<yearArray.count {
                if yearArray.object(at: j) as! String == currentYear {
                    customPicker.selectRow(j, inComponent: 1, animated: true)
                    break
                }
            }
            self.tableView?.isHidden = true
            self.attendancePopupOutlet.isHidden = true
            self.blurView.isHidden = true
            self.addSubView(selectedIndex: 6)
            tableView?.delegate = self
            tableView?.dataSource = self
            bankViewModelObj.viewControllerProc = self
            hrDataViewModelVar.hrViewObj = self
            personalViewModelVar.personalProtocal = self
            profileViewModelVar.profileViewProc = self
            trackingViewModelObj.trackingViewProc = self
            enggInfoObj.enggViewProc = self
            attendanceViewModelObj.attendanceViewProc = self
            let dateFormatterObj = DateFormatter()
            dateFormatterObj.setLocalizedDateFormatFromTemplate("MMMMyyyy")
            let currentDate = dateFormatterObj.string(from: Date())
            let date = dateFormatterObj.date(from: currentDate)
            currentTimeStamp = (date?.timeIntervalSince1970)! * 1000
    }
    
    // ADDING GESTURE RECOGNIZER TO THE BLUR VIEW
    
    func addGestureRecogniser()
    {
         tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.hidePopUp(sender:)))
        self.blurView.addGestureRecognizer(tapGesture!)
    }
    
    // ACTION TO BE PERFORMED ON TAP
    
    func hidePopUp(sender:UITapGestureRecognizer)
    {
        self.blurView.isHidden = true
        self.attendancePopupOutlet.isHidden = true
    }
    
    // mainMenu button action
    
    @IBAction func menuBtn(_ sender: UIButton) {
        
        self.view.addSubview(self.tableView!)
        self.tableView?.isHidden = false
    }
    
    

    // Creating  Menu Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return menuOptions.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "thiscell")

        cell.textLabel!.text = menuOptions [indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont(name: "AppleGothic",
                                 size: 18)

        let color = UIColor(hexString: "#3B5372")
        
        
//      cell.layer.cornerRadius=10 //set corner radius here
        cell.textLabel?.textColor = color
        cell.layer.borderColor = UIColor.gray.cgColor  // set cell border color here
        cell.layer.borderWidth = 1
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        
        return "Engineers"
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        index = indexPath.row
        self.addSubView(selectedIndex: index!)
        self.tableView?.isHidden = true
        
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
        
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 60
    }
    
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        let header : UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "AppleGothic",size: 18)
        header.bounds.origin.x = 0
        header.bounds.origin.y = 0
        let color1 = UIColor(hexString: "#3B5372")
        header.textLabel?.textColor = color1
        header.textLabel?.textAlignment = .center
        
    }
    
    
   // Switch- case for the selected index in the table view
    
    // MARK: switch-cases for table view
    
    func addSubView(selectedIndex:Int)
    {
        switch selectedIndex {
        case 0:
         first = true
         attendanceViewModelObj.fetchMonthlyAttendanceFromController(timeStamp: currentTimeStamp)
          scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1500)
          attendanceOutlet.superview?.bringSubview(toFront: attendanceOutlet)
          attendanceOutlet.isHidden = false
          personalOutlet.isHidden = true
          profileOutlet.isHidden = true
          hrDataOutlet.isHidden = true
          bankOutlet.isHidden = true
          trackingOutlet.isHidden = true
            break
            
            
        case 1:
          personalViewModelVar.fetchPersonalDataFromController()
            attendanceOutlet.isHidden = true
            personalOutlet.isHidden = false
            profileOutlet.isHidden = true
            hrDataOutlet.isHidden = true
            bankOutlet.isHidden = true
            trackingOutlet.isHidden = true
            
            scrollView.contentSize = CGSize(width: self.view.frame.width, height: 900)
            personalOutlet.superview?.bringSubview(toFront: personalOutlet)
            break
            
        case 2:
            profileViewModelVar.fetchProfileDataFromController()
            attendanceOutlet.isHidden = true
            personalOutlet.isHidden = true
            profileOutlet.isHidden = false
            hrDataOutlet.isHidden = true
            bankOutlet.isHidden = true
            trackingOutlet.isHidden = true

            profileOutlet.superview?.bringSubview(toFront: profileOutlet)
             scrollView.contentSize = CGSize(width: self.view.frame.width, height: 900)
            break
            
        case 3:
            hrDataViewModelVar.fetchHrDataFromController()
            scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1800)
            attendanceOutlet.isHidden = true
            personalOutlet.isHidden = true
            profileOutlet.isHidden = true
            hrDataOutlet.isHidden = false
            bankOutlet.isHidden = true
            trackingOutlet.isHidden = true
            hrDataOutlet.superview?.bringSubview(toFront: hrDataOutlet)
            self.view.layoutIfNeeded()
            break
            
        case 4:
            
            bankViewModelObj.fetchDataFromController()
            scrollView.contentSize = CGSize(width: self.view.frame.width, height: 730)
            bankOutlet.isHidden = false

            attendanceOutlet.isHidden = true
            personalOutlet.isHidden = true
            profileOutlet.isHidden = true
            hrDataOutlet.isHidden = true
            trackingOutlet.isHidden = true
            bankOutlet.superview?.bringSubview(toFront: bankOutlet)
            self.view.layoutIfNeeded()
            break
            
        case 5:
            trackingViewModelObj.fetchTrackingDataFromController()
            scrollView.contentSize = CGSize(width: self.view.frame.width, height: 700)
            attendanceOutlet.isHidden = true
            personalOutlet.isHidden = true
            profileOutlet.isHidden = true
            hrDataOutlet.isHidden = true
            bankOutlet.isHidden = true
            trackingOutlet.isHidden = false
            trackingOutlet.superview?.bringSubview(toFront: trackingOutlet)
            self.view.layoutIfNeeded()
            break
            
            
        case 6:
            
            scrollView.contentSize = CGSize(width: self.view.frame.width, height: 730)
            engineerInfoOutlet.isHidden = false
            
            attendanceOutlet.isHidden = true
            personalOutlet.isHidden = true
            profileOutlet.isHidden = true
            hrDataOutlet.isHidden = true
            trackingOutlet.isHidden = true
            bankOutlet.isHidden = true
            engineerInfoOutlet.superview?.bringSubview(toFront: engineerInfoOutlet)
            self.view.layoutIfNeeded()
            break
            
            
        default:
            break
        }
        
    }

    // *******************Bank Buttons ***************************
     // MARK:bankBtns
    
    @IBAction func bankEditBtn(_ sender: Any) {
        bankOutlet.bankCancelBtn?.isHidden = false
        bankOutlet.bankSaveBtn?.isHidden = false
        bankOutlet.bankEditBtn?.setImage(UIImage.init(named: "mode_edit - material"), for: .normal)
        bankOutlet.tf1?.isUserInteractionEnabled = true
        bankOutlet.tf2?.isUserInteractionEnabled = true
        bankOutlet.tf3?.isUserInteractionEnabled = true
        bankOutlet.tf4?.isUserInteractionEnabled = true
        bankOutlet.tf5?.isUserInteractionEnabled = true
        bankOutlet.tf6?.isUserInteractionEnabled = true
        
    }

    
    @IBAction func bankSaveBtnPressed(_ sender: UIButton) {
        
        bankOutlet.tf1?.isUserInteractionEnabled = false
        bankOutlet.tf2?.isUserInteractionEnabled = false
        bankOutlet.tf3?.isUserInteractionEnabled = false
        bankOutlet.tf4?.isUserInteractionEnabled = false
        bankOutlet.tf5?.isUserInteractionEnabled = false
        bankOutlet.tf6?.isUserInteractionEnabled = false
        bankOutlet.bankCancelBtn?.isHidden = true
        bankOutlet.bankSaveBtn?.isHidden = true
        bankOutlet.bankEditBtn?.imageView?.image = UIImage(named: "editbtn")
      let bankString1 = bankOutlet.tf1?.text
       let bankString2 = bankOutlet.tf2?.text
        let bankString3 = bankOutlet.tf3?.text
        let bankString4 = bankOutlet.tf4?.text
        let bankString5 = bankOutlet.tf5?.text
        let bankString6 = bankOutlet.tf6?.text
        let bankObj = bankDataModel(accountNum: bankString1!,bankNAme: bankString2!,ifscCode: bankString3!,pan: bankString4!,paySalary: bankString5!,reasonVar: bankString6!)
        bankViewModelObj.sendUpdatedBankDataToController(bankData: bankObj)
    }
    
    
  
    
    @IBAction func BankCancelBtnPressed(_ sender: UIButton) {
        
        bankOutlet.bankCancelBtn?.isHidden = true
        bankOutlet.bankSaveBtn?.isHidden = true
        bankOutlet.tf1?.isUserInteractionEnabled = false
        bankOutlet.tf2?.isUserInteractionEnabled = false
        bankOutlet.tf3?.isUserInteractionEnabled = false
        bankOutlet.tf4?.isUserInteractionEnabled = false
        bankOutlet.tf5?.isUserInteractionEnabled = false
        bankOutlet.tf6?.isUserInteractionEnabled = false
        bankOutlet.bankEditBtn?.imageView?.image = UIImage(named: "editbtn")
    }
    
    
  
      // *******************personal Buttons ***************************
     // MARK:personalbtns
    @IBAction func personalSaveButtonPressed(_ sender: UIButton) {
        
        personalOutlet.personalSaveBtn?.isHidden = true
        personalOutlet.personalCancelBtn?.isHidden = true
        
        personalOutlet.tf1?.isUserInteractionEnabled = false
        personalOutlet.tf2?.isUserInteractionEnabled = false
        personalOutlet.tf3?.isUserInteractionEnabled = false
        personalOutlet.tf4?.isUserInteractionEnabled = false
        personalOutlet.tf5?.isUserInteractionEnabled = false
        personalOutlet.tf6?.isUserInteractionEnabled = false
        personalOutlet.tf7?.isUserInteractionEnabled = false
        personalOutlet.tf8?.isUserInteractionEnabled = false
        personalOutlet.tf9?.isUserInteractionEnabled = false
        personalOutlet.tf10?.isUserInteractionEnabled = false
        print("printed")
        personalOutlet.personalEditBtn?.imageView?.image = UIImage(named: "editbtn")
        let personalData1 = personalOutlet.tf8?.text
        let personalData2 = personalOutlet.tf4?.text
        let personalData3 = personalOutlet.tf2?.text
        let personalData5 = personalOutlet.tf6?.text
        let personalData6 = personalOutlet.tf5?.text
        let personalData7 = personalOutlet.tf3?.text
        let personalData8 = personalOutlet.tf9?.text
        let personalData9 = personalOutlet.tf7?.text
        let personalData10 = personalOutlet.tf10?.text
        let employeeName = personalOutlet.nameTextField?.text
        let personalObj = personalDataModel(annualSalary: personalData1!,dob: personalData2!,email: personalData3!,empName:employeeName!,fatherMobile: personalData5!,fatherName: personalData6!,mobile: personalData7!,mumbaiAddr: personalData8!,occupation: personalData9!,permanantAddr: personalData10!)
        personalViewModelVar.sendUpdatedPersonalDataToController(personalData: personalObj)
    }
    
    
    @IBAction func personalEditBtn(_ sender: UIButton) {
        
        personalOutlet.tf1?.isUserInteractionEnabled = true
        personalOutlet.tf2?.isUserInteractionEnabled = true
        personalOutlet.tf3?.isUserInteractionEnabled = true
        personalOutlet.tf4?.isUserInteractionEnabled = true
        personalOutlet.tf5?.isUserInteractionEnabled = true
        personalOutlet.tf6?.isUserInteractionEnabled = true
        personalOutlet.tf7?.isUserInteractionEnabled = true
        personalOutlet.tf8?.isUserInteractionEnabled = true
        personalOutlet.tf9?.isUserInteractionEnabled = true
        personalOutlet.tf10?.isUserInteractionEnabled = true
        personalOutlet.nameTextField?.isUserInteractionEnabled = true
        personalOutlet.personalSaveBtn?.isHidden = false
        personalOutlet.personalCancelBtn?.isHidden = false
        personalOutlet.personalEditBtn?.setImage(UIImage.init(named: "mode_edit - material"), for: .normal)

    }
    
       
    
    
    @IBAction func personalCancelButnPressed(_ sender: UIButton) {
        
        personalOutlet.personalSaveBtn?.isHidden = true
        personalOutlet.personalCancelBtn?.isHidden = true
        
        
        personalOutlet.tf1?.isUserInteractionEnabled = false
        personalOutlet.tf2?.isUserInteractionEnabled = false
        personalOutlet.tf3?.isUserInteractionEnabled = false
        personalOutlet.tf4?.isUserInteractionEnabled = false
        personalOutlet.tf5?.isUserInteractionEnabled = false
        personalOutlet.tf6?.isUserInteractionEnabled = false
        personalOutlet.tf7?.isUserInteractionEnabled = false
        personalOutlet.tf8?.isUserInteractionEnabled = false
        personalOutlet.tf9?.isUserInteractionEnabled = false
        personalOutlet.tf10?.isUserInteractionEnabled = false
        
        
        personalOutlet.personalEditBtn?.imageView?.image = UIImage(named: "editbtn")

    }
    
    // *******************profile Buttons ***************************
    
     // MARK:profileBtns
    @IBAction func profileEditBtnPressed(_ sender: UIButton) {
        
        profileOutlet.profilCancelBtn?.isHidden = false
        profileOutlet.profileSaveBtn?.isHidden = false
        
        profileOutlet.tf1?.isUserInteractionEnabled = true
        profileOutlet.tf2?.isUserInteractionEnabled = true
        profileOutlet.tf3?.isUserInteractionEnabled = true
        profileOutlet.tf4?.isUserInteractionEnabled = true
        profileOutlet.tf5?.isUserInteractionEnabled = true
        profileOutlet.tf6?.isUserInteractionEnabled = true
        profileOutlet.tf7?.isUserInteractionEnabled = true
        profileOutlet.tf8?.isUserInteractionEnabled = true
        profileOutlet.tf9?.isUserInteractionEnabled = true
        
         profileOutlet.profileEditBtn?.setImage(UIImage.init(named: "mode_edit - material"), for: .normal)
    }
    
    
    @IBAction func profileCancelBtnPressed(_ sender: UIButton) {
        
        profileOutlet.profilCancelBtn?.isHidden = true
        profileOutlet.profileSaveBtn?.isHidden = true
        
        profileOutlet.tf1?.isUserInteractionEnabled = false
        profileOutlet.tf2?.isUserInteractionEnabled = false
        profileOutlet.tf3?.isUserInteractionEnabled = false
        profileOutlet.tf4?.isUserInteractionEnabled = false
        profileOutlet.tf5?.isUserInteractionEnabled = false
        profileOutlet.tf6?.isUserInteractionEnabled = false
        profileOutlet.tf7?.isUserInteractionEnabled = false
        profileOutlet.tf8?.isUserInteractionEnabled = false
        profileOutlet.tf9?.isUserInteractionEnabled = false
        
        profileOutlet.profileEditBtn?.imageView?.image = UIImage(named: "editbtn")

        
    }
    
    @IBAction func profileSaveBtnPressed(_ sender: UIButton) {
        
        profileOutlet.profilCancelBtn?.isHidden = true
        profileOutlet.profileSaveBtn?.isHidden = true
        profileOutlet.tf1?.isUserInteractionEnabled = false
        profileOutlet.tf2?.isUserInteractionEnabled = false
        profileOutlet.tf3?.isUserInteractionEnabled = false
        profileOutlet.tf4?.isUserInteractionEnabled = false
        profileOutlet.tf5?.isUserInteractionEnabled = false
        profileOutlet.tf6?.isUserInteractionEnabled = false
        profileOutlet.tf7?.isUserInteractionEnabled = false
        profileOutlet.tf8?.isUserInteractionEnabled = false
        profileOutlet.tf9?.isUserInteractionEnabled = false
        profileOutlet.profileEditBtn?.imageView?.image = UIImage(named: "editbtn")
        let profileData1 = profileOutlet.tf1?.text
        let profileData2 = profileOutlet.tf2?.text
        let profileData3 = profileOutlet.tf3?.text
        let profileData4 = profileOutlet.tf4?.text
        let profileData5 = profileOutlet.tf5?.text
        let profileData6 = profileOutlet.tf6?.text
        let profileData7 = profileOutlet.tf7?.text
        let profileData8 = profileOutlet.tf8?.text
        let profileData9 = profileOutlet.tf9?.text
        let profileeObj = profileDataModel(diplomaVar: profileData1!,degreeVar: profileData2!,disciplineVar: profileData3!,yop: profileData4!,aggregateVar: profileData5!,finalyearPercentagevar: profileData6!,trainingInstVar: profileData7!,trainingDurationVar: profileData8!,trainingVar: profileData9!)
        profileViewModelVar.sendUpdatedProfileDataToController(profileData: profileeObj)

    }
    
    
    //  **************Tracking buttons******************
     // MARK:trackingBtns
    
    @IBAction func editButton(_ sender: Any) {
        trackingOutlet.tf1?.isUserInteractionEnabled = true
        trackingOutlet.tf2?.isUserInteractionEnabled = true
        trackingOutlet.tf3?.isUserInteractionEnabled = true
        trackingOutlet.tf4?.isUserInteractionEnabled = true
        trackingOutlet.tf5?.isUserInteractionEnabled = true
        trackingOutlet.trackingCancelBtn?.isHidden = false
        trackingOutlet.trackingsaveBtn?.isHidden = false
        trackingOutlet.trackingEditBtn?.setImage(UIImage.init(named: "mode_edit - material"), for: .normal)
    }
    
     @IBAction func trackingSveBtnPressed(_ sender: UIButton) {
        trackingOutlet.tf1?.isUserInteractionEnabled = false
        trackingOutlet.tf2?.isUserInteractionEnabled = false
        trackingOutlet.tf3?.isUserInteractionEnabled = false
        trackingOutlet.tf4?.isUserInteractionEnabled = false
        trackingOutlet.tf5?.isUserInteractionEnabled = false
        trackingOutlet.trackingsaveBtn?.isHidden = true
        trackingOutlet.trackingCancelBtn?.isHidden = true
        trackingOutlet.trackingEditBtn?.imageView?.image = UIImage(named: "editbtn")
        let trackingData1 = trackingOutlet.tf1?.text
        let trackingData2 = trackingOutlet.tf2?.text
        let trackingData3 = trackingOutlet.tf3?.text
        let trackingData4 = trackingOutlet.tf4?.text
        let trackingData5 = trackingOutlet.tf5?.text
        let trackingData6 = trackingOutlet.tf6?.text
        let trackingObj = trackingDataModel(blEndDate: trackingData1!,blStartDate: trackingData2!,curWeek: trackingData3!,numOfWeeks: trackingData4!,stack: trackingData5!,week1: trackingData6!)
        trackingViewModelObj.sendUpdatedTrackingDataToController(trackingData: trackingObj)
        
   
    }
    
    @IBAction func trackingCancelBtnPressed(_ sender: UIButton) {
        trackingOutlet.tf1?.isUserInteractionEnabled = false
        trackingOutlet.tf2?.isUserInteractionEnabled = false
        trackingOutlet.tf3?.isUserInteractionEnabled = false
        trackingOutlet.tf4?.isUserInteractionEnabled = false
        trackingOutlet.tf5?.isUserInteractionEnabled = false
        trackingOutlet.trackingsaveBtn?.isHidden = true
        trackingOutlet.trackingCancelBtn?.isHidden = true
        trackingOutlet.trackingEditBtn?.imageView?.image = UIImage(named: "editbtn")
    }
    
    //  ****************Hr data Buttons*******************
    
     // MARK:hrBtns
    @IBAction func hrEditBtnPressed(_ sender: UIButton) {
        
        hrDataOutlet.tf1?.isUserInteractionEnabled = true
        hrDataOutlet.tf2?.isUserInteractionEnabled = true
        hrDataOutlet.tf3?.isUserInteractionEnabled = true
        hrDataOutlet.tf4?.isUserInteractionEnabled = true
        hrDataOutlet.tf5?.isUserInteractionEnabled = true
        hrDataOutlet.tf6?.isUserInteractionEnabled = true
        hrDataOutlet.tf7?.isUserInteractionEnabled = true
        hrDataOutlet.tf8?.isUserInteractionEnabled = true
        hrDataOutlet.tf9?.isUserInteractionEnabled = true
        hrDataOutlet.tf10?.isUserInteractionEnabled = true
        hrDataOutlet.tf11?.isUserInteractionEnabled = true
        hrDataOutlet.tf12?.isUserInteractionEnabled = true
        hrDataOutlet.tf13?.isUserInteractionEnabled = true
        hrDataOutlet.tf14?.isUserInteractionEnabled = true
        hrDataOutlet.tf15?.isUserInteractionEnabled = true
        hrDataOutlet.tf16?.isUserInteractionEnabled = true
        hrDataOutlet.tf17?.isUserInteractionEnabled = true
        hrDataOutlet.tf18?.isUserInteractionEnabled = true
        hrDataOutlet.tf19?.isUserInteractionEnabled = true
        hrDataOutlet.tf20?.isUserInteractionEnabled = true
        hrDataOutlet.companyTextField?.isUserInteractionEnabled = true
        hrDataOutlet.employeeStatusTextField?.isUserInteractionEnabled = true
        hrDataOutlet.HrCancelBtn?.isHidden = false
        hrDataOutlet.HrSaveBtn?.isHidden = false
        hrDataOutlet.HrEditBtn?.setImage(UIImage.init(named: "mode_edit - material"), for: .normal)

    }

    
    @IBAction func hrSaveBtnPressed(_ sender: UIButton) {
        
        hrDataOutlet.tf1?.isUserInteractionEnabled = false
        hrDataOutlet.tf2?.isUserInteractionEnabled = false
        hrDataOutlet.tf3?.isUserInteractionEnabled = false
        hrDataOutlet.tf4?.isUserInteractionEnabled = false
        hrDataOutlet.tf5?.isUserInteractionEnabled = false
        hrDataOutlet.tf6?.isUserInteractionEnabled = false
        hrDataOutlet.tf7?.isUserInteractionEnabled = false
        hrDataOutlet.tf8?.isUserInteractionEnabled = false
        hrDataOutlet.tf9?.isUserInteractionEnabled = false
        hrDataOutlet.tf10?.isUserInteractionEnabled = false
        hrDataOutlet.tf11?.isUserInteractionEnabled = false
        hrDataOutlet.tf12?.isUserInteractionEnabled = false
        hrDataOutlet.tf13?.isUserInteractionEnabled = false
        hrDataOutlet.tf14?.isUserInteractionEnabled = false
        hrDataOutlet.tf15?.isUserInteractionEnabled = false
        hrDataOutlet.tf16?.isUserInteractionEnabled = false
        hrDataOutlet.tf17?.isUserInteractionEnabled = false
        hrDataOutlet.tf18?.isUserInteractionEnabled = false
        hrDataOutlet.tf19?.isUserInteractionEnabled = false
        hrDataOutlet.tf20?.isUserInteractionEnabled = false
        hrDataOutlet.HrCancelBtn?.isHidden = true
        hrDataOutlet.HrSaveBtn?.isHidden = true
        hrDataOutlet.HrEditBtn?.imageView?.image = UIImage(named: "editbtn")
        let hrData1 = hrDataOutlet.tf1?.text
        let hrData2 = hrDataOutlet.tf2?.text
        let hrData3 = hrDataOutlet.tf3?.text
        let hrData4 = hrDataOutlet.tf4?.text
        let hrData5 = hrDataOutlet.tf5?.text
        let hrData6 = hrDataOutlet.tf6?.text
        let hrData7 = hrDataOutlet.tf7?.text
        let hrData8 = hrDataOutlet.tf8?.text
        let hrData9 = hrDataOutlet.tf9?.text
        let hrData10 = hrDataOutlet.tf10?.text
        let hrData11 = hrDataOutlet.tf11?.text
        let companyVal = hrDataOutlet.companyTextField?.text
        let status = hrDataOutlet.employeeStatusTextField?.text
        let hrData12 = hrDataOutlet.tf12?.text
        let hrData13 = hrDataOutlet.tf13?.text
        let hrObj = hrDataModel(startDate: hrData3!,contractInitiated: hrData8!,contractSigned: hrData9!,company:companyVal!,companyJoinDate: hrData4!,companyLeaveDate: hrData5!,contractSignDate: hrData10!,employeeStatus:status!,enggContractInitiated: hrData7!,enggContractSigned: hrData6!,fellowshipPeriod: hrData2!,hiringCity: hrData1!,initiateTransfer: hrData11!)
        
        hrDataViewModelVar.sendUpdatedHrDataToController(hrData: hrObj)

        
        

    }
    
    
    @IBAction func hrCancelBtnPressed(_ sender: UIButton) {
        
        hrDataOutlet.tf1?.isUserInteractionEnabled = false
        hrDataOutlet.tf2?.isUserInteractionEnabled = false
        hrDataOutlet.tf3?.isUserInteractionEnabled = false
        hrDataOutlet.tf4?.isUserInteractionEnabled = false
        hrDataOutlet.tf5?.isUserInteractionEnabled = false
        hrDataOutlet.tf6?.isUserInteractionEnabled = false
        hrDataOutlet.tf7?.isUserInteractionEnabled = false
        hrDataOutlet.tf8?.isUserInteractionEnabled = false
        hrDataOutlet.tf9?.isUserInteractionEnabled = false
        hrDataOutlet.tf10?.isUserInteractionEnabled = false
        hrDataOutlet.tf11?.isUserInteractionEnabled = false
        hrDataOutlet.tf12?.isUserInteractionEnabled = false
        hrDataOutlet.tf13?.isUserInteractionEnabled = false
        hrDataOutlet.tf14?.isUserInteractionEnabled = false
        hrDataOutlet.tf15?.isUserInteractionEnabled = false
        hrDataOutlet.tf16?.isUserInteractionEnabled = false
        hrDataOutlet.tf17?.isUserInteractionEnabled = false
        hrDataOutlet.tf18?.isUserInteractionEnabled = false
        hrDataOutlet.tf19?.isUserInteractionEnabled = false
        hrDataOutlet.tf20?.isUserInteractionEnabled = false
        
        hrDataOutlet.HrCancelBtn?.isHidden = true
        hrDataOutlet.HrSaveBtn?.isHidden = true
        
        hrDataOutlet.HrEditBtn?.imageView?.image = UIImage(named: "editbtn")

    }
    
    // MARK:attendanceBtns
       @IBAction func AttendanceEditBtn(_ sender: UIButton) {
        attendanceOutlet.attendanceEditBtn?.setImage(UIImage.init(named: "mode_edit - material"), for: .normal)
        flag = true
        attendanceOutlet.attendanceCancelBtn?.isHidden = false
        attendanceOutlet.attendanceSaveBtn?.isHidden = false
        }
    
    @IBAction func attendanceMarkOkBtn(_ sender: UIButton) {
        inOutTimeView.isHidden = true
        inTime = attendanceOutlet.inTextField?.text
        outTime = attendanceOutlet.outTextField?.text
    }
    
    
    
    @IBAction func AttendanceSaveBtnPressed(_ sender: UIButton) {
        attendanceOutlet.attendanceCancelBtn?.isHidden = true
        attendanceOutlet.attendanceSaveBtn?.isHidden = true
        attendanceOutlet.attendanceEditBtn?.imageView?.image = UIImage(named: "editbtn")
        customPicker.isUserInteractionEnabled = true
        self.attendanceViewModelObj.fetchMonthlyAttendanceFromController(timeStamp: self.timeStamp!)
        let status = String(describing:markedStatus)
        let timeStampString = String(describing: timestamp2!)
        print(timeStampString)
        print(selectedAttendance)
        print(status)
        print(inTime)
        print(outTime)
        print(reason)
        let attendanceObj = attendancePopUpModel(timeStampVar:timeStampString,enggId: "",attendanceStatusVar: selectedAttendance!,markedStatusVar: status,punchInVar: inTime!,punchOutVar: outTime!,reasonVar: reason!)
        attendanceViewModelObj.setUpdatedAttendanceToController(attendanceData: attendanceObj)
        
        
    }
    
    
    @IBAction func attendanceCancelBtnPressed(_ sender: UIButton) {
        
        attendanceOutlet.attendanceCancelBtn?.isHidden = true
        attendanceOutlet.attendanceSaveBtn?.isHidden = true
        customPicker.isUserInteractionEnabled = true
        attendanceOutlet.attendanceEditBtn?.imageView?.image = UIImage(named: "editbtn")
        attendanceCollectionView.isHidden = true
    }
    
    
    @IBAction func attendanceReasonOkBtn(_ sender: UIButton) {
        
        reasonView.isHidden = true
        reason = attendanceOutlet.reasonTextView?.text
    }
    

    
    public func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        
        
    }
    
    
     // MARK:settingValuesForViews
    
    func setBankData()
    {
        
        bankOutlet.tf1?.text = bankViewModelObj.bankvalues?.accNumber
        bankOutlet.tf2?.text = bankViewModelObj.bankvalues?.bankName
        bankOutlet.tf3?.text = bankViewModelObj.bankvalues?.bankIfscCode
        bankOutlet.tf4?.text = bankViewModelObj.bankvalues?.bankPan
        bankOutlet.tf5?.text = bankViewModelObj.bankvalues?.BankPaySalary
        bankOutlet.tf6?.text = bankViewModelObj.bankvalues?.reason
        
    }
    
    func setPersonalData()
    {
        personalOutlet.tf2?.text = personalViewModelVar.personalValues?.emailIdModel
        personalOutlet.tf3?.text = personalViewModelVar.personalValues?.mobileModel
        personalOutlet.tf4?.text = personalViewModelVar.personalValues?.dateOfBirthModel
        personalOutlet.tf5?.text = personalViewModelVar.personalValues?.fatherNameModel
        personalOutlet.tf6?.text = personalViewModelVar.personalValues?.fatherMobileModel
        personalOutlet.tf7?.text = personalViewModelVar.personalValues?.occupationModel
        personalOutlet.tf8?.text = personalViewModelVar.personalValues?.annualSalaryModel
        personalOutlet.tf9?.text = personalViewModelVar.personalValues?.mumbaiAddressModel
        personalOutlet.tf10?.text = personalViewModelVar.personalValues?.permenantAddress
        personalOutlet.nameTextField?.text = personalViewModelVar.personalValues?.employeeNameModel
        

    }
    
    func setProfileData() {
        profileOutlet.tf1?.text = profileViewModelVar.profileValues?.diploma
        profileOutlet.tf2?.text = profileViewModelVar.profileValues?.degree
        profileOutlet.tf3?.text = profileViewModelVar.profileValues?.discipline
        profileOutlet.tf4?.text = profileViewModelVar.profileValues?.yearOfPassing
        profileOutlet.tf5?.text = profileViewModelVar.profileValues?.aggregate
        profileOutlet.tf6?.text = profileViewModelVar.profileValues?.finalYearPercentage
        profileOutlet.tf7?.text = profileViewModelVar.profileValues?.trainingInstitute
        profileOutlet.tf8?.text = profileViewModelVar.profileValues?.trainingDuration
        profileOutlet.tf9?.text = profileViewModelVar.profileValues?.training
        
        //           trainingVal = (profileViewModelVar.profileValues?.training)!
        //
        //
        //            for i in 0..<trainingVal.count{
        //            let val = trainingVal[i]
        //            profileOutlet.tf9?.text?.append(val)
        //            profileOutlet.tf9?.text?.append(",")
        //
        //            }

    
    }
    
    func setTrackingData() {
        trackingOutlet.tf1?.text = trackingViewModelObj.trackingValues?.techStack
        trackingOutlet.tf2?.text = trackingViewModelObj.trackingValues?.startDate
        trackingOutlet.tf3?.text = trackingViewModelObj.trackingValues?.endDate
        trackingOutlet.tf4?.text = trackingViewModelObj.trackingValues?.currentWeek
        trackingOutlet.tf5?.text = trackingViewModelObj.trackingValues?.noOfWeeksLeft
        trackingOutlet.tf6?.text = trackingViewModelObj.trackingValues?.week
        //            trackingOutlet.tf6?.text = trackingViewModelObj.trackingValues?.techStack
    }
    
    func setEnggInfoData() {
        engineerInfoOutlet.tf2?.text = enggInfoObj.enggInfoValues?.empStatus
        engineerInfoOutlet.tf3?.text = enggInfoObj.enggInfoValues?.company
        engineerInfoOutlet.tf4?.text = enggInfoObj.enggInfoValues?.mobile
        engineerInfoOutlet.tf5?.text = enggInfoObj.enggInfoValues?.emailId
        engineerInfoOutlet.tf6?.text = enggInfoObj.enggInfoValues?.startDate
        engineerInfoOutlet.tf7?.text = enggInfoObj.enggInfoValues?.cmpJoinDate
        engineerInfoOutlet.tf8?.text = enggInfoObj.enggInfoValues?.cmpLeaveDate
        leavesTaken = enggInfoObj.enggInfoValues?.leaveTaken
        let leaveString = String(leavesTaken)
        engineerInfoOutlet.tf9?.text = leaveString
        employeeNameLabel.text = enggInfoObj.enggInfoValues?.empName
        //             myString = String(describing: leavesTaken!)
        //            engineerInfoOutlet.tf9!.text = myString

    }
    
    func sethrDataValues()
    {
        hrDataOutlet.tf1?.text = hrDataViewModelVar.hrValues?.hiringCityModel
        hrDataOutlet.tf3?.text = hrDataViewModelVar.hrValues?.startDateModel
        hrDataOutlet.tf2?.text = hrDataViewModelVar.hrValues?.fellowshipPeriodModel
        hrDataOutlet.tf4?.text = hrDataViewModelVar.hrValues?.companyJoinDateModel
        hrDataOutlet.tf5?.text = hrDataViewModelVar.hrValues?.companyLeaveDateModel
        hrDataOutlet.tf6?.text = hrDataViewModelVar.hrValues?.enggContractSignedModel
        hrDataOutlet.tf7?.text = hrDataViewModelVar.hrValues?.enggContractInitiatedModel
        hrDataOutlet.tf8?.text = hrDataViewModelVar.hrValues?.contractInitiatedModel
        hrDataOutlet.tf9?.text = hrDataViewModelVar.hrValues?.contractSignedModel
        hrDataOutlet.tf10?.text = hrDataViewModelVar.hrValues?.contractSignDateModel
        hrDataOutlet.tf11?.text = hrDataViewModelVar.hrValues?.initiateTransferModel
        hrDataOutlet.companyTextField?.text = hrDataViewModelVar.hrValues?.companyModel
        hrDataOutlet.employeeStatusTextField?.text = hrDataViewModelVar.hrValues?.employeeStatusModel
        }
    
    //************* ATTENDANCE MARK IMAGE COLLECTION VIEW ***********************
    
     func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        
        return 1
    }
    
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
     {
        
        return 4
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellItem", for: indexPath) as! attendanceCollectionViewCell
        
        if indexPath.row == 0 {
            cell.markImage.image = UIImage(named: "L")
            
        }
        if indexPath.row == 1 {
            cell.markImage.image = UIImage(named: "C")
            
        }

        if indexPath.row == 2 {
            cell.markImage.image = UIImage(named: "ion-checkmark-round - Ionicons")
            
        }

        if indexPath.row == 3 {
            cell.markImage.image = UIImage(named: "ion-alert - Ionicons")
            
        }

        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        attendanceCollectionView.isHidden = true
        attendanceOutlet.attendanceCancelBtn?.isHidden = false
        attendanceOutlet.attendanceSaveBtn?.isHidden = false
        markedStatus = true
        if indexPath.row == 0 {
            blurView.isHidden = true
            reasonView.isHidden = false
            attendanceOutlet.reasonTextView?.layer.borderColor = UIColor.gray.cgColor
            attendanceOutlet.reasonTextView?.layer.borderWidth = 1
            attendanceOutlet.reasonTextView?.layer.cornerRadius = 8
            attendanceOutlet.reasonViewDate?.text = date1
            reasonView.layer.cornerRadius = 8
            reasonView.layer.borderColor = UIColor.gray.cgColor
            reasonView.layer.borderWidth = 0.2
            reasonView.layer.shadowColor = UIColor.black.cgColor
            reasonView.layer.shadowOffset = CGSize(width:0.0,height: 4.0)
            reasonView.layer.shadowRadius = 2.0
            reasonView.layer.shadowOpacity = 0.6
            cellImage = UIImage(named: "L")
            reasonView.superview?.bringSubview(toFront: reasonView)
            check0 = true
            selectedAttendance = "Leave"
            reason = "NA"
            inTime = "NA"
            outTime = "NA"
            
        }
        
        if indexPath.row == 1 {
            blurView.isHidden = true
            check1 = true
            cellImage = UIImage(named: "C")
            selectedAttendance = "CompLeave"
            reason = "NA"
            inTime = "NA"
            outTime = "NA"
            }
        
        if indexPath.row == 2 {
            blurView.isHidden = true
            check2 = true
            inOutTimeView.isHidden = false
            attendanceOutlet.inOutVIewDate?.text = date1
            print("**********************",date1)
            inOutTimeView.layer.cornerRadius = 8
            inOutTimeView.layer.borderColor = UIColor.gray.cgColor
            inOutTimeView.layer.borderWidth = 0.2
            inOutTimeView.layer.shadowColor = UIColor.black.cgColor
            inOutTimeView.layer.shadowOffset = CGSize(width:0.0,height: 4.0)
            inOutTimeView.layer.shadowRadius = 2.0
            inOutTimeView.layer.shadowOpacity = 0.6
            inOutTimeView.superview?.bringSubview(toFront: inOutTimeView)
            cellImage = UIImage(named: "ion-checkmark-round - Ionicons")
            selectedAttendance = "Present"
            reason = "NA"
        }
        
        if indexPath.row == 3 {
            blurView.isHidden = true
            check3 = true
            cellImage = UIImage(named: "ion-alert - Ionicons")
            selectedAttendance = "Unmarked"
            reason = "NA"
            inTime = "NA"
            outTime = "NA"
            markedStatus = false
        }
        
        
    }
    
    
       func calendarReload(keysArr:[String],valArray:[attendanceModel])
    {
        self.attendanceKeys = keysArr
        self.attendanceValues = valArray
        print("******************",attendanceKeys!)
        print("&&&&&&&&&&&&&&&&&&",attendanceValues!)
        calenderView.reloadData()
    }
    
    
}

// *********** EXTENSION FOR JTAPPLECALENDAR *****************

extension ViewController : JTAppleCalendarViewDataSource
{
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MMMMyyyy")
        
        var startDate = Date()//formatter.date(from: "2016 01 01")! // You can use date generated from a formatter
        if dateChange {
            let date = strMonth!+" "+strYear!
            startDate = formatter.date(from: date)!
        }

        let endDate = formatter.date(from: "December 2037")!  // You can also use dates created from this function
        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate,
                                                 numberOfRows: 6, // Only 1, 2, 3, & 6 are allowed
            calendar: Calendar.current,
            generateInDates: .forAllMonths,
            generateOutDates: .tillEndOfGrid,
            firstDayOfWeek: .sunday)
        return parameters
    }
}
extension ViewController : JTAppleCalendarViewDelegate
{
    func calendar(_ calendar: JTAppleCalendarView, willDisplayCell cell: JTAppleDayCellView, date: Date, cellState: CellState) {
         myCustomCell = cell as! CellView
       
        myCustomCell.layer.borderWidth = 0.6
        myCustomCell.layer.borderColor = UIColor.lightGray.cgColor

        myCustomCell.dayLabel.text = cellState.text
        
        if cellState.dateBelongsTo == .thisMonth
        {
            myCustomCell.markImageView.isHidden = false
            valueSet = false
            myCustomCell.dayLabel.textColor =  UIColor(colorWithHexValue: 0x6FB8D9)
            
            if first == true {
            let dateObj = DateFormatter()
            dateObj.dateFormat = "d"
            let dateString = dateObj.string(from: cellState.date)
                print(attendanceKeys?.count)
                if (attendanceKeys?.count)! != 0{
                for i in 0..<attendanceKeys!.count{
                let key = attendanceKeys?[i]
                if dateString == key {
                let value = attendanceValues?[i]
                    if value?.attendanceStatus == "Leave" && value?.markedStatus == "true"
                    {
                        myCustomCell.markImageView.image = UIImage(named: "L")
                        self.valueSet = true
                        
                     }
                    else if value?.attendanceStatus == "Present" && value?.markedStatus == "true"
                    {
                        
                        myCustomCell.markImageView.image = UIImage(named: "ion-checkmark-round - Ionicons")
                        self.valueSet = true
                    }
                    
                    else if value?.attendanceStatus == "CompLeave" && value?.markedStatus == "true"
                    {
                        
                        myCustomCell.markImageView.image = UIImage(named: "C")
                        self.valueSet = true
                    }
                        
                    else if value?.attendanceStatus == "Unmarked" && value?.markedStatus == "false"
                    {
                        
                        myCustomCell.markImageView.image = UIImage(named: "ion-alert - Ionicons")
                        self.valueSet = true
                    }

            
                }
            
                }
                
                
                if valueSet == false
                {
                    myCustomCell.markImageView.isHidden = true

                }
                }
          else
                {
                    myCustomCell.markImageView.isHidden = true
                    
                }
            }
            
        }
        else{
            myCustomCell.dayLabel.textColor = UIColor(colorWithHexValue: 0xA9A9A9)
            myCustomCell.markImageView.isHidden = true
        }
        
        if cellState.isSelected {
            
            if check0 == true {
                myCustomCell.markImageView.image = cellImage
            
            }
            
            else if check1 == true {
                myCustomCell.markImageView.image = cellImage
            }
            
            else if check2 == true{
                
                 myCustomCell.markImageView.image = cellImage
            }
            
            else if check3 == true {
                myCustomCell.markImageView.image = cellImage
                
            }
          
        }

    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleDayCellView?, cellState: CellState) {
        var i:Int!
        customPicker.isUserInteractionEnabled = false
        if flag == false {
            self.blurView.isHidden = false
            self.attendancePopupOutlet.isHidden = false
            attendancePopupOutlet.layer.cornerRadius = 8
            let formatter = DateFormatter()
            formatter.setLocalizedDateFormatFromTemplate("dd MMMM yyyy")
            date1 = formatter.string(from: cellState.date)
            let dateObj2 = DateFormatter()
            dateObj2.dateFormat = "d"
           let theDate = dateObj2.string(from: cellState.date)

            for i in 0..<attendanceKeys!.count{
                if theDate == attendanceKeys?[i] {
                    let values = attendanceValues?[i]
                    attendancePopupOutlet.inTimeLabel.text = values?.punchIn
                    attendancePopupOutlet.outTimeLabel.text = values?.punchOut
                    attendancePopupOutlet.leaveReasonTextView.text = values?.reason
                    attendancePopupOutlet.markedStatusLabel.text = values?.markedStatus
                  attendancePopupOutlet.attendanceStatusLabel.text = values?.attendanceStatus
                    
                }
            
            }
            attendancePopupOutlet.dateLabel.text = date1
            attendancePopupOutlet.isUserInteractionEnabled = false
            view.isUserInteractionEnabled = true
            self.addGestureRecogniser()
            customPicker.isUserInteractionEnabled = true
//            selectedRow = cellState.row()
//            selectedCol = cellState.column()
            check0 = false
            check1 = false
            check2 = false
            check3 = false
//                        print("************************",selectedRow)
//                print("************************",selectedCol)
//            
        }
        
        else
        {
            let formatter = DateFormatter()
            formatter.setLocalizedDateFormatFromTemplate("dd MMMM yyyy")
            date1 = formatter.string(from: cellState.date)
            print("*******************",date1)
            attendanceCollectionView.isHidden = false
            blurView.isHidden = false
            flag = false
            check0 = false
            check1 = false
            check2 = false
            check3 = false
            let formatter2 = DateFormatter()
            formatter2.setLocalizedDateFormatFromTemplate("dd MMMM yyyy")
            let date2 = formatter2.date(from: date1!)
            timestamp2 = (date2?.timeIntervalSince1970)! * 1000
//             self.attendanceViewModelObj.fetchMonthlyAttendanceFromController(timeStamp: timestamp2)

        }
        
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willResetCell cell: JTAppleDayCellView) {
        
        
    }
    
    }


// ***************FUNCTION  TO CONVERT HEXADECIMAL COLOR CODE TO COLOR NAME *********
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}



// *********** POPULATING PICKER VIEW *****************

extension ViewController : UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 12
        }
        
        if component == 1 {
            return 22
        }
        
        return 0
    }
}
extension ViewController : UIPickerViewDelegate
{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            let nameOfMonth:String = monthArray.object(at: row) as! String
            return nameOfMonth
        }
        
        if component == 1 {
            let year = yearArray.object(at: row) as! String
            return year
        }
        return "null"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let when = DispatchTime.now() + 8 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.strMonth = self.monthArray[pickerView.selectedRow(inComponent: 0)] as! String
            self.strYear = self.yearArray[pickerView.selectedRow(inComponent: 1)] as! String
            
            let formatter = DateFormatter()
            formatter.setLocalizedDateFormatFromTemplate("MMMMyyyy")
            let selectedDate = self.strMonth!+" "+self.strYear!
            let myDate = formatter.date(from: selectedDate)
            print(myDate!)
             self.timeStamp = myDate!.timeIntervalSince1970 * 1000
            print("**********timestamp is",self.timeStamp!)
            self.attendanceViewModelObj.fetchMonthlyAttendanceFromController(timeStamp: self.timeStamp!)
        
        self.first = true
        self.dateChange = true
        }
        
    }
}


extension UIColor {
    convenience init(colorWithHexValue value: Int, alpha:CGFloat = 1.0){
        self.init(
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}






