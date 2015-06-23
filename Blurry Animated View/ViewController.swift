import UIKit

class ViewController: UIViewController {
	
	// Link the UIWebView to the ViewController file. It's delegate is ViewController, set in Interface Builder.
	@IBOutlet var animationFrame: UIWebView!
	
	// Link the other elements that we need.
	@IBOutlet weak var userName: UITextField! // USERNAME
	@IBOutlet weak var passWord: UITextField! // PASSWORD
	@IBOutlet weak var loginButton: UILabel! // LOGIN
	@IBOutlet weak var signupButton: UILabel! // SIGNUP
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Load the file into the UIWebView
		let animation = NSBundle.mainBundle().URLForResource("magma-loop", withExtension: "gif");
		let request = NSURLRequest(URL: animation!);
		animationFrame.loadRequest(request);
	}
	
	// Keyboard actions.
	func textFieldShouldReturn(textField: UITextField!){
		if userName.isFirstResponder() == true { // Go to PASSWORD field if currently in the USERNAME field.
			userName.resignFirstResponder()
			passWord.becomeFirstResponder()
		} else { // Hide the keyboard and check the account details.
			passWord.resignFirstResponder()
			checkAccountInfo(UITextField)
		}
	}
	
	// Check the account details. Incredibly simple stuff since this project is about blurry animated views.
	@IBAction func checkAccountInfo(sender: AnyObject) {
		let userText = userName.text
		let passText = passWord.text
		
		if ((userText == "guest") && (passText == "password")) {
			let alert = UIAlertController(title: "Login Success", message: "You either looked at the code, or you are really good at guessing.", preferredStyle: UIAlertControllerStyle.Alert)
			alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
			self.presentViewController(alert, animated: true, completion: nil)
		} else {
			let alert = UIAlertController(title: "Login Failure", message: "Oppsie-daisy! Looks like you'll need to think harder!", preferredStyle: UIAlertControllerStyle.Alert)
			alert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
			self.presentViewController(alert, animated: true, completion: nil)
		}
	}
	
	// Hide the keyboard when touching outside of the UITextFields.
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
		view.endEditing(true)
		super.touchesBegan(touches, withEvent: event)
	}
	
	// OPTIONALS:
	
	// Set the statusbar color to white. If you are using a bright or light-colored image then you can just remove this.
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return UIStatusBarStyle.LightContent
	}
}