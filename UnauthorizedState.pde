public class UnauthorizedState implements GameState {

	boolean authorized = false;
	
	// key handling
	boolean pressedEnter = false;
	
	// our magic key
	String password = "muffin";
	
	String buffer = new String();
	
	// guess attempts
	int guesses = 0;
	
	public GameState nextState () {
		if (authorized && game.viewDone) {
			AuthorizedState authorizedState = new AuthorizedState();
			println("changing game state to auth state");
			return authorizedState;
		} else {
			return this;
		}
	}
	
	// if they press any key
	public void keyPressed() {		
		if (keyCode == KeyEvent.VK_ENTER) {
			// they hit enter and got the password right
			if (buffer.equals(password)) {
				println("Good password.");
				guesses = 0;
				authorized = true;
			} else {
				// they hit enter with a bad password
				println("Wrong password:" + buffer);
				guesses++;
				buffer = "";
			}
		} else {
			// they haven't hit enter yet, keep gathering text

			// ignore keys
			switch (keyCode) {
				case KeyEvent.VK_SHIFT: break;
				case KeyEvent.VK_CONTROL: break;
				case KeyEvent.VK_META: break;
				case KeyEvent.VK_ALT: break;
				case KeyEvent.VK_SPACE: break;
				case BACKSPACE: handleBackspace(); break;
				default: 
					if (buffer.length() < 12) {
						buffer = buffer + key;
					}
			}			
		}

		/*
		if (keyCode == KeyEvent.VK_H) {
			//key = 0;
			println("You pressed H.  This is UnauthorizedState.");
			//authorized = true;
		}
		*/
	}
		
	public void keyReleased() {

	}
	
	public void update() {
		//println("unauth state update");
	}
	
	public boolean isAuthorized() {
		return this.authorized;
	}
	
	public int getGuesses() {
		return guesses;
	}
	
	public void handleBackspace() {
		if (buffer.length() > 0) {
			buffer = buffer.substring(0,buffer.length()-1);
		}
	}

}