import java.util.Scanner;

public class PrestonPgm04 {
	
	public static void main (String args[]) {

		// Variables
		int repeat = 0;
		String character = "";
		
		// Create keyboard scanner
		Scanner keyboard = new Scanner(System.in);
		
		// Get user character and repeat
		System.out.print("Please enter a character to draw with.     ");
		character = keyboard.next();
		
		System.out.print("Please enter a number between 1 and 10.    ");
		repeat = keyboard.nextInt();
		
		// For loop to draw 13
		System.out.println("13:");
		for (int i=repeat; i>=1; i--)
		{
			for (int j=1; j<=i; j++)
			{
				System.out.print(character);
			} // End inner For loop
			System.out.println();
		} //End outer For loop
		
		// For loop to draw 14
		System.out.println("14:");
		for (int i=1; i<=repeat; i++)
		{
			System.out.print(character);
			for (int j=2; j<=i; j++)
			{
				System.out.print("-");
			} // End inner For loop
			System.out.println(character);
		} //End outer For loop
	} 
} 
