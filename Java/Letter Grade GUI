import java.util.Scanner;
import javax.swing.JOptionPane;

public class PrestonPgm03Switch {
	
	public static void main (String args[]) {
	
		//Variable
		int testScore = 0;
		String testInput;
				
		// Create keyboard scanner
		Scanner keyboard = new Scanner(System.in);
		
		// Get test score
		testInput = JOptionPane.showInputDialog("What is your average test score?");
		
		// Convert testInput to a integer
		testScore = Integer.parseInt(testInput);
		
		//Assign letter grade
		switch ((int) testScore/10) {
			case 10:
			case 9:
				JOptionPane.showMessageDialog(null, "Your average test score is an 'A'!");
				break;
			case 8:
				JOptionPane.showMessageDialog(null, "Your average test score is an 'B'!");
				break;
			case 7:
				JOptionPane.showMessageDialog(null, "Your average test score is an 'C'!");
				break;
			case 6:
				JOptionPane.showMessageDialog(null, "Your average test score is an 'D'!");
				break;
			default:
				JOptionPane.showMessageDialog(null, "Your average test score is an 'F!");
				break;
		}
	}
}

