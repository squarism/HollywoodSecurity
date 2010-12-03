public class UnauthorizedState implements GameState {

	boolean authorized = false;
	
	// key handling
	boolean pressedEnter = false;
	
	// our magic key
	String password = "muffin";
	
	String buffer = new String();
	
	// best stack with push I can think of -- grr, bloated
	ArrayList inputArray = new ArrayList();
	
	
	public GameState nextState () {
		if (authorized) {
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
				authorized = true;
			} else {
				// they hit enter with a bad password
				println("Wrong password:" + buffer);
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
				default: buffer = buffer + key;
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

}