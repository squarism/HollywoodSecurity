public class MainframeGame extends Game {

	public MainframeGame() {
	}
	
	// can't put this in the constructor because the view needs to init
	// and know about the state -- grr
	public void init() {
		super.init();
		super.view = new MainframeLoginView();
		super.state = new UnauthorizedState();
	}
	
	public void run() {
		super.run();

		// TODO: class name based view switching?  is this stupid?
		if (super.state instanceof AuthorizedState) {
			super.view = new MainframeNOCListView();
		}
	}
	
	public GameState getState() {
		return super.state;
	}
	
	public GameView getView() {
		return super.view;
	}
	
}