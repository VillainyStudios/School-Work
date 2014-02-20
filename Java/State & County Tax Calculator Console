import java.util.Scanner;
import java.text.DecimalFormat;

public class PrestonPgm02b {
	public static void main(String[] args){
		
		// Variables
		double purchasePrice = 0;
		double stateTax = 0.04;
		double countyTax = 0.02;
		
		// Decimal formatting for two places
		DecimalFormat df = new DecimalFormat("#.00");
		
		// Create keyboard scanner
		Scanner keyboard = new Scanner(System.in);
		
		// Get purchase price
		System.out.println("What is the cost of the item?");
		purchasePrice = keyboard.nextDouble();

		// Variables for calculations
		double purchaseState = (purchasePrice * stateTax);
		double purchaseCounty = (purchasePrice * countyTax);
		double totalTax = (purchaseState + purchaseCounty);
		double totalPurchase = (purchasePrice + totalTax);
		
		// Output of purchase and taxes
		System.out.println ( "The purchase price is $" + df.format(purchasePrice) + "." );
		System.out.println ( "The state sales tax is $" + df.format(purchaseState) + "." );
		System.out.println ( "The county tax is $" + df.format(purchaseCounty) + "." );
		System.out.println ( "The total sales tax is $" + df.format(totalTax) + ".") ;
		System.out.println ( "The total purchase price is $" + df.format(totalPurchase) + "." );
	}
}	
