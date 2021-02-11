

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var record: UILabel! //紀錄label
    @IBOutlet weak var enterNumber: UITextField! //輸入匡
    @IBOutlet weak var decideButton: UIButton!//確定按鈕
    @IBOutlet weak var playingButtonView: UIButton! //開始遊戲按鈕
  
    
    var arayNumber = [String]() //存數字1~9
    var answer = [String]()//存從arayNumber 隨機拉出來的4個數字
    var wrongAnswerArray = [String]() //存歷史紀錄的array
    //存位置正確、數字正確的數量
    var a = 0
    var b = 0
    
    //創造題目
    func createPotic(){
        for i in 1...9{
            let j = "\(i)"
            arayNumber.append(j)
            
        }
    }
    //創造答案
    func createAnswer(){
        //打亂存題目的arry
        arayNumber.shuffle()
        //答案 ＝ arayNumber隨機四個值文字相加
        for i in 0...3{
            answer.append(arayNumber[i])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        decideButton.alpha = 0 //確定按鈕消失
   
    }
    //開始遊戲按鈕
    @IBAction func playing(_ sender: UIButton) {
        decideButton.alpha = 1 //確定按鈕出現
        playingButtonView.alpha = 0 //開始遊戲按鈕消失
        //出現題目
        createPotic()
        //出現答案
        createAnswer()
       
    }
    //確定按鈕
    @IBAction func starting(_ sender: UIButton) {
        
        let enternumbers = enterNumber.text //存輸入的數字
        //確保有輸入四個數字
        if enternumbers!.count == 4{ //如果輸入的字最大數 等於 4
            var i = 0
            for j in enternumbers!{
                let number = String(j)
                
                if answer[i] == number{
                    a += 1
                    
                }else if answer.contains(number){
                    b += 1
                }
                i += 1
                
                if a == 4{
                    decideButton.alpha = 0
                }
                
            }
            let historyNumber = enternumbers!+" \(a) A"+" \(b) B"  //存每次輸入後的結果
            wrongAnswerArray.append(historyNumber)
            a = 0
            b = 0
        }
        //歷史紀錄區
        record.text = ""
                for number in wrongAnswerArray{
                    record.text = record.text! + number + "\n"
                    
                }
         
        
        
            
        
    }
    
}

