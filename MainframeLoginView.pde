public class MainframeLoginView implements GameView {

	int centerY;
	int centerX;
	
	int[] greenScreen = new int[3];
	
	// Bounding box for title login screen
	int[] banner = new int[4];
	int[] bannerInside = new int[4];
	
	// Bounding box for the password prompt
	int[] login = new int[4];
	
	String bannerText = "Mainframe Access";
	String warningText = "warning: top secret personnel only";
	String loginText = "Enter password:";
	
	UnauthorizedState uas;
	
	// store frames counter for delay when done
	// TODO: controller should do this
	int doneFrames = 0;
	
	// scanlines overlay buffer
	PImage scanLines;
	
	// for cursor blink
	boolean cursor;				// blink state
	int cursorFramesI;		// frame count
	int cursorBlinkRate;	// rate of blink state changing
	
	
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
		
		greenScreen[0] = 40;
		greenScreen[1] = 200;
		greenScreen[2] = 40;
		
		cursor = true;
		cursorFramesI = 1;
		cursorBlinkRate = 60;
		
		scanLines = genScanLines();
	}

	public void paint() {
		game.viewDone = false;
		background(0);
		
		rectMode(CENTER);
		strokeWeight(2);
		stroke(greenScreen[0], greenScreen[1], greenScreen[2]);
		
		// inside border
		fill(0,0,0,0);
		rect(banner[0], banner[1], banner[2], banner[3]);
		
		// outside border
		fill(0,0,0,0);
		strokeWeight(16);
		rect(banner[0], banner[1], banner[2] + 20, banner[3] + 20);
		
		// green text

		fill(greenScreen[0], greenScreen[1], greenScreen[2]);
		textFont(proggyClean, 32);
		text(bannerText, banner[0] - bannerText.length() * 32/4 + 16, banner[1] + 5);
		
		// red warning banner up top
		textFont(proggyClean, 16);
		//fill(205,80,80);
		text(warningText, banner[0] - warningText.length() * 16/4 + 8, 16);
		strokeWeight(1);
		line(0, 20, getSize().width, 20);
		
		// password box
		//stroke(255);
		fill(255,255,255,20);
		rect(login[0], login[1], login[2], login[3]);
		
		// password box label
		textFont(proggyClean, 32);
		//fill(255);
		fill(greenScreen[0], greenScreen[1], greenScreen[2]);
		text(loginText, login[0] - loginText.length() * 32/4 + 16, login[1] - login[3]);
		
		//println(game.state);
		uas = (UnauthorizedState)game.state;
		if (uas.getGuesses() > 0) {
			this.loginText = "Access Denied";
		} else if (uas.authorized) {
			this.loginText = "Access Granted";
			//delay(1000);
			doneFrames++;
			//game.viewDone = true;
		}
		
		// password text in password box
		rectMode(CENTER);
		text(uas.buffer, login[0] - login[2]/2 + 8, login[1]+8);
		
		
		// cursor blinking
		if ( (cursorFramesI % cursorBlinkRate) == 0) {
			cursorFramesI = 1;
			cursor = !cursor;
		} else {
			cursorFramesI++;
		}
		
		if (cursor) {
			strokeWeight(5);
			line(16,25,25,25);
		}
		
		// a slight delay going out of transition
		if (doneFrames > 60) {
			game.viewDone = true;
		}
		
		// overlay scanlines last
		tint(255,255,255,120);
		image(scanLines, 0, 0, scanLines.width, scanLines.height);
	}
	
	PImage genScanLines() {
		PGraphics sl = createGraphics(width, height, P2D);

		int lineSize = 1;
		sl.beginDraw();
		sl.stroke(0,0,0,20);

		for (int i=0; i < height; i+=lineSize * 2) {
			sl.line(0,i,width,i);
		}
		sl.endDraw();
		return sl;
	}
	

}