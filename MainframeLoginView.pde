public class MainframeLoginView implements GameView {

	int centerY;
	int centerX;
	
	// Bounding box for title login screen
	int[] banner = new int[4];
	int[] bannerInside = new int[4];
	
	// Bounding box for the password prompt
	int[] login = new int[4];
	
	String bannerText = "Mainframe Access";
	String warningText = "warning: top secret personnel only";
	String loginText = "Enter password:";
	
	UnauthorizedState uas;
	
	int doneFrames = 0;
	
	
	public MainframeLoginView() {
		this.centerX = getSize().width/2;
		this.centerY = getSize().height/2;
		
		banner[0] = centerX;						// X
		banner[1] = centerY - (centerY / 3);		// Y
		banner[2] = getSize().width - 40; 			// width
		banner[3] = centerY / 4;					// height
		
		login[0] = centerX;							// X
		login[1] = centerY + (centerY / 4);			// Y
		login[2] = getSize().width / 3;				// width
		login[3] = centerY / 6;						// height
		
		println(banner[0]);
		println(banner[1]);
	}

	public void paint() {
		game.viewDone = false;
		background(0);
		
		rectMode(CENTER);
		strokeWeight(3);
		stroke(80,205,80);
		
		// inside border
		fill(0,0,0,0);
		rect(banner[0], banner[1], banner[2], banner[3]);
		
		// outside border
		fill(0,0,0,0);
		rect(banner[0], banner[1], banner[2] + 20, banner[3] + 20);
		
		fill(80,205,80);
		textFont(proggyClean, 32);
		text(bannerText, banner[0] - bannerText.length() * 32/4 + 16, banner[1] + 5);
		
		// red warning banner up top
		textFont(proggyClean, 16);
		fill(205,80,80);
		text(warningText, banner[0] - warningText.length() * 16/4 + 8, 16);
		
		// password box
		stroke(255);
		fill(255,255,255,20);
		rect(login[0], login[1], login[2], login[3]);
		
		// password box label
		textFont(proggyClean, 32);
		fill(255);
		text(loginText, login[0] - loginText.length() * 32/4 + 16, login[1] - login[3]);
		
		//println(game.state);
		uas = (UnauthorizedState)game.state;
		if (uas.getGuesses() > 0) {
			this.loginText = "WRONG!";
		} else if (uas.authorized) {
			this.loginText = "Access Granted";
			//delay(1000);
			doneFrames++;
			//game.viewDone = true;
		}
		
		// a slight delay going out of transition
		if (doneFrames > 60) {
			game.viewDone = true;
		}
		
	}

}