//
//  ViewController.swift
//  Fundo

//  purpose:
//  1.Displaying employee details i.e personal details,profile details,monthly attenance,tracking data,bank details and HR details
//  2.Making get and Post calls to fetch and post the employee data

//  Created by BridgeLabz Solution LLP on 06/12/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//


import UIKit
import JTAppleCalendar
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,bankviewProtocol,personalviewProtocal,profileViewProtocal,trackingViewProtocol,enggInfoViewProtocol,hrviewProtocal,attendanceViewProtocol{
    
    // outlet of employee name label
    @IBOutlet weak var employeeNameLabel: UILabel!
    
    // outlet of inout time view
    @IBOutlet weak var inOutTimeView: UIView!
    
    // outlet of reason view
    @IBOutlet weak var reasonView: UIView!
    
    // outlet of attendance collection view
    @IBOutlet weak var attendanceCollectionView: UICollectionView!
    
    //outlet of attendance popup view
    @IBOutlet weak var attendancePopupOutlet: AttendancePopUp!
    
    // outlet of blur view
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    // outlet of table view
    @IBOutlet var tableView:UITableView?
    
    // outlet of tracking view
    @IBOutlet weak var trackingOutlet: trackingView!
    
    // outlet of container view height
    @IBOutlet weak var containerHeight: NSLayoutConstraint!
    
    // outlet of profile view
    @IBOutlet weak var profileOutlet: profileView!
    
    // outlet of container view
    @IBOutlet weak var containerView: UIView!
    
    // outlet of scroll view
    @IBOutlet weak var scrollView: UIScrollView!
    
    // outlet of calender view
    @IBOutlet weak var calenderView: JTAppleCalendarView!
    
    // outlet of picker view
    @IBOutlet weak var customPicker: UIPickerView!
    
    // outlet of header view height
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    
    // outlet of bank view
    @IBOutlet weak var bankOutlet: bankView!
    
    // outlet of hr data view
    @IBOutlet weak var hrDataOutlet: HRDataView!
    
    // outlet of engineer info view
    @IBOutlet weak var engineerInfoOutlet: engineerInfoView!
    
    // outlet of personal view
    @IBOutlet weak var personalOutlet: personalView!
    
    // outlet of attendance view
    @IBOutlet weak var attendanceOutlet: attendanceView!
    
    // create object of hr data viewModel
    var mHrDataViewModelVar = hrDataViewModel()
    
    // create object of personal viewModel
    var mPersonalViewModelVar = personalViewModel()
    
    // create object of profile data viewModel
    var mProfileViewModelVar = profileDataViewModel()
    
    // create object of bank viewModel
    var mBankViewModelObj = bankViewModel()
    
    // create object of tracking data viewModel
    var mTrackingViewModelObj = trackingDataViewModel()
    
    // create object of engineer info viewModel
    var mEnggInfoObj = enggInfoViewModel()
    
    // create object of attendance viewModel
    var mAttendanceViewModelObj = attendanceViewModel()
    
    // variable to store index
    var mIndex:Int?
    
    // variable of type cgLayer
    var mLayer:CGLayer?
    var mAtt:attendanceView?
    
    // boolean variables
    var mDateChange:Bool = false
    var mCheck0:Bool? = false
    var mCheck1:Bool = false
    var mCheck2:Bool = false
    var mCheck3:Bool = false
    var mFlag:Bool = false
    var mValueSet:Bool = false
    var mFirst:Bool = false
    var mMarkedStatus:Bool = false
    var mDidSelectDate:Bool = false
    var mdateFound :Bool = false
    
    // variable to store date string
    var mStrDate:String?
    
    // variable to store month string
    var mStrMonth:String?
    
    // variable to store year string
    var mStrYear:String?
    
    // variable of type tap gesture recognizer
    var mTapGesture:UITapGestureRecognizer?
    
    // variable of type cell view
    var mMyCustomCell:CellView!
    
    // variable to store selected row
    var mSelectedRow:Int!
    
    // variable to store image
    var mCellImage:UIImage?
    
    // variable to store selected coloumn
    var mSelectedCol:Int!
    
    // variable to store date
    var mDate1:String?
    
    // variable to store leaves taken
    var mLeavesTaken:Int!
    
    // variable to store string
    var mMyString:String!
    
    // variable to store array of strings
    var mAttendanceKeys:[String]?
    
    // variable to store array of type attendance model
    var mAttendanceValues:[attendanceModel]?
    
    // variable to hold image
    var mSelectedImage:UIImage?
    
    // variable to store time stamp
    var mTimeStamp:Double?
    
    // variable to store selected attendance
    var mSelectedAttendance:String?
    
    // variable to store in time
    var mInTime:String?
    
    // variable to store out time
    var mOutTime:String?
    
    //  variable to store reason
    var mReason:String?
    
    // variable to store timestamp
    var mTimestamp2:Double!
    
    // variable to store date
    var mDateObj:Date?
    
    // variable to store timestamp
    var mCurrentTimeStamp:Double!
    
    let mMenuOptions : [String] = ["Attendance Details","Personal Details","Profile Details","HR Details","Bank Details","Tracking Details"]
    var mMonthArray:NSMutableArray = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    var mYearArray:NSMutableArray = ["2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023", "2024", "2025", "2026", "2027", "2028", "2029", "2030", "2031", "2032", "2033", "2034", "2035", "2036", "2037"]

    override func viewDidLoad() {
            super.viewDidLoad()
            mEnggInfoObj.fetchDataFromController()
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
            
            for var i in 0..<mMonthArray.count {
                if mMonthArray.object(at: i)as! String == currentMonth {
                    customPicker.selectRow(i, inComponent: 0, animated: true)
                    break
                }
            }
            for var j in 0..<mYearArray.count {
                if mYearArray.object(at: j) as! String == currentYear {
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
            mBankViewModelObj.viewControllerProc = self
            mHrDataViewModelVar.hrViewObj = self
            mPersonalViewModelVar.personalProtocal = self
            mProfileViewModelVar.profileViewProc = self
            mTrackingViewModelObj.trackingViewProc = self
            mEnggInfoObj.enggViewProc = self
            mAttendanceViewModelObj.attendanceViewProc = self
            let dateFormatterObj = DateFormatter()
            dateFormatterObj.setLocalizedDateFormatFromTemplate("MMMMyyyy")
            let currentDate = dateFormatterObj.string(from: Date())
            let date = dateFormatterObj.date(from: currentDate)
            mCurrentTimeStamp = (date?.timeIntervalSince1970)! * 1000
    }
    
    
    // function to perform segue to dashboard view controller
    @IBAction func backButton(_ sender: UIButton) {
      let segue = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "reveal")
        self.present(segue, animated: false, completion: nil)
    }
    
    
    // ADDING GESTURE RECOGNIZER TO THE BLUR VIEW
    func addGestureRecogniser()
    {
         mTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.hidePopUp(sender:)))
        self.blurView.addGestureRecognizer(mTapGesture!)
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
    
    
    // populating table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return mMenuOptions.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "thiscell")

        cell.textLabel!.text = mMenuOptions [indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont(name: "AppleGothic",
                                 size: 18)
        let color = UIColor(hexString: "#3B5372")
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
        mIndex = indexPath.row
        self.addSubView(selectedIndex: mIndex!)
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
         attendanceOutlet.attendanceActivityIndicator?.isHidden = false
         attendanceOutlet.attendanceActivityIndicator?.startAnimating()
         containerHeight.constant = 1100
         mFirst = true
         mAttendanceViewModelObj.fetchMonthlyAttendanceFromController(timeStamp: mCurrentTimeStamp)
          scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1000)
          attendanceOutlet.superview?.bringSubview(toFront: attendanceOutlet)
         self.hideViews(value1: true, value2: false, value3: true, value4: true, value5: true, value6: true, value7: true)
          self.view.layoutIfNeeded()
            break
            
            
        case 1:
            personalOutlet.personalActivityIndicator?.isHidden = false
            personalOutlet.personalActivityIndicator?.startAnimating()
            mPersonalViewModelVar.fetchPersonalDataFromController()
            containerHeight.constant = 1000
            self.hideViews(value1: true, value2: true, value3: false, value4: true, value5: true, value6: true, value7: true)
            scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1000)
            personalOutlet.superview?.bringSubview(toFront: personalOutlet)
            self.view.layoutIfNeeded()

            break
            
        case 2:
            profileOutlet.profileActivityIndicator?.isHidden = false
            profileOutlet.profileActivityIndicator?.startAnimating()
            mProfileViewModelVar.fetchProfileDataFromController()
            containerHeight.constant = 1000
            scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1000)
            self.hideViews(value1: true, value2: true, value3: true, value4: false, value5: true, value6: true, value7: true)
            profileOutlet.superview?.bringSubview(toFront: profileOutlet)
            self.view.layoutIfNeeded()
            break
            
        case 3:
            hrDataOutlet.hrActivityIndicator?.isHidden = false
            hrDataOutlet.hrActivityIndicator?.startAnimating()
            mHrDataViewModelVar.fetchHrDataFromController()
            containerHeight.constant = 1500
            scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1600)
            self.hideViews(value1: true, value2: true, value3: true, value4: true, value5: false, value6: true, value7: true)
            hrDataOutlet.superview?.bringSubview(toFront: hrDataOutlet)
            self.view.layoutIfNeeded()
            break
            
        case 4:
            bankOutlet.bankActivityIndicator?.isHidden = false
            bankOutlet.bankActivityIndicator?.startAnimating()
            mBankViewModelObj.fetchDataFromController()
            containerHeight.constant = 1000
            scrollView.contentSize = CGSize(width: self.view.frame.width, height: 700)
            self.hideViews(value1: true, value2: true, value3: true, value4: true, value5: true, value6: true, value7: false)
            bankOutlet.superview?.bringSubview(toFront: bankOutlet)
            self.view.layoutIfNeeded()
            break
            
        case 5:
            trackingOutlet.trakingActivityIndicator?.isHidden = false
            trackingOutlet.trakingActivityIndicator?.startAnimating()
            mTrackingViewModelObj.fetchTrackingDataFromController()
            containerHeight.constant = 1000
            scrollView.contentSize = CGSize(width: self.view.frame.width, height: 700)
            self.hideViews(value1: true, value2: true, value3: true, value4: true, value5: true, value6: false, value7: true)
            trackingOutlet.superview?.bringSubview(toFront: trackingOutlet)
            self.view.layoutIfNeeded()
            break
            
            
        case 6:
            engineerInfoOutlet.engineerInfoActivityIndicator?.isHidden = false
            engineerInfoOutlet.engineerInfoActivityIndicator?.startAnimating()
            containerHeight.constant = 1000
            scrollView.contentSize = CGSize(width: self.view.frame.width, height: 700)
            self.hideViews(value1: false, value2: true, value3: true, value4: true, value5: true, value6: true, value7: true)
            engineerInfoOutlet.superview?.bringSubview(toFront: engineerInfoOutlet)
            self.view.layoutIfNeeded()
            break
        default:
            break
        }
        
    }

    
    // function to hide corresponding views
    func hideViews(value1:Bool,value2:Bool,value3:Bool,value4:Bool,value5:Bool,value6:Bool,value7:Bool)
    {
        engineerInfoOutlet.isHidden = value1
        attendanceOutlet.isHidden = value2
        personalOutlet.isHidden = value3
        profileOutlet.isHidden = value4
        hrDataOutlet.isHidden = value5
        trackingOutlet.isHidden = value6
        bankOutlet.isHidden = value7
    }
    
    
    
    // *******************Bank Buttons ***************************
     // MARK:bankBtns
    
    
    // function to perform action on click of bank edit button
    
    @IBAction func bankEditBtn(_ sender: Any) {
        self.handlingBankTextFields(value1: true, value2: true, value3: true, value4: true, value5: true, value6: true, value7: false, value8: false)
        bankOutlet.bankEditBtn?.setImage(UIImage.init(named: "mode_edit - material"), for: .normal)
    }

    // function to perform action on click of bank save button
    
    @IBAction func bankSaveBtnPressed(_ sender: UIButton) {
       self.handlingBankTextFields(value1: false, value2: false, value3: false, value4: false, value5: false, value6: false, value7: true, value8: true)
        bankOutlet.bankEditBtn?.imageView?.image = UIImage(named: "editbtn")
       let bankString1 = bankOutlet.tf1?.text
       let bankString2 = bankOutlet.tf2?.text
       let bankString3 = bankOutlet.tf3?.text
       let bankString4 = bankOutlet.tf4?.text
       let bankString5 = bankOutlet.tf5?.text
       let bankString6 = bankOutlet.tf6?.text
       let bankObj = bankDataModel(accountNum: bankString1!,bankNAme: bankString2!,ifscCode: bankString3!,pan: bankString4!,paySalary: bankString5!,reasonVar: bankString6!)
        mBankViewModelObj.sendUpdatedBankDataToController(bankData: bankObj)
    }
    
    
    // function to perform action on click of bank cancel button
    
    @IBAction func BankCancelBtnPressed(_ sender: UIButton) {
        self.handlingBankTextFields(value1: false, value2: false, value3: false, value4: false, value5: false, value6: false, value7: true, value8: true)
        bankOutlet.bankEditBtn?.imageView?.image = UIImage(named: "editbtn")
    }
    
    
    // function to enable and disable bank text fields
    
    func handlingBankTextFields(value1:Bool,value2:Bool,value3:Bool,value4:Bool,value5:Bool,value6:Bool,value7:Bool,value8:Bool)
    {
        bankOutlet.tf1?.isUserInteractionEnabled = value1
        bankOutlet.tf2?.isUserInteractionEnabled = value2
        bankOutlet.tf3?.isUserInteractionEnabled = value3
        bankOutlet.tf4?.isUserInteractionEnabled = value4
        bankOutlet.tf5?.isUserInteractionEnabled = value5
        bankOutlet.tf6?.isUserInteractionEnabled = value6
        bankOutlet.bankCancelBtn?.isHidden = value7
        bankOutlet.bankSaveBtn?.isHidden = value8
        
    }
    
      // *******************personal Buttons ***************************
     // MARK:personalbtns
    
    
    // function to perform action on click of personal save button
    @IBAction func personalSaveButtonPressed(_ sender: UIButton) {
        self.handlingPersonalTextFields(value1: true, value2: true, value3: false, value4: false, value5: false, value6: false, value7: false, value8: false, value9: false, value10: false, value11: false, value12: false)
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
        mPersonalViewModelVar.sendUpdatedPersonalDataToController(personalData: personalObj)
    }
    
    
    // function to perform action on click of personal edit button
    @IBAction func personalEditBtn(_ sender: UIButton) {
        self.handlingPersonalTextFields(value1: false, value2: false, value3: true, value4: true, value5: true, value6: true, value7: true, value8: true, value9: true, value10: true, value11: true, value12: true)
        personalOutlet.personalEditBtn?.setImage(UIImage.init(named: "mode_edit - material"), for: .normal)
    }
    
    
    // function to perform action on click of personal cancel button
    @IBAction func personalCancelButnPressed(_ sender: UIButton) {
        self.handlingPersonalTextFields(value1: true, value2: true, value3: false, value4: false, value5: false, value6: false, value7: false, value8: false, value9: false, value10: false, value11: false, value12: false)
        personalOutlet.personalEditBtn?.imageView?.image = UIImage(named: "editbtn")
    }
    
    
    // function to enable and disable personal text fields
    func handlingPersonalTextFields(value1:Bool,value2:Bool,value3:Bool,value4:Bool,value5:Bool,value6:Bool,value7:Bool,value8:Bool,value9:Bool,value10:Bool,value11:Bool,value12:Bool)
    {
        personalOutlet.personalSaveBtn?.isHidden = value1
        personalOutlet.personalCancelBtn?.isHidden = value2
        personalOutlet.tf1?.isUserInteractionEnabled = value3
        personalOutlet.tf2?.isUserInteractionEnabled = value4
        personalOutlet.tf3?.isUserInteractionEnabled = value5
        personalOutlet.tf4?.isUserInteractionEnabled = value6
        personalOutlet.tf5?.isUserInteractionEnabled = value7
        personalOutlet.tf6?.isUserInteractionEnabled = value8
        personalOutlet.tf7?.isUserInteractionEnabled = value9
        personalOutlet.tf8?.isUserInteractionEnabled = value10
        personalOutlet.tf9?.isUserInteractionEnabled = value11
        personalOutlet.tf10?.isUserInteractionEnabled = value12
        
    }
    
    
    // *******************profile Buttons ***************************
     // MARK:profileBtns
    
    
    // function to perform action on click of profile edit button
    @IBAction func profileEditBtnPressed(_ sender: UIButton) {
        self.handlingProfileTextFields(value1: false, value2: false, value3: true
            , value4: true, value5: true, value6: true, value7: true, value8: true, value9: true, value10: true, value11: true)
        profileOutlet.profileEditBtn?.setImage(UIImage.init(named: "mode_edit - material"), for: .normal)
    }
    
    
    
    // function to perform action on click of profile cancel button
    @IBAction func profileCancelBtnPressed(_ sender: UIButton) {
        self.handlingProfileTextFields(value1: true, value2: true, value3: false
            , value4: false, value5: false, value6: false, value7: false, value8: false, value9: false, value10: false, value11: false)
        profileOutlet.profileEditBtn?.imageView?.image = UIImage(named: "editbtn")
    }
    
    
    // function to perform action on click of profile save button
    @IBAction func profileSaveBtnPressed(_ sender: UIButton) {
        self.handlingProfileTextFields(value1: true, value2: true, value3: false
            , value4: false, value5: false, value6: false, value7: false, value8: false, value9: false, value10: false, value11: false)
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
        mProfileViewModelVar.sendUpdatedProfileDataToController(profileData: profileeObj)
    }
    
    
    // function to enable and disable profile text fields
    func handlingProfileTextFields(value1:Bool,value2:Bool,value3:Bool,value4:Bool,value5:Bool,value6:Bool,value7:Bool,value8:Bool,value9:Bool,value10:Bool,value11:Bool)
    {
        profileOutlet.profilCancelBtn?.isHidden = value1
        profileOutlet.profileSaveBtn?.isHidden = value2
        profileOutlet.tf1?.isUserInteractionEnabled = value3
        profileOutlet.tf2?.isUserInteractionEnabled = value4
        profileOutlet.tf3?.isUserInteractionEnabled = value5
        profileOutlet.tf4?.isUserInteractionEnabled = value6
        profileOutlet.tf5?.isUserInteractionEnabled = value7
        profileOutlet.tf6?.isUserInteractionEnabled = value8
        profileOutlet.tf7?.isUserInteractionEnabled = value9
        profileOutlet.tf8?.isUserInteractionEnabled = value10
        profileOutlet.tf9?.isUserInteractionEnabled = value11
        
    }
    
    //  **************Tracking buttons******************
     // MARK:trackingBtns
    
    // function to perform action on click of tracking edit button
    @IBAction func editButton(_ sender: Any) {
        self.handlingTrackingTextFields(value1: true, value2: true, value3: true, value4: true, value5: true, value6: false, value7: false)
        trackingOutlet.trackingEditBtn?.setImage(UIImage.init(named: "mode_edit - material"), for: .normal)
    }
    
    // function to perform action on click of tracking edit button
     @IBAction func trackingSveBtnPressed(_ sender: UIButton) {
        self.handlingTrackingTextFields(value1: false, value2: false, value3: false, value4: false, value5: false, value6: true, value7: true)
        trackingOutlet.trackingEditBtn?.imageView?.image = UIImage(named: "editbtn")
        let trackingData1 = trackingOutlet.tf1?.text
        let trackingData2 = trackingOutlet.tf2?.text
        let trackingData3 = trackingOutlet.tf3?.text
        let trackingData4 = trackingOutlet.tf4?.text
        let trackingData5 = trackingOutlet.tf5?.text
        let trackingData6 = trackingOutlet.tf6?.text
        let trackingObj = trackingDataModel(blEndDate: trackingData3!,blStartDate: trackingData2!,curWeek: trackingData4!,numOfWeeks: trackingData5!,stack: trackingData1!,week1: trackingData6!)
        mTrackingViewModelObj.sendUpdatedTrackingDataToController(trackingData: trackingObj)
    }
    
    
    // function to perform action on click of tracking cancel button
    @IBAction func trackingCancelBtnPressed(_ sender: UIButton) {
        self.handlingTrackingTextFields(value1: false, value2: false, value3: false, value4: false, value5: false, value6: true, value7: true)
        trackingOutlet.trackingEditBtn?.imageView?.image = UIImage(named: "editbtn")
    }
    
    
    // function to enable and disable tracking text fields
    func handlingTrackingTextFields(value1:Bool,value2:Bool,value3:Bool,value4:Bool,value5:Bool,value6:Bool,value7:Bool)
    {
        trackingOutlet.tf1?.isUserInteractionEnabled = value1
        trackingOutlet.tf2?.isUserInteractionEnabled = value2
        trackingOutlet.tf3?.isUserInteractionEnabled = value3
        trackingOutlet.tf4?.isUserInteractionEnabled = value4
        trackingOutlet.tf5?.isUserInteractionEnabled = value5
        trackingOutlet.trackingsaveBtn?.isHidden = value6
        trackingOutlet.trackingCancelBtn?.isHidden = value7
        
    }
    //  ****************Hr data Buttons*******************
     // MARK:hrBtns
    
    // function to perform action on click of HR edit button
    @IBAction func hrEditBtnPressed(_ sender: UIButton) {
        self.handlingHRTextFields(value1: false, value2: false, value3: true, value4: true, value5: true, value6: true, value7: true, value8: true, value9: true, value10: true, value11: true, value12: true, value13: true, value14: true, value15: true, value16: true, value17: true, value18: true, value19: true, value20: true, value21: true, value22: true,value23: true,value24: true)
        hrDataOutlet.HrEditBtn?.setImage(UIImage.init(named: "mode_edit - material"), for: .normal)
    }

    // function to perform action on click of HR save button
    @IBAction func hrSaveBtnPressed(_ sender: UIButton) {
        self.handlingHRTextFields(value1: true, value2: true, value3: false, value4: false, value5: false, value6: false, value7: false, value8: false, value9: false, value10: false, value11: false, value12: false, value13: false, value14: false, value15: false, value16: false, value17: false, value18: false, value19: false, value20: false, value21: false, value22: false,value23: false,value24: false)
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
        mHrDataViewModelVar.sendUpdatedHrDataToController(hrData: hrObj)
    }
    
    // function to perform action on click of HR cancel button
    @IBAction func hrCancelBtnPressed(_ sender: UIButton) {
        self.handlingHRTextFields(value1: true, value2: true, value3: false, value4: false, value5: false, value6: false, value7: false, value8: false, value9: false, value10: false, value11: false, value12: false, value13: false, value14: false, value15: false, value16: false, value17: false, value18: false, value19: false, value20: false, value21: false, value22: false,value23: false,value24: false)
        hrDataOutlet.HrEditBtn?.imageView?.image = UIImage(named: "editbtn")
    }
    
    
    // function to enable and disable HR text fields
     func handlingHRTextFields(value1:Bool,value2:Bool,value3:Bool,value4:Bool,value5:Bool,value6:Bool,value7:Bool,value8:Bool,value9:Bool,value10:Bool,value11:Bool,value12:Bool,value13:Bool,value14:Bool,value15:Bool,value16:Bool,value17:Bool,value18:Bool,value19:Bool,value20:Bool,value21:Bool,value22:Bool,value23:Bool,value24:Bool)
     {
        hrDataOutlet.HrCancelBtn?.isHidden = value1
        hrDataOutlet.HrSaveBtn?.isHidden = value2
        hrDataOutlet.tf1?.isUserInteractionEnabled = value3
        hrDataOutlet.tf2?.isUserInteractionEnabled = value4
        hrDataOutlet.tf3?.isUserInteractionEnabled = value5
        hrDataOutlet.tf4?.isUserInteractionEnabled = value6
        hrDataOutlet.tf5?.isUserInteractionEnabled = value7
        hrDataOutlet.tf6?.isUserInteractionEnabled = value8
        hrDataOutlet.tf7?.isUserInteractionEnabled = value9
        hrDataOutlet.tf8?.isUserInteractionEnabled = value10
        hrDataOutlet.tf9?.isUserInteractionEnabled = value11
        hrDataOutlet.tf10?.isUserInteractionEnabled = value12
        hrDataOutlet.tf11?.isUserInteractionEnabled = value13
        hrDataOutlet.tf12?.isUserInteractionEnabled = value14
        hrDataOutlet.tf13?.isUserInteractionEnabled = value15
        hrDataOutlet.tf14?.isUserInteractionEnabled = value16
        hrDataOutlet.tf15?.isUserInteractionEnabled = value17
        hrDataOutlet.tf16?.isUserInteractionEnabled = value18
        hrDataOutlet.tf17?.isUserInteractionEnabled = value19
        hrDataOutlet.tf18?.isUserInteractionEnabled = value20
        hrDataOutlet.tf19?.isUserInteractionEnabled = value21
        hrDataOutlet.tf20?.isUserInteractionEnabled = value22
        hrDataOutlet.companyTextField?.isUserInteractionEnabled = value23
        hrDataOutlet.employeeStatusTextField?.isUserInteractionEnabled = value24
        
    }
    
    
    // MARK:attendanceBtns
    // function to perform action on click of Attendance edit button
       @IBAction func AttendanceEditBtn(_ sender: UIButton) {
        attendanceOutlet.attendanceEditBtn?.setImage(UIImage.init(named: "mode_edit - material"), for: .normal)
        mFlag = true
        attendanceOutlet.attendanceCancelBtn?.isHidden = false
        attendanceOutlet.attendanceSaveBtn?.isHidden = false
        }
    
    // function to perform action on click of attendance mark OK button
    @IBAction func attendanceMarkOkBtn(_ sender: UIButton) {
        inOutTimeView.isHidden = true
        mInTime = attendanceOutlet.inTextField?.text
        mOutTime = attendanceOutlet.outTextField?.text
    }
    
    // function to perform action on click of Attendance save button
    @IBAction func AttendanceSaveBtnPressed(_ sender: UIButton) {
        attendanceOutlet.attendanceCancelBtn?.isHidden = true
        attendanceOutlet.attendanceSaveBtn?.isHidden = true
        attendanceOutlet.attendanceEditBtn?.imageView?.image = UIImage(named: "editbtn")
        customPicker.isUserInteractionEnabled = true
        if mDidSelectDate == false {
        self.mAttendanceViewModelObj.fetchMonthlyAttendanceFromController(timeStamp: self.mCurrentTimeStamp!)
        }
        else
        {
        self.mAttendanceViewModelObj.fetchMonthlyAttendanceFromController(timeStamp: self.mTimeStamp!)
        }
        let status = String(describing:mMarkedStatus)
        let timeStampString = String(describing: mTimestamp2!)
        let attendanceObj = attendancePopUpModel(timeStampVar:timeStampString,enggId: "",attendanceStatusVar: mSelectedAttendance!,markedStatusVar: status,punchInVar: mInTime!,punchOutVar: mOutTime!,reasonVar: mReason!)
        mAttendanceViewModelObj.setUpdatedAttendanceToController(attendanceData: attendanceObj)
    }
    
    
    // function to perform action on click of Attendance cancel button
    @IBAction func attendanceCancelBtnPressed(_ sender: UIButton) {
        attendanceOutlet.attendanceCancelBtn?.isHidden = true
        attendanceOutlet.attendanceSaveBtn?.isHidden = true
        customPicker.isUserInteractionEnabled = true
        attendanceOutlet.attendanceEditBtn?.imageView?.image = UIImage(named: "editbtn")
        attendanceCollectionView.isHidden = true
        reasonView.isHidden = true
        inOutTimeView.isHidden = true
    }
    
    
    // function to perform action on click of Attendance reason ok button
    @IBAction func attendanceReasonOkBtn(_ sender: UIButton) {
        reasonView.isHidden = true
        mReason = attendanceOutlet.reasonTextView?.text
    }
    
    
    // MARK:settingValuesForViews
    // setting values for bank view
    func setBankData()
    {
        bankOutlet.bankActivityIndicator?.isHidden = true
        bankOutlet.bankActivityIndicator?.stopAnimating()
        bankOutlet.tf1?.text = mBankViewModelObj.bankvalues?.accNumber
        bankOutlet.tf2?.text = mBankViewModelObj.bankvalues?.bankName
        bankOutlet.tf3?.text = mBankViewModelObj.bankvalues?.bankIfscCode
        bankOutlet.tf4?.text = mBankViewModelObj.bankvalues?.bankPan
        bankOutlet.tf5?.text = mBankViewModelObj.bankvalues?.BankPaySalary
        bankOutlet.tf6?.text = mBankViewModelObj.bankvalues?.reason
    }
    
    // setting values for personal view
    func setPersonalData()
    {
        personalOutlet.personalActivityIndicator?.isHidden = true
        personalOutlet.personalActivityIndicator?.stopAnimating()
        personalOutlet.tf1?.text = engineerId
        personalOutlet.tf2?.text = mPersonalViewModelVar.personalValues?.emailIdModel
        personalOutlet.tf3?.text = mPersonalViewModelVar.personalValues?.mobileModel
        personalOutlet.tf4?.text = mPersonalViewModelVar.personalValues?.dateOfBirthModel
        personalOutlet.tf5?.text = mPersonalViewModelVar.personalValues?.fatherNameModel
        personalOutlet.tf6?.text = mPersonalViewModelVar.personalValues?.fatherMobileModel
        personalOutlet.tf7?.text = mPersonalViewModelVar.personalValues?.occupationModel
        personalOutlet.tf8?.text = mPersonalViewModelVar.personalValues?.annualSalaryModel
        personalOutlet.tf9?.text = mPersonalViewModelVar.personalValues?.mumbaiAddressModel
        personalOutlet.tf10?.text = mPersonalViewModelVar.personalValues?.permenantAddress
        personalOutlet.nameTextField?.text = mPersonalViewModelVar.personalValues?.employeeNameModel
    }
    
    // setting values for profile view
    func setProfileData() {
        profileOutlet.profileActivityIndicator?.isHidden = true
        profileOutlet.profileActivityIndicator?.stopAnimating()
        profileOutlet.tf1?.text = mProfileViewModelVar.profileValues?.diploma
        profileOutlet.tf2?.text = mProfileViewModelVar.profileValues?.degree
        profileOutlet.tf3?.text = mProfileViewModelVar.profileValues?.discipline
        profileOutlet.tf4?.text = mProfileViewModelVar.profileValues?.yearOfPassing
        profileOutlet.tf5?.text = mProfileViewModelVar.profileValues?.aggregate
        profileOutlet.tf6?.text = mProfileViewModelVar.profileValues?.finalYearPercentage
        profileOutlet.tf7?.text = mProfileViewModelVar.profileValues?.trainingInstitute
        profileOutlet.tf8?.text = mProfileViewModelVar.profileValues?.trainingDuration
        profileOutlet.tf9?.text = mProfileViewModelVar.profileValues?.training
         }
    
    // setting values for tracking view
    func setTrackingData() {
        trackingOutlet.trakingActivityIndicator?.isHidden = true
        trackingOutlet.trakingActivityIndicator?.stopAnimating()
        trackingOutlet.tf1?.text = mTrackingViewModelObj.trackingValues?.techStack
        trackingOutlet.tf2?.text = mTrackingViewModelObj.trackingValues?.startDate
        trackingOutlet.tf3?.text = mTrackingViewModelObj.trackingValues?.endDate
        trackingOutlet.tf4?.text = mTrackingViewModelObj.trackingValues?.currentWeek
        trackingOutlet.tf5?.text = mTrackingViewModelObj.trackingValues?.noOfWeeksLeft
        trackingOutlet.tf6?.text = mTrackingViewModelObj.trackingValues?.week
    }
    
    // setting values for engineer view
    func setEnggInfoData() {
        engineerInfoOutlet.engineerInfoActivityIndicator?.isHidden = true
        engineerInfoOutlet.engineerInfoActivityIndicator?.stopAnimating()
        engineerInfoOutlet.tf1?.text = engineerId
        engineerInfoOutlet.tf2?.text = mEnggInfoObj.enggInfoValues?.empStatus
        engineerInfoOutlet.tf3?.text = mEnggInfoObj.enggInfoValues?.company
        engineerInfoOutlet.tf4?.text = mEnggInfoObj.enggInfoValues?.mobile
        engineerInfoOutlet.tf5?.text = mEnggInfoObj.enggInfoValues?.emailId
        engineerInfoOutlet.tf6?.text = mEnggInfoObj.enggInfoValues?.startDate
        engineerInfoOutlet.tf7?.text = mEnggInfoObj.enggInfoValues?.cmpJoinDate
        engineerInfoOutlet.tf8?.text = mEnggInfoObj.enggInfoValues?.cmpLeaveDate
        mLeavesTaken = mEnggInfoObj.enggInfoValues?.leaveTaken
        let leaveString = String(mLeavesTaken)
        engineerInfoOutlet.tf9?.text = leaveString
        employeeNameLabel.text = mEnggInfoObj.enggInfoValues?.empName
          }
    
    // setting values for HR data view
    func sethrDataValues()
    {
        hrDataOutlet.hrActivityIndicator?.isHidden = true
        hrDataOutlet.hrActivityIndicator?.stopAnimating()
        hrDataOutlet.tf1?.text = mHrDataViewModelVar.hrValues?.hiringCityModel
        hrDataOutlet.tf3?.text = mHrDataViewModelVar.hrValues?.startDateModel
        hrDataOutlet.tf2?.text = mHrDataViewModelVar.hrValues?.fellowshipPeriodModel
        hrDataOutlet.tf4?.text = mHrDataViewModelVar.hrValues?.companyJoinDateModel
        hrDataOutlet.tf5?.text = mHrDataViewModelVar.hrValues?.companyLeaveDateModel
        hrDataOutlet.tf6?.text = mHrDataViewModelVar.hrValues?.enggContractSignedModel
        hrDataOutlet.tf7?.text = mHrDataViewModelVar.hrValues?.enggContractInitiatedModel
        hrDataOutlet.tf8?.text = mHrDataViewModelVar.hrValues?.contractInitiatedModel
        hrDataOutlet.tf9?.text = mHrDataViewModelVar.hrValues?.contractSignedModel
        hrDataOutlet.tf10?.text = mHrDataViewModelVar.hrValues?.contractSignDateModel
        hrDataOutlet.tf11?.text = mHrDataViewModelVar.hrValues?.initiateTransferModel
        hrDataOutlet.companyTextField?.text = mHrDataViewModelVar.hrValues?.companyModel
        hrDataOutlet.employeeStatusTextField?.text = mHrDataViewModelVar.hrValues?.employeeStatusModel
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
        mMarkedStatus = true
        if indexPath.row == 0 {
            blurView.isHidden = true
            reasonView.isHidden = false
            attendanceOutlet.reasonTextView?.layer.borderColor = UIColor.gray.cgColor
            attendanceOutlet.reasonTextView?.layer.borderWidth = 1
            attendanceOutlet.reasonTextView?.layer.cornerRadius = 8
            attendanceOutlet.reasonViewDate?.text = mDate1
            reasonView.layer.cornerRadius = 8
            reasonView.layer.borderColor = UIColor.gray.cgColor
            reasonView.layer.borderWidth = 0.2
            reasonView.layer.shadowColor = UIColor.black.cgColor
            reasonView.layer.shadowOffset = CGSize(width:0.0,height: 4.0)
            reasonView.layer.shadowRadius = 2.0
            reasonView.layer.shadowOpacity = 0.6
            mCellImage = UIImage(named: "L")
            reasonView.superview?.bringSubview(toFront: reasonView)
            mCheck0 = true
            mSelectedAttendance = "Leave"
            mReason = "NA"
            mInTime = "NA"
            mOutTime = "NA"
            
        }
        
        if indexPath.row == 1 {
            blurView.isHidden = true
            mCheck1 = true
            mCellImage = UIImage(named: "C")
            mSelectedAttendance = "CompLeave"
            mReason = "NA"
            mInTime = "NA"
            mOutTime = "NA"
            }
        
        if indexPath.row == 2 {
            blurView.isHidden = true
            mCheck2 = true
            inOutTimeView.isHidden = false
            attendanceOutlet.inOutVIewDate?.text = mDate1
            print("**********************",mDate1)
            inOutTimeView.layer.cornerRadius = 8
            inOutTimeView.layer.borderColor = UIColor.gray.cgColor
            inOutTimeView.layer.borderWidth = 0.2
            inOutTimeView.layer.shadowColor = UIColor.black.cgColor
            inOutTimeView.layer.shadowOffset = CGSize(width:0.0,height: 4.0)
            inOutTimeView.layer.shadowRadius = 2.0
            inOutTimeView.layer.shadowOpacity = 0.6
            inOutTimeView.superview?.bringSubview(toFront: inOutTimeView)
            mCellImage = UIImage(named: "ion-checkmark-round - Ionicons")
            mSelectedAttendance = "Present"
            mReason = "NA"
        }
        
        if indexPath.row == 3 {
            blurView.isHidden = true
            mCheck3 = true
            mCellImage = UIImage(named: "ion-alert - Ionicons")
            mSelectedAttendance = "Unmarked"
            mReason = "NA"
            mInTime = "NA"
            mOutTime = "NA"
            mMarkedStatus = false
        }
        
        
    }
    
    
    // function to reload calendar
       func calendarReload(keysArr:[String],valArray:[attendanceModel])
    {
        attendanceOutlet.attendanceActivityIndicator?.stopAnimating()
        attendanceOutlet.attendanceActivityIndicator?.isHidden = true
        self.mAttendanceKeys = keysArr
        self.mAttendanceValues = valArray
        print("******************",mAttendanceKeys!)
        print("&&&&&&&&&&&&&&&&&&",mAttendanceValues!)
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
        if mDateChange {
            let date = mStrMonth!+" "+mStrYear!
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
        mMyCustomCell = cell as! CellView
        mMyCustomCell.layer.borderWidth = 0.6
        mMyCustomCell.layer.borderColor = UIColor.lightGray.cgColor
        mMyCustomCell.dayLabel.text = cellState.text
        if cellState.dateBelongsTo == .thisMonth
        {
            mMyCustomCell.markImageView.isHidden = false
            mValueSet = false
            mMyCustomCell.dayLabel.textColor = UIColor(hexString: "#6FB8D9")
            if mFirst == true {
            let dateObj = DateFormatter()
            dateObj.dateFormat = "d"
            let dateString = dateObj.string(from: cellState.date)
                print(mAttendanceKeys?.count)
                if (mAttendanceKeys?.count)! != 0{
                for i in 0..<mAttendanceKeys!.count{
                let key = mAttendanceKeys?[i]
                if dateString == key {
                let value = mAttendanceValues?[i]
                    if value?.attendanceStatus == "Leave" && value?.markedStatus == "true"
                    {
                        mMyCustomCell.markImageView.image = UIImage(named: "L")
                        self.mValueSet = true
                        
                     }
                    else if value?.attendanceStatus == "Present" && value?.markedStatus == "true"
                    {
                        
                        mMyCustomCell.markImageView.image = UIImage(named: "ion-checkmark-round - Ionicons")
                        self.mValueSet = true
                    }
                    
                    else if value?.attendanceStatus == "CompLeave" && value?.markedStatus == "true"
                    {
                        
                        mMyCustomCell.markImageView.image = UIImage(named: "C")
                        self.mValueSet = true
                    }
                        
                    else if value?.attendanceStatus == "Unmarked" && value?.markedStatus == "false"
                    {
                        
                        mMyCustomCell.markImageView.image = UIImage(named: "ion-alert - Ionicons")
                        self.mValueSet = true
                    }

            
                }
            
                }
                if mValueSet == false
                {
                    mMyCustomCell.markImageView.isHidden = true

                }
                }
          else
                {
                    mMyCustomCell.markImageView.isHidden = true
                    
                }
            }
            
        }
        else{
            mMyCustomCell.dayLabel.textColor = UIColor(hexString:"#A9A9A9")
            mMyCustomCell.markImageView.isHidden = true
        }
        
        if cellState.isSelected {
            if mCheck0 == true {
                mMyCustomCell.markImageView.image = mCellImage
            }
            else if mCheck1 == true {
                mMyCustomCell.markImageView.image = mCellImage
            }
            else if mCheck2 == true{
                 mMyCustomCell.markImageView.image = mCellImage
            }
            else if mCheck3 == true {
                mMyCustomCell.markImageView.image = mCellImage
                
            }
        }
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleDayCellView?, cellState: CellState) {
        var i:Int!
        customPicker.isUserInteractionEnabled = false
        if cellState.dateBelongsTo == .thisMonth {
            if mFlag == false {
            attendancePopupOutlet.layer.cornerRadius = 8
            let formatter = DateFormatter()
            formatter.setLocalizedDateFormatFromTemplate("dd MMMM yyyy")
            mDate1 = formatter.string(from: cellState.date)
            print(mDate1)
                let dateObj2 = DateFormatter()
                dateObj2.dateFormat = "d"
                let theDate = dateObj2.string(from: cellState.date)
                for i in 0..<mAttendanceKeys!.count{
                    if theDate == mAttendanceKeys?[i] {
                        let values = mAttendanceValues?[i]
                        mdateFound = true
                        attendancePopupOutlet.inTimeLabel.text = values?.punchIn
                        attendancePopupOutlet.outTimeLabel.text = values?.punchOut
                        attendancePopupOutlet.leaveReasonTextView.text = values?.reason
                        attendancePopupOutlet.markedStatusLabel.text = values?.markedStatus
                        attendancePopupOutlet.attendanceStatusLabel.text = values?.attendanceStatus
                        attendancePopupOutlet.dateLabel.text = mDate1
                        attendancePopupOutlet.isHidden = false
                        self.blurView.isHidden = false
                    }
                    
                }
                
                if mdateFound == false {
                    attendancePopupOutlet.isHidden = true
                    blurView.isHidden = true
                    
                }
                attendancePopupOutlet.isUserInteractionEnabled = false
                view.isUserInteractionEnabled = true
                self.addGestureRecogniser()
                customPicker.isUserInteractionEnabled = true
                mCheck0 = false
                mCheck1 = false
                mCheck2 = false
                mCheck3 = false

            }
        else
        {
            let formatter = DateFormatter()
            formatter.setLocalizedDateFormatFromTemplate("dd MMMM yyyy")
            mDate1 = formatter.string(from: cellState.date)
            print("*******************",mDate1)
            attendanceCollectionView.isHidden = false
            blurView.isHidden = false
            mFlag = false
            mCheck0 = false
            mCheck1 = false
            mCheck2 = false
            mCheck3 = false
            let formatter2 = DateFormatter()
            formatter2.setLocalizedDateFormatFromTemplate("dd MMMM yyyy")
            let date2 = formatter2.date(from: mDate1!)
            mTimestamp2 = (date2?.timeIntervalSince1970)! * 1000
        }
    }
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

// extension of picker view delegate
extension ViewController : UIPickerViewDelegate
{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            let nameOfMonth:String = mMonthArray.object(at: row) as! String
            return nameOfMonth
        }
        
        if component == 1 {
            let year = mYearArray.object(at: row) as! String
            return year
        }
        return "null"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        mDidSelectDate = true
        let when = DispatchTime.now() + 8 
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.mStrMonth = self.mMonthArray[pickerView.selectedRow(inComponent: 0)] as! String
            self.mStrYear = self.mYearArray[pickerView.selectedRow(inComponent: 1)] as! String
            let formatter = DateFormatter()
            formatter.setLocalizedDateFormatFromTemplate("MMMMyyyy")
            let selectedDate = self.mStrMonth!+" "+self.mStrYear!
            let myDate = formatter.date(from: selectedDate)
            print(myDate!)
             self.mTimeStamp = myDate!.timeIntervalSince1970 * 1000
            print("**********timestamp is",self.mTimeStamp!)
            self.mAttendanceViewModelObj.fetchMonthlyAttendanceFromController(timeStamp: self.mTimeStamp!)
        self.mFirst = true
        self.mDateChange = true
        }
        
    }
}








