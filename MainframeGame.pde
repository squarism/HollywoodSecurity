public class MainframeGame extends Game implements GameInterface {

	public MainframeGame() {
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
	
}