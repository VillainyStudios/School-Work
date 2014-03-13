import java.util.Scanner;
import java.text.DecimalFormat;
import javax.swing.JOptionPane;

public class PrestonPgm02bDialog {
	public static void main(String[] args){
		
		// Variables
		String purchaseInput;
		double purchasePrice = 0;
		double stateTax = 0.04;
		double countyTax = 0.02;
		
		// Decimal formatting for two places
		DecimalFormat df = new DecimalFormat("#.00");
		
		// Create keyboard scanner
		Scanner keyboard = new Scanner(System.in);
		
		// Get purchase price
		purchaseInput = JOptionPane.showInputDialog("What is the cost of the item?");
		
		// Convert purchaseInput to a double
		purchasePrice = Double.parseDouble(purchaseInput);
		
		// Variables for calculations
		double purchaseState = (purchasePrice * stateTax);
		double purchaseCounty = (purchasePrice * countyTax);
		double totalTax = (purchaseState + purchaseCounty);
		double totalPurchase = (purchasePrice + totalTax);
		
		// Output of purchase and taxes
		JOptionPane.showMessageDialog (null, " The purchase price is $" + df.format(purchasePrice) + ".\n The state sales tax is $" + df.format(purchaseState) + ".\n The county tax is $" + df.format(purchaseCounty) + ".\n The total sales tax is $" + df.format(totalTax) + ".\n The total purchase price is $" + df.format(totalPurchase) + "." );
	}
}
