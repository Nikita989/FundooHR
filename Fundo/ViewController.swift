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


// enumeration for menu table
enum MenuTable:Int {
    case ATTENDANCE_DETAILS = 0
    case PERSONAL_DETAILS
    case PROFILE_DETAILS
    case HR_DETAILS
    case BANK_DETAILS
    case TRACKING_DETAILS
    case ENGINEER_INFO
}

// enumeration for attendanceMarkCollectionView
enum AttendanceMarkCollectionViewEnum:Int {
    case LEAVE = 0
    case COMPANY_HOLIDAY
    case PRESENT
    case UNMARK
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,BankviewProtocol,PersonalviewProtocal,ProfileViewProtocal,TrackingViewProtocol,EnggInfoViewProtocol,HrviewProtocal,AttendanceViewProtocol{
    
    // outlet of ImageActivityIndicator
    @IBOutlet weak var mImageActivityIndicator: UIActivityIndicatorView!
    
    // outlet of employee name label
    @IBOutlet weak var mEmployeeNameLabel: UILabel!
    
    // outlet of inout time view
    @IBOutlet weak var mInOutTimeView: UIView!
    
    // outlet of reason view
    @IBOutlet weak var mReasonView: UIView!
    
    // outlet of attendance collection view
    @IBOutlet weak var mAttendanceCollectionView: UICollectionView!
    
    //outlet of attendance popup view
    @IBOutlet weak var mAttendancePopupOutlet: AttendancePopUp!
    
    // outlet of blur view
    @IBOutlet weak var mBlurView: UIVisualEffectView!
    
    // outlet of table view
    @IBOutlet var mMenuTableView:UITableView?
    
    // outlet of tracking view
    @IBOutlet weak var mTrackingOutlet: TrackingView!
    
    // outlet of container view height
    @IBOutlet weak var mContainerHeight: NSLayoutConstraint!
    
    // outlet of profile view
    @IBOutlet weak var mProfileOutlet: ProfileView!
    
    // outlet of container view
    @IBOutlet weak var mContainerView: UIView!
    
    // outlet of scroll view
    @IBOutlet weak var mScrollView: UIScrollView!
    
    // outlet of calender view
    @IBOutlet weak var mCalenderView: JTAppleCalendarView!
    
    // outlet of picker view
    @IBOutlet weak var mCustomPicker: UIPickerView!
    
    // outlet of bank view
    @IBOutlet weak var mBankOutlet: BankView!
    
    // outlet of hr data view
    @IBOutlet weak var mHrDataOutlet: HRDataView!
    
    // outlet of engineer info view
    @IBOutlet weak var mEngineerInfoOutlet: EngineerInfoView!
    
    // outlet of personal view
    @IBOutlet weak var mPersonalOutlet: PersonalView!
    
    // outlet of attendance view
    @IBOutlet weak var mAttendanceOutlet: AttendanceView!
    
    // create object of hr data viewModel
    var mHrDataViewModelVar:HrDataViewModel?
    
    // create object of personal viewModel
    var mPersonalViewModelVar:PersonalViewModel?
    
    // create object of profile data viewModel
    var mProfileViewModelVar:ProfileDataViewModel?
    
    // create object of bank viewModel
    var mBankViewModelObj:BankViewModel?
    
    // create object of tracking data viewModel
    var mTrackingViewModelObj:TrackingDataViewModel?
    
    // create object of engineer info viewModel
    var mEnggInfoObj:EnggInfoViewModel?
    
    // create object of attendance viewModel
    var mAttendanceViewModelObj:AttendanceViewModel?
    
    // variable to store index
    var mIndex:Int?
    
    // variable of type cgLayer
    var mLayer:CGLayer?
    var mAtt:AttendanceView?
    
    // outlet of employee image view
    @IBOutlet weak var employeeImage: UIImageView!
    
    // boolean variables
    var mDateChange:Bool = false
    var mCheck0:Bool? = false
    var mCheck1:Bool = false
    var mCheck2:Bool = false
    var mCheck3:Bool = false
    var mdidSelectEditBtn:Bool = false
    var mValueSet:Bool = false
    var mDidSelectAttendanceDetails:Bool = false
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
    var mAttendanceValues:[AttendanceModel]?
    
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
        mImageActivityIndicator.isHidden = false
        mImageActivityIndicator.startAnimating()
        
        // initialising the constructors of respective classes
        mAttendanceViewModelObj = AttendanceViewModel(attendanceViewProtocolObj: self)
        mEnggInfoObj = EnggInfoViewModel(enggInfoViewProtocolObj: self)
        mTrackingViewModelObj = TrackingDataViewModel(trackingViewProtocolObj: self)
        mBankViewModelObj = BankViewModel(mBankViewProtocolObj: self)
        mProfileViewModelVar = ProfileDataViewModel(mProfileViewProtocolObj: self)
        mPersonalViewModelVar = PersonalViewModel(mPersonalViewProtocolObj: self)
        mHrDataViewModelVar = HrDataViewModel(mHrViewProtocolObj: self)
        mEnggInfoObj?.fetchDataFromController()
        mAttendanceCollectionView.delegate = self
        mAttendanceCollectionView.dataSource = self
        mCalenderView.layer.borderColor = UIColor(red: 180/255, green: 221/255, blue: 239/255, alpha: 1).cgColor
        mCalenderView.layer.shadowColor = UIColor.black.cgColor
        mCalenderView.dataSource = self
        mCalenderView.delegate = self
        mCalenderView.registerCellViewXib(file: "CellView")
        mCustomPicker.dataSource = self
        mCustomPicker.delegate = self
        let formatter = DateFormatter()
        let formatter1 = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MMMM")
        formatter1.setLocalizedDateFormatFromTemplate("yyyy")
        let currentMonth = formatter.string(from: Date())
        let currentYear = formatter1.string(from: Date())
        
        for var i in 0..<mMonthArray.count {
            if mMonthArray.object(at: i)as! String == currentMonth {
                mCustomPicker.selectRow(i, inComponent: 0, animated: true)
                break
            }
        }
        for var j in 0..<mYearArray.count {
            if mYearArray.object(at: j) as! String == currentYear {
                mCustomPicker.selectRow(j, inComponent: 1, animated: true)
                break
            }
        }
        self.mMenuTableView?.isHidden = true
        self.mAttendancePopupOutlet.isHidden = true
        self.mBlurView.isHidden = true
        self.addSubView(selectedIndex: 6)
        mMenuTableView?.delegate = self
        mMenuTableView?.dataSource = self
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
        self.mBlurView.addGestureRecognizer(mTapGesture!)
    }
    
    
    // ACTION TO BE PERFORMED ON TAP
    func hidePopUp(sender:UITapGestureRecognizer)
    {
        self.mBlurView.isHidden = true
        self.mAttendancePopupOutlet.isHidden = true
    }
    
    
    // mainMenu button action
    @IBAction func menuBtn(_ sender: UIButton) {
        self.view.addSubview(self.mMenuTableView!)
        self.mMenuTableView?.isHidden = false
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
        self.mMenuTableView?.isHidden = true
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
            
        // case for attendance details
        case MenuTable.ATTENDANCE_DETAILS.rawValue:
            mAttendanceOutlet.attendanceActivityIndicator?.isHidden = false
            mAttendanceOutlet.attendanceActivityIndicator?.startAnimating()
            mContainerHeight.constant = 1100
            mDidSelectAttendanceDetails = true
            mAttendanceViewModelObj?.fetchMonthlyAttendanceFromController(timeStamp: mCurrentTimeStamp)
            mScrollView.contentSize = CGSize(width: self.view.frame.width, height: 1000)
            mAttendanceOutlet.superview?.bringSubview(toFront: mAttendanceOutlet)
            self.hideViews(value1: true, value2: false, value3: true, value4: true, value5: true, value6: true, value7: true)
            self.view.layoutIfNeeded()
            break
            
            
        // case for personal details
        case MenuTable.PERSONAL_DETAILS.rawValue:
            mPersonalOutlet.personalActivityIndicator?.isHidden = false
            mPersonalOutlet.personalActivityIndicator?.startAnimating()
            mPersonalViewModelVar?.fetchPersonalDataFromController()
            mContainerHeight.constant = 1000
            self.hideViews(value1: true, value2: true, value3: false, value4: true, value5: true, value6: true, value7: true)
            mScrollView.contentSize = CGSize(width: self.view.frame.width, height: 1000)
            mPersonalOutlet.superview?.bringSubview(toFront: mPersonalOutlet)
            self.view.layoutIfNeeded()
            
            break
            
        // case for profile details
        case MenuTable.PROFILE_DETAILS.rawValue:
            mProfileOutlet.profileActivityIndicator?.isHidden = false
            mProfileOutlet.profileActivityIndicator?.startAnimating()
            mProfileViewModelVar?.fetchProfileDataFromController()
            mContainerHeight.constant = 1000
            mScrollView.contentSize = CGSize(width: self.view.frame.width, height: 1000)
            self.hideViews(value1: true, value2: true, value3: true, value4: false, value5: true, value6: true, value7: true)
            mProfileOutlet.superview?.bringSubview(toFront: mProfileOutlet)
            self.view.layoutIfNeeded()
            break
            
        // case for HR details
        case MenuTable.HR_DETAILS.rawValue:
            mHrDataOutlet.hrActivityIndicator?.isHidden = false
            mHrDataOutlet.hrActivityIndicator?.startAnimating()
            mHrDataViewModelVar?.fetchHrDataFromController()
            mContainerHeight.constant = 1500
            mScrollView.contentSize = CGSize(width: self.view.frame.width, height: 1600)
            self.hideViews(value1: true, value2: true, value3: true, value4: true, value5: false, value6: true, value7: true)
            mHrDataOutlet.superview?.bringSubview(toFront: mHrDataOutlet)
            self.view.layoutIfNeeded()
            break
            
            
        // case for Bank details
        case MenuTable.BANK_DETAILS.rawValue:
            mBankOutlet.bankActivityIndicator?.isHidden = false
            mBankOutlet.bankActivityIndicator?.startAnimating()
            mBankViewModelObj?.fetchDataFromController()
            mContainerHeight.constant = 1000
            mScrollView.contentSize = CGSize(width: self.view.frame.width, height: 700)
            self.hideViews(value1: true, value2: true, value3: true, value4: true, value5: true, value6: true, value7: false)
            mBankOutlet.superview?.bringSubview(toFront: mBankOutlet)
            self.view.layoutIfNeeded()
            break
            
        // case for tracking details
        case MenuTable.TRACKING_DETAILS.rawValue:
            mTrackingOutlet.trakingActivityIndicator?.isHidden = false
            mTrackingOutlet.trakingActivityIndicator?.startAnimating()
            mTrackingViewModelObj?.fetchTrackingDataFromController()
            mContainerHeight.constant = 1000
            mScrollView.contentSize = CGSize(width: self.view.frame.width, height: 700)
            self.hideViews(value1: true, value2: true, value3: true, value4: true, value5: true, value6: false, value7: true)
            mTrackingOutlet.superview?.bringSubview(toFront: mTrackingOutlet)
            self.view.layoutIfNeeded()
            break
            
        // case for engineer info
        case MenuTable.ENGINEER_INFO.rawValue:
            mEngineerInfoOutlet.engineerInfoActivityIndicator?.isHidden = false
            mEngineerInfoOutlet.engineerInfoActivityIndicator?.startAnimating()
            mContainerHeight.constant = 1000
            mScrollView.contentSize = CGSize(width: self.view.frame.width, height: 700)
            self.hideViews(value1: false, value2: true, value3: true, value4: true, value5: true, value6: true, value7: true)
            mEngineerInfoOutlet.superview?.bringSubview(toFront: mEngineerInfoOutlet)
            self.view.layoutIfNeeded()
            break
        default:
            break
        }
        
    }
    
    
    // function to hide corresponding views
    func hideViews(value1:Bool,value2:Bool,value3:Bool,value4:Bool,value5:Bool,value6:Bool,value7:Bool)
    {
        mEngineerInfoOutlet.isHidden = value1
        mAttendanceOutlet.isHidden = value2
        mPersonalOutlet.isHidden = value3
        mProfileOutlet.isHidden = value4
        mHrDataOutlet.isHidden = value5
        mTrackingOutlet.isHidden = value6
        mBankOutlet.isHidden = value7
    }
    
    
    
    // *******************Bank Buttons ***************************
    // MARK:bankBtns
    
    
    // function to perform action on click of bank edit button
    
    @IBAction func bankEditBtn(_ sender: Any) {
        self.handlingBankTextFields(value1: true, value2: true, value3: true, value4: true, value5: true, value6: true, value7: false, value8: false)
        mBankOutlet.bankEditBtn?.setImage(UIImage.init(named: "mode_edit - material"), for: .normal)
    }
    
    // function to perform action on click of bank save button
    
    @IBAction func bankSaveBtnPressed(_ sender: UIButton) {
        self.handlingBankTextFields(value1: false, value2: false, value3: false, value4: false, value5: false, value6: false, value7: true, value8: true)
        mBankOutlet.bankEditBtn?.imageView?.image = UIImage(named: "editbtn")
        let bankString1 = mBankOutlet.mBankTextField1?.text
        let bankString2 = mBankOutlet.mBankTextField2?.text
        let bankString3 = mBankOutlet.mBankTextField3?.text
        let bankString4 = mBankOutlet.mBankTextField4?.text
        let bankString5 = mBankOutlet.mBankTextField5?.text
        let bankString6 = mBankOutlet.mBankTextField6?.text
        let bankObj = BankDataModel(accountNum: bankString1!,bankNAme: bankString2!,ifscCode: bankString3!,pan: bankString4!,paySalary: bankString5!,reasonVar: bankString6!)
        mBankViewModelObj?.sendUpdatedBankDataToController(bankData: bankObj)
    }
    
    
    // function to perform action on click of bank cancel button
    
    @IBAction func BankCancelBtnPressed(_ sender: UIButton) {
        self.handlingBankTextFields(value1: false, value2: false, value3: false, value4: false, value5: false, value6: false, value7: true, value8: true)
        mBankOutlet.bankEditBtn?.imageView?.image = UIImage(named: "editbtn")
    }
    
    
    // function to enable and disable bank text fields
    
    func handlingBankTextFields(value1:Bool,value2:Bool,value3:Bool,value4:Bool,value5:Bool,value6:Bool,value7:Bool,value8:Bool)
    {
        mBankOutlet.mBankTextField1?.isUserInteractionEnabled = value1
        mBankOutlet.mBankTextField2?.isUserInteractionEnabled = value2
        mBankOutlet.mBankTextField3?.isUserInteractionEnabled = value3
        mBankOutlet.mBankTextField4?.isUserInteractionEnabled = value4
        mBankOutlet.mBankTextField5?.isUserInteractionEnabled = value5
        mBankOutlet.mBankTextField6?.isUserInteractionEnabled = value6
        mBankOutlet.bankCancelBtn?.isHidden = value7
        mBankOutlet.bankSaveBtn?.isHidden = value8
        
    }
    
    // *******************personal Buttons ***************************
    // MARK:personalbtns
    
    
    // function to perform action on click of personal save button
    @IBAction func personalSaveButtonPressed(_ sender: UIButton) {
        self.handlingPersonalTextFields(value1: true, value2: true, value3: false, value4: false, value5: false, value6: false, value7: false, value8: false, value9: false, value10: false, value11: false, value12: false)
        mPersonalOutlet.personalEditBtn?.imageView?.image = UIImage(named: "editbtn")
        let personalData1 = mPersonalOutlet.mPersonalTextField8?.text
        let personalData2 = mPersonalOutlet.mPersonalTextField4?.text
        let personalData3 = mPersonalOutlet.mPersonalTextField2?.text
        let personalData5 = mPersonalOutlet.mPersonalTextField6?.text
        let personalData6 = mPersonalOutlet.mPersonalTextField5?.text
        let personalData7 = mPersonalOutlet.mPersonalTextField3?.text
        let personalData8 = mPersonalOutlet.mPersonalTextView9?.text
        let personalData9 = mPersonalOutlet.mPersonalTextField7?.text
        let personalData10 = mPersonalOutlet.mPersonalTextView10?.text
        let employeeName = mPersonalOutlet.nameTextField?.text
        let personalObj = PersonalDataModel(annualSalary: personalData1!,dob: personalData2!,email: personalData3!,empName:employeeName!,fatherMobile: personalData5!,fatherName: personalData6!,mobile: personalData7!,mumbaiAddr: personalData8!,occupation: personalData9!,permanantAddr: personalData10!)
        mPersonalViewModelVar?.sendUpdatedPersonalDataToController(personalData: personalObj)
    }
    
    
    // function to perform action on click of personal edit button
    @IBAction func personalEditBtn(_ sender: UIButton) {
        self.handlingPersonalTextFields(value1: false, value2: false, value3: true, value4: true, value5: true, value6: true, value7: true, value8: true, value9: true, value10: true, value11: true, value12: true)
        mPersonalOutlet.personalEditBtn?.setImage(UIImage.init(named: "mode_edit - material"), for: .normal)
    }
    
    
    // function to perform action on click of personal cancel button
    @IBAction func personalCancelButnPressed(_ sender: UIButton) {
        self.handlingPersonalTextFields(value1: true, value2: true, value3: false, value4: false, value5: false, value6: false, value7: false, value8: false, value9: false, value10: false, value11: false, value12: false)
        mPersonalOutlet.personalEditBtn?.imageView?.image = UIImage(named: "editbtn")
    }
    
    
    // function to enable and disable personal text fields
    func handlingPersonalTextFields(value1:Bool,value2:Bool,value3:Bool,value4:Bool,value5:Bool,value6:Bool,value7:Bool,value8:Bool,value9:Bool,value10:Bool,value11:Bool,value12:Bool)
    {
        mPersonalOutlet.personalSaveBtn?.isHidden = value1
        mPersonalOutlet.personalCancelBtn?.isHidden = value2
        mPersonalOutlet.mPersonalTextField1?.isUserInteractionEnabled = value3
        mPersonalOutlet.mPersonalTextField2?.isUserInteractionEnabled = value4
        mPersonalOutlet.mPersonalTextField3?.isUserInteractionEnabled = value5
        mPersonalOutlet.mPersonalTextField4?.isUserInteractionEnabled = value6
        mPersonalOutlet.mPersonalTextField5?.isUserInteractionEnabled = value7
        mPersonalOutlet.mPersonalTextField6?.isUserInteractionEnabled = value8
        mPersonalOutlet.mPersonalTextField7?.isUserInteractionEnabled = value9
        mPersonalOutlet.mPersonalTextField8?.isUserInteractionEnabled = value10
        mPersonalOutlet.mPersonalTextView9?.isUserInteractionEnabled = value11
        mPersonalOutlet.mPersonalTextView10?.isUserInteractionEnabled = value12
        
    }
    
    
    // *******************profile Buttons ***************************
    // MARK:profileBtns
    
    
    // function to perform action on click of profile edit button
    @IBAction func profileEditBtnPressed(_ sender: UIButton) {
        self.handlingProfileTextFields(value1: false, value2: false, value3: true
            , value4: true, value5: true, value6: true, value7: true, value8: true, value9: true, value10: true, value11: true)
        mProfileOutlet.profileEditBtn?.setImage(UIImage.init(named: "mode_edit - material"), for: .normal)
    }
    
    
    
    // function to perform action on click of profile cancel button
    @IBAction func profileCancelBtnPressed(_ sender: UIButton) {
        self.handlingProfileTextFields(value1: true, value2: true, value3: false
            , value4: false, value5: false, value6: false, value7: false, value8: false, value9: false, value10: false, value11: false)
        mProfileOutlet.profileEditBtn?.imageView?.image = UIImage(named: "editbtn")
    }
    
    
    // function to perform action on click of profile save button
    @IBAction func profileSaveBtnPressed(_ sender: UIButton) {
        self.handlingProfileTextFields(value1: true, value2: true, value3: false
            , value4: false, value5: false, value6: false, value7: false, value8: false, value9: false, value10: false, value11: false)
        mProfileOutlet.profileEditBtn?.imageView?.image = UIImage(named: "editbtn")
        let profileData1 = mProfileOutlet.mProfileTextField1?.text
        let profileData2 = mProfileOutlet.mProfileTextField2?.text
        let profileData3 = mProfileOutlet.mProfileTextField3?.text
        let profileData4 = mProfileOutlet.mProfileTextField4?.text
        let profileData5 = mProfileOutlet.mProfileTextField5?.text
        let profileData6 = mProfileOutlet.mProfileTextField6?.text
        let profileData7 = mProfileOutlet.mProfileTextField7?.text
        let profileData8 = mProfileOutlet.mProfileTextField8?.text
        let profileData9 = mProfileOutlet.mProfileTextView9?.text
        let profileeObj = ProfileDataModel(diplomaVar: profileData1!,degreeVar: profileData2!,disciplineVar: profileData3!,yop: profileData4!,aggregateVar: profileData5!,finalyearPercentagevar: profileData6!,trainingInstVar: profileData7!,trainingDurationVar: profileData8!,trainingVar: profileData9!)
        mProfileViewModelVar?.sendUpdatedProfileDataToController(profileData: profileeObj)
    }
    
    
    // function to enable and disable profile text fields
    func handlingProfileTextFields(value1:Bool,value2:Bool,value3:Bool,value4:Bool,value5:Bool,value6:Bool,value7:Bool,value8:Bool,value9:Bool,value10:Bool,value11:Bool)
    {
        mProfileOutlet.profilCancelBtn?.isHidden = value1
        mProfileOutlet.profileSaveBtn?.isHidden = value2
        mProfileOutlet.mProfileTextField1?.isUserInteractionEnabled = value3
        mProfileOutlet.mProfileTextField2?.isUserInteractionEnabled = value4
        mProfileOutlet.mProfileTextField3?.isUserInteractionEnabled = value5
        mProfileOutlet.mProfileTextField4?.isUserInteractionEnabled = value6
        mProfileOutlet.mProfileTextField5?.isUserInteractionEnabled = value7
        mProfileOutlet.mProfileTextField6?.isUserInteractionEnabled = value8
        mProfileOutlet.mProfileTextField7?.isUserInteractionEnabled = value9
        mProfileOutlet.mProfileTextField8?.isUserInteractionEnabled = value10
        mProfileOutlet.mProfileTextView9?.isUserInteractionEnabled = value11
        
    }
    
    //  **************Tracking buttons******************
    // MARK:trackingBtns
    
    // function to perform action on click of tracking edit button
    @IBAction func editButton(_ sender: Any) {
        self.handlingTrackingTextFields(value1: true, value2: true, value3: true, value4: true, value5: true, value6: false, value7: false)
        mTrackingOutlet.trackingEditBtn?.setImage(UIImage.init(named: "mode_edit - material"), for: .normal)
    }
    
    // function to perform action on click of tracking edit button
    @IBAction func trackingSveBtnPressed(_ sender: UIButton) {
        self.handlingTrackingTextFields(value1: false, value2: false, value3: false, value4: false, value5: false, value6: true, value7: true)
        mTrackingOutlet.trackingEditBtn?.imageView?.image = UIImage(named: "editbtn")
        let trackingData1 = mTrackingOutlet.mTrackingTextField1?.text
        let trackingData2 = mTrackingOutlet.mTrackingTextField2?.text
        let trackingData3 = mTrackingOutlet.mTrackingTextField3?.text
        let trackingData4 = mTrackingOutlet.mTrackingTextField4?.text
        let trackingData5 = mTrackingOutlet.mTrackingTextField5?.text
        let trackingData6 = mTrackingOutlet.mTrackingTextField6?.text
        let trackingObj = TrackingDataModel(blEndDate: trackingData3!,blStartDate: trackingData2!,curWeek: trackingData4!,numOfWeeks: trackingData5!,stack: trackingData1!,week1: trackingData6!)
        mTrackingViewModelObj?.sendUpdatedTrackingDataToController(trackingData: trackingObj)
    }
    
    
    // function to perform action on click of tracking cancel button
    @IBAction func trackingCancelBtnPressed(_ sender: UIButton) {
        self.handlingTrackingTextFields(value1: false, value2: false, value3: false, value4: false, value5: false, value6: true, value7: true)
        mTrackingOutlet.trackingEditBtn?.imageView?.image = UIImage(named: "editbtn")
    }
    
    
    // function to enable and disable tracking text fields
    func handlingTrackingTextFields(value1:Bool,value2:Bool,value3:Bool,value4:Bool,value5:Bool,value6:Bool,value7:Bool)
    {
        mTrackingOutlet.mTrackingTextField1?.isUserInteractionEnabled = value1
        mTrackingOutlet.mTrackingTextField2?.isUserInteractionEnabled = value2
        mTrackingOutlet.mTrackingTextField3?.isUserInteractionEnabled = value3
        mTrackingOutlet.mTrackingTextField4?.isUserInteractionEnabled = value4
        mTrackingOutlet.mTrackingTextField5?.isUserInteractionEnabled = value5
        mTrackingOutlet.trackingsaveBtn?.isHidden = value6
        mTrackingOutlet.trackingCancelBtn?.isHidden = value7
        
    }
    //  ****************Hr data Buttons*******************
    // MARK:hrBtns
    
    // function to perform action on click of HR edit button
    @IBAction func hrEditBtnPressed(_ sender: UIButton) {
        self.handlingHRTextFields(value1: false, value2: false, value3: true, value4: true, value5: true, value6: true, value7: true, value8: true, value9: true, value10: true, value11: true, value12: true, value13: true, value14: true, value15: true, value16: true, value17: true, value18: true, value19: true, value20: true, value21: true, value22: true,value23: true,value24: true)
        mHrDataOutlet.HrEditBtn?.setImage(UIImage.init(named: "mode_edit - material"), for: .normal)
    }
    
    // function to perform action on click of HR save button
    @IBAction func hrSaveBtnPressed(_ sender: UIButton) {
        self.handlingHRTextFields(value1: true, value2: true, value3: false, value4: false, value5: false, value6: false, value7: false, value8: false, value9: false, value10: false, value11: false, value12: false, value13: false, value14: false, value15: false, value16: false, value17: false, value18: false, value19: false, value20: false, value21: false, value22: false,value23: false,value24: false)
        mHrDataOutlet.HrEditBtn?.imageView?.image = UIImage(named: "editbtn")
        let hrData1 = mHrDataOutlet.mHrTextField1?.text
        let hrData2 = mHrDataOutlet.mHrTextField2?.text
        let hrData3 = mHrDataOutlet.mHrTextField3?.text
        let hrData4 = mHrDataOutlet.mHrTextField4?.text
        let hrData5 = mHrDataOutlet.mHrTextField5?.text
        let hrData6 = mHrDataOutlet.mHrTextField6?.text
        let hrData7 = mHrDataOutlet.mHrTextField7?.text
        let hrData8 = mHrDataOutlet.mHrTextField8?.text
        let hrData9 = mHrDataOutlet.mHrTextField9?.text
        let hrData10 = mHrDataOutlet.mHrTextField10?.text
        let hrData11 = mHrDataOutlet.mHrTextField11?.text
        let companyVal = mHrDataOutlet.companyTextField?.text
        let status = mHrDataOutlet.employeeStatusTextField?.text
        let hrData12 = mHrDataOutlet.mHrTextField12?.text
        let hrData13 = mHrDataOutlet.mHrTextField13?.text
        let hrObj = HrDataModel(startDate: hrData3!,contractInitiated: hrData8!,contractSigned: hrData9!,company:companyVal!,companyJoinDate: hrData4!,companyLeaveDate: hrData5!,contractSignDate: hrData10!,employeeStatus:status!,enggContractInitiated: hrData7!,enggContractSigned: hrData6!,fellowshipPeriod: hrData2!,hiringCity: hrData1!,initiateTransfer: hrData11!)
        mHrDataViewModelVar?.sendUpdatedHrDataToController(hrData: hrObj)
    }
    
    // function to perform action on click of HR cancel button
    @IBAction func hrCancelBtnPressed(_ sender: UIButton) {
        self.handlingHRTextFields(value1: true, value2: true, value3: false, value4: false, value5: false, value6: false, value7: false, value8: false, value9: false, value10: false, value11: false, value12: false, value13: false, value14: false, value15: false, value16: false, value17: false, value18: false, value19: false, value20: false, value21: false, value22: false,value23: false,value24: false)
        mHrDataOutlet.HrEditBtn?.imageView?.image = UIImage(named: "editbtn")
    }
    
    
    // function to enable and disable HR text fields
    func handlingHRTextFields(value1:Bool,value2:Bool,value3:Bool,value4:Bool,value5:Bool,value6:Bool,value7:Bool,value8:Bool,value9:Bool,value10:Bool,value11:Bool,value12:Bool,value13:Bool,value14:Bool,value15:Bool,value16:Bool,value17:Bool,value18:Bool,value19:Bool,value20:Bool,value21:Bool,value22:Bool,value23:Bool,value24:Bool)
    {
        mHrDataOutlet.HrCancelBtn?.isHidden = value1
        mHrDataOutlet.HrSaveBtn?.isHidden = value2
        mHrDataOutlet.mHrTextField1?.isUserInteractionEnabled = value3
        mHrDataOutlet.mHrTextField2?.isUserInteractionEnabled = value4
        mHrDataOutlet.mHrTextField3?.isUserInteractionEnabled = value5
        mHrDataOutlet.mHrTextField4?.isUserInteractionEnabled = value6
        mHrDataOutlet.mHrTextField5?.isUserInteractionEnabled = value7
        mHrDataOutlet.mHrTextField6?.isUserInteractionEnabled = value8
        mHrDataOutlet.mHrTextField7?.isUserInteractionEnabled = value9
        mHrDataOutlet.mHrTextField8?.isUserInteractionEnabled = value10
        mHrDataOutlet.mHrTextField9?.isUserInteractionEnabled = value11
        mHrDataOutlet.mHrTextField10?.isUserInteractionEnabled = value12
        mHrDataOutlet.mHrTextField11?.isUserInteractionEnabled = value13
        mHrDataOutlet.mHrTextField12?.isUserInteractionEnabled = value14
        mHrDataOutlet.mHrTextField13?.isUserInteractionEnabled = value15
        mHrDataOutlet.mHrTextField14?.isUserInteractionEnabled = value16
        mHrDataOutlet.mHrTextField15?.isUserInteractionEnabled = value17
        mHrDataOutlet.mHrTextField16?.isUserInteractionEnabled = value18
        mHrDataOutlet.mHrTextField17?.isUserInteractionEnabled = value19
        mHrDataOutlet.mHrTextField18?.isUserInteractionEnabled = value20
        mHrDataOutlet.mHrTextField19?.isUserInteractionEnabled = value21
        mHrDataOutlet.mHrTextField20?.isUserInteractionEnabled = value22
        mHrDataOutlet.companyTextField?.isUserInteractionEnabled = value23
        mHrDataOutlet.employeeStatusTextField?.isUserInteractionEnabled = value24
        
    }
    
    
    // MARK:attendanceBtns
    // function to perform action on click of Attendance edit button
    @IBAction func AttendanceEditBtn(_ sender: UIButton) {
        mAttendanceOutlet.attendanceEditBtn?.setImage(UIImage.init(named: "mode_edit - material"), for: .normal)
        mdidSelectEditBtn = true
        mAttendanceOutlet.attendanceCancelBtn?.isHidden = false
        mAttendanceOutlet.attendanceSaveBtn?.isHidden = false
    }
    
    // function to perform action on click of attendance mark OK button
    @IBAction func attendanceMarkOkBtn(_ sender: UIButton) {
        mInOutTimeView.isHidden = true
        mInTime = mAttendanceOutlet.inTextField?.text
        mOutTime = mAttendanceOutlet.outTextField?.text
    }
    
    // function to perform action on click of Attendance save button
    @IBAction func AttendanceSaveBtnPressed(_ sender: UIButton) {
        mAttendanceOutlet.attendanceCancelBtn?.isHidden = true
        mAttendanceOutlet.attendanceSaveBtn?.isHidden = true
        mAttendanceOutlet.attendanceEditBtn?.imageView?.image = UIImage(named: "editbtn")
        mCustomPicker.isUserInteractionEnabled = true
        if mDidSelectDate == false {
            self.mAttendanceViewModelObj?.fetchMonthlyAttendanceFromController(timeStamp: self.mCurrentTimeStamp!)
        }
        else
        {
            self.mAttendanceViewModelObj?.fetchMonthlyAttendanceFromController(timeStamp: self.mTimeStamp!)
        }
        let status = String(describing:mMarkedStatus)
        let timeStampString = String(describing: mTimestamp2!)
        let attendanceObj = AttendancePopUpModel(timeStampVar:timeStampString,enggId: "",attendanceStatusVar: mSelectedAttendance!,markedStatusVar: status,punchInVar: mInTime!,punchOutVar: mOutTime!,reasonVar: mReason!)
        mAttendanceViewModelObj?.setUpdatedAttendanceToController(attendanceData: attendanceObj)
    }
    
    
    // function to perform action on click of Attendance cancel button
    @IBAction func attendanceCancelBtnPressed(_ sender: UIButton) {
        mAttendanceOutlet.attendanceCancelBtn?.isHidden = true
        mAttendanceOutlet.attendanceSaveBtn?.isHidden = true
        mCustomPicker.isUserInteractionEnabled = true
        mAttendanceOutlet.attendanceEditBtn?.imageView?.image = UIImage(named: "editbtn")
        mAttendanceCollectionView.isHidden = true
        mReasonView.isHidden = true
        mInOutTimeView.isHidden = true
    }
    
    
    // function to perform action on click of Attendance reason ok button
    @IBAction func attendanceReasonOkBtn(_ sender: UIButton) {
        mReasonView.isHidden = true
        mReason = mAttendanceOutlet.reasonTextView?.text
    }
    
    
    // MARK:settingValuesForViews
    // setting values for bank view
    func setBankData()
    {
        mBankOutlet.bankActivityIndicator?.isHidden = true
        mBankOutlet.bankActivityIndicator?.stopAnimating()
        mBankOutlet.mBankTextField1?.text = mBankViewModelObj?.bankvalues?.mAccNumber
        mBankOutlet.mBankTextField2?.text = mBankViewModelObj?.bankvalues?.mBankName
        mBankOutlet.mBankTextField3?.text = mBankViewModelObj?.bankvalues?.mBankIfscCode
        mBankOutlet.mBankTextField4?.text = mBankViewModelObj?.bankvalues?.mBankPan
        mBankOutlet.mBankTextField5?.text = mBankViewModelObj?.bankvalues?.mBankPaySalary
        mBankOutlet.mBankTextField6?.text = mBankViewModelObj?.bankvalues?.mReason
    }
    
    // setting values for personal view
    func setPersonalData()
    {
        mPersonalOutlet.personalActivityIndicator?.isHidden = true
        mPersonalOutlet.personalActivityIndicator?.stopAnimating()
        mPersonalOutlet.mPersonalTextField1?.text = engineerId
        mPersonalOutlet.mPersonalTextField2?.text = mPersonalViewModelVar?.mPersonalValues?.mEmailIdModel
        mPersonalOutlet.mPersonalTextField3?.text = mPersonalViewModelVar?.mPersonalValues?.mMobileModel
        mPersonalOutlet.mPersonalTextField4?.text = mPersonalViewModelVar?.mPersonalValues?.mDateOfBirthModel
        mPersonalOutlet.mPersonalTextField5?.text = mPersonalViewModelVar?.mPersonalValues?.mFatherNameModel
        mPersonalOutlet.mPersonalTextField6?.text = mPersonalViewModelVar?.mPersonalValues?.mFatherMobileModel
        mPersonalOutlet.mPersonalTextField7?.text = mPersonalViewModelVar?.mPersonalValues?.mOccupationModel
        mPersonalOutlet.mPersonalTextField8?.text = mPersonalViewModelVar?.mPersonalValues?.mAnnualSalaryModel
        mPersonalOutlet.mPersonalTextView9?.text = mPersonalViewModelVar?.mPersonalValues?.mMumbaiAddressModel
        mPersonalOutlet.mPersonalTextView10?.text = mPersonalViewModelVar?.mPersonalValues?.mPermenantAddress
        mPersonalOutlet.nameTextField?.text = mPersonalViewModelVar?.mPersonalValues?.mEmployeeNameModel
    }
    
    // setting values for profile view
    func setProfileData() {
        mProfileOutlet.profileActivityIndicator?.isHidden = true
        mProfileOutlet.profileActivityIndicator?.stopAnimating()
        mProfileOutlet.mProfileTextField1?.text = mProfileViewModelVar?.profileValues?.mDiploma
        mProfileOutlet.mProfileTextField2?.text = mProfileViewModelVar?.profileValues?.mDegree
        mProfileOutlet.mProfileTextField3?.text = mProfileViewModelVar?.profileValues?.mDiscipline
        mProfileOutlet.mProfileTextField4?.text = mProfileViewModelVar?.profileValues?.mYearOfPassing
        mProfileOutlet.mProfileTextField5?.text = mProfileViewModelVar?.profileValues?.mAggregate
        mProfileOutlet.mProfileTextField6?.text = mProfileViewModelVar?.profileValues?.mFinalYearPercentage
        mProfileOutlet.mProfileTextField7?.text = mProfileViewModelVar?.profileValues?.mTrainingInstitute
        mProfileOutlet.mProfileTextField8?.text = mProfileViewModelVar?.profileValues?.mTrainingDuration
        mProfileOutlet.mProfileTextView9?.text = mProfileViewModelVar?.profileValues?.mTraining
    }
    
    // setting values for tracking view
    func setTrackingData() {
        mTrackingOutlet.trakingActivityIndicator?.isHidden = true
        mTrackingOutlet.trakingActivityIndicator?.stopAnimating()
        mTrackingOutlet.mTrackingTextField1?.text = mTrackingViewModelObj?.mTrackingValues?.mTechStack
        mTrackingOutlet.mTrackingTextField2?.text = mTrackingViewModelObj?.mTrackingValues?.mStartDate
        mTrackingOutlet.mTrackingTextField3?.text = mTrackingViewModelObj?.mTrackingValues?.mEndDate
        mTrackingOutlet.mTrackingTextField4?.text = mTrackingViewModelObj?.mTrackingValues?.mCurrentWeek
        mTrackingOutlet.mTrackingTextField5?.text = mTrackingViewModelObj?.mTrackingValues?.mNoOfWeeksLeft
        mTrackingOutlet.mTrackingTextField6?.text = mTrackingViewModelObj?.mTrackingValues?.mWeek
    }
    
    // setting values for engineer view
    func setEnggInfoData() {
        mImageActivityIndicator.isHidden = true
        mImageActivityIndicator.stopAnimating()
        mEngineerInfoOutlet.engineerInfoActivityIndicator?.isHidden = true
        mEngineerInfoOutlet.engineerInfoActivityIndicator?.stopAnimating()
        mEngineerInfoOutlet.mEnggInfoLabel1?.text = engineerId
        mEngineerInfoOutlet.mEnggInfoLabel2?.text = mEnggInfoObj?.mEnggInfoValues?.mEmpStatus
        mEngineerInfoOutlet.mEnggInfoLabel3?.text = mEnggInfoObj?.mEnggInfoValues?.mCompany
        mEngineerInfoOutlet.mEnggInfoLabel4?.text = mEnggInfoObj?.mEnggInfoValues?.mMobile
        mEngineerInfoOutlet.mEnggInfoLabel5?.text = mEnggInfoObj?.mEnggInfoValues?.mEmailId
        mEngineerInfoOutlet.mEnggInfoLabel6?.text = mEnggInfoObj?.mEnggInfoValues?.mStartDate
        mEngineerInfoOutlet.mEnggInfoLabel7?.text = mEnggInfoObj?.mEnggInfoValues?.mCmpJoinDate
        mEngineerInfoOutlet.mEnggInfoLabel8?.text = mEnggInfoObj?.mEnggInfoValues?.mCmpLeaveDate
        mLeavesTaken = mEnggInfoObj?.mEnggInfoValues?.mLeaveTaken
        let leaveString = String(mLeavesTaken)
        mEngineerInfoOutlet.mEnggInfoLabel9?.text = leaveString
        mEmployeeNameLabel.text = mEnggInfoObj?.mEnggInfoValues?.mEmpName
        let image = mEnggInfoObj?.mEnggInfoValues?.mEmpImage
        if let url = NSURL(string: image!)
        {
            if let data = NSData(contentsOf: url as URL) {
                employeeImage.image = UIImage(data: data as Data)
            }
        }
        
    }
    
    // setting values for HR data view
    func sethrDataValues()
    {
        mHrDataOutlet.hrActivityIndicator?.isHidden = true
        mHrDataOutlet.hrActivityIndicator?.stopAnimating()
        mHrDataOutlet.mHrTextField1?.text = mHrDataViewModelVar?.mHrValues?.mHiringCityModel
        mHrDataOutlet.mHrTextField3?.text = mHrDataViewModelVar?.mHrValues?.mStartDateModel
        mHrDataOutlet.mHrTextField2?.text = mHrDataViewModelVar?.mHrValues?.mFellowshipPeriodModel
        mHrDataOutlet.mHrTextField4?.text = mHrDataViewModelVar?.mHrValues?.mCompanyJoinDateModel
        mHrDataOutlet.mHrTextField5?.text = mHrDataViewModelVar?.mHrValues?.mCompanyLeaveDateModel
        mHrDataOutlet.mHrTextField6?.text = mHrDataViewModelVar?.mHrValues?.mEnggContractSignedModel
        mHrDataOutlet.mHrTextField7?.text = mHrDataViewModelVar?.mHrValues?.mEnggContractInitiatedModel
        mHrDataOutlet.mHrTextField8?.text = mHrDataViewModelVar?.mHrValues?.mContractInitiatedModel
        mHrDataOutlet.mHrTextField9?.text = mHrDataViewModelVar?.mHrValues?.mContractSignedModel
        mHrDataOutlet.mHrTextField10?.text = mHrDataViewModelVar?.mHrValues?.mContractSignDateModel
        mHrDataOutlet.mHrTextField11?.text = mHrDataViewModelVar?.mHrValues?.mInitiateTransferModel
        mHrDataOutlet.companyTextField?.text = mHrDataViewModelVar?.mHrValues?.mCompanyModel
        mHrDataOutlet.employeeStatusTextField?.text = mHrDataViewModelVar?.mHrValues?.mEmployeeStatusModel
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
        
        switch indexPath.row {
            
            // case for Leave
            
        case AttendanceMarkCollectionViewEnum.LEAVE.rawValue:
            cell.markImage.image = UIImage(named: "L")
            break
            
            // case for company holiday
            
        case AttendanceMarkCollectionViewEnum.COMPANY_HOLIDAY.rawValue:
            cell.markImage.image = UIImage(named: "C")
            break
            
            // case for Present
            
        case AttendanceMarkCollectionViewEnum.PRESENT.rawValue:
            cell.markImage.image = UIImage(named: "ion-checkmark-round - Ionicons")
            break
            
            // case for unmark
            
        case AttendanceMarkCollectionViewEnum.UNMARK.rawValue:
            cell.markImage.image = UIImage(named: "ion-alert - Ionicons")
            break
            
        default:
            break
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        mAttendanceCollectionView.isHidden = true
        mAttendanceOutlet.attendanceCancelBtn?.isHidden = false
        mAttendanceOutlet.attendanceSaveBtn?.isHidden = false
        mMarkedStatus = true
        
        // if selected index is leave
        if indexPath.row == AttendanceMarkCollectionViewEnum.LEAVE.rawValue {
            mBlurView.isHidden = true
            mReasonView.isHidden = false
            mAttendanceOutlet.reasonTextView?.layer.borderColor = UIColor.gray.cgColor
            mAttendanceOutlet.reasonTextView?.layer.borderWidth = 1
            mAttendanceOutlet.reasonTextView?.layer.cornerRadius = 8
            mAttendanceOutlet.reasonViewDate?.text = mDate1
            mReasonView.layer.cornerRadius = 8
            mReasonView.layer.borderColor = UIColor.gray.cgColor
            mReasonView.layer.borderWidth = 0.2
            mReasonView.layer.shadowColor = UIColor.black.cgColor
            mReasonView.layer.shadowOffset = CGSize(width:0.0,height: 4.0)
            mReasonView.layer.shadowRadius = 2.0
            mReasonView.layer.shadowOpacity = 0.6
            mCellImage = UIImage(named: "L")
            mReasonView.superview?.bringSubview(toFront: mReasonView)
            mCheck0 = true
            mSelectedAttendance = "Leave"
            mReason = "NA"
            mInTime = "NA"
            mOutTime = "NA"
            
        }
        
        // if selected index is company holiday
        if indexPath.row == AttendanceMarkCollectionViewEnum.COMPANY_HOLIDAY.rawValue {
            mBlurView.isHidden = true
            mCheck1 = true
            mCellImage = UIImage(named: "C")
            mSelectedAttendance = "CompLeave"
            mReason = "NA"
            mInTime = "NA"
            mOutTime = "NA"
        }
        
        
        // if selected index is present
        if indexPath.row == AttendanceMarkCollectionViewEnum.PRESENT.rawValue {
            mBlurView.isHidden = true
            mCheck2 = true
            mInOutTimeView.isHidden = false
            mAttendanceOutlet.inOutVIewDate?.text = mDate1
            print("**********************",mDate1)
            mInOutTimeView.layer.cornerRadius = 8
            mInOutTimeView.layer.borderColor = UIColor.gray.cgColor
            mInOutTimeView.layer.borderWidth = 0.2
            mInOutTimeView.layer.shadowColor = UIColor.black.cgColor
            mInOutTimeView.layer.shadowOffset = CGSize(width:0.0,height: 4.0)
            mInOutTimeView.layer.shadowRadius = 2.0
            mInOutTimeView.layer.shadowOpacity = 0.6
            mInOutTimeView.superview?.bringSubview(toFront: mInOutTimeView)
            mCellImage = UIImage(named: "ion-checkmark-round - Ionicons")
            mSelectedAttendance = "Present"
            mReason = "NA"
        }
        
        
        // if selected index is unmark
        if indexPath.row == AttendanceMarkCollectionViewEnum.UNMARK.rawValue {
            mBlurView.isHidden = true
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
    func calendarReload(keysArr:[String],valArray:[AttendanceModel])
    {
        mAttendanceOutlet.attendanceActivityIndicator?.stopAnimating()
        mAttendanceOutlet.attendanceActivityIndicator?.isHidden = true
        self.mAttendanceKeys = keysArr
        self.mAttendanceValues = valArray
        print("******************",mAttendanceKeys!)
        print("&&&&&&&&&&&&&&&&&&",mAttendanceValues!)
        mCalenderView.reloadData()
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
        
        // check if date belongs to the month
        if cellState.dateBelongsTo == .thisMonth
        {
            mMyCustomCell.markImageView.isHidden = false
            mValueSet = false
            mMyCustomCell.dayLabel.textColor = UIColor(hexString: "#6FB8D9")
            if mDidSelectAttendanceDetails == true {
                let dateObj = DateFormatter()
                dateObj.dateFormat = "d"
                let dateString = dateObj.string(from: cellState.date)
                print(mAttendanceKeys?.count)
                if (mAttendanceKeys?.count)! != 0{
                    for i in 0..<mAttendanceKeys!.count{
                        let key = mAttendanceKeys?[i]
                        if dateString == key {
                            let value = mAttendanceValues?[i]
                            if value?.mAttendanceStatus == "Leave" && value?.mMarkedStatus == "true"
                            {
                                mMyCustomCell.markImageView.image = UIImage(named: "L")
                                self.mValueSet = true
                                
                            }
                            else if value?.mAttendanceStatus == "Present" && value?.mMarkedStatus == "true"
                            {
                                
                                mMyCustomCell.markImageView.image = UIImage(named: "ion-checkmark-round - Ionicons")
                                self.mValueSet = true
                            }
                                
                            else if value?.mAttendanceStatus == "CompLeave" && value?.mMarkedStatus == "true"
                            {
                                
                                mMyCustomCell.markImageView.image = UIImage(named: "C")
                                self.mValueSet = true
                            }
                                
                            else if value?.mAttendanceStatus == "Unmarked" && value?.mMarkedStatus == "false"
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
        
        
        // check if the cell is selected
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
        mCustomPicker.isUserInteractionEnabled = false
        if cellState.dateBelongsTo == .thisMonth {
            if mdidSelectEditBtn == false {
                mAttendancePopupOutlet.layer.cornerRadius = 8
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
                        mAttendancePopupOutlet.inTimeLabel.text = values?.mPunchIn
                        mAttendancePopupOutlet.outTimeLabel.text = values?.mPunchOut
                        mAttendancePopupOutlet.leaveReasonTextView.text = values?.mReason
                        mAttendancePopupOutlet.markedStatusLabel.text = values?.mMarkedStatus
                        mAttendancePopupOutlet.attendanceStatusLabel.text = values?.mAttendanceStatus
                        mAttendancePopupOutlet.dateLabel.text = mDate1
                        mAttendancePopupOutlet.isHidden = false
                        self.mBlurView.isHidden = false
                    }
                    
                }
                
                if mdateFound == false {
                    mAttendancePopupOutlet.isHidden = true
                    mBlurView.isHidden = true
                    
                }
                mAttendancePopupOutlet.isUserInteractionEnabled = false
                view.isUserInteractionEnabled = true
                self.addGestureRecogniser()
                mCustomPicker.isUserInteractionEnabled = true
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
                mAttendanceCollectionView.isHidden = false
                mBlurView.isHidden = false
                mdidSelectEditBtn = false
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
            self.mAttendanceViewModelObj?.fetchMonthlyAttendanceFromController(timeStamp: self.mTimeStamp!)
            self.mDidSelectAttendanceDetails = true
            self.mDateChange = true
        }
        
    }
}








