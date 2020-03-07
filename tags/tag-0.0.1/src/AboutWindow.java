import java.awt.BorderLayout;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class AboutWindow 
{
	public static void createAboutWindow()
	{
		JFrame frmAboutBox = new JFrame();
		frmAboutBox.setResizable(false);
		frmAboutBox.setSize(412, 159);
		frmAboutBox.setTitle("About ToonTown Rewritten Bot by primetime43");
		frmAboutBox.setVisible(true);
		frmAboutBox.setAlwaysOnTop(true);
		JLabel info = new JLabel();
		JLabel test = new JLabel();
		info.setText("<html><br>- ToonTown Rewritten Bot<br>- Version 1.3<br>- Programmed by primetime43<br></html>");
		info.setHorizontalAlignment(JLabel.CENTER);
		frmAboutBox.add(info, BorderLayout.NORTH);
		test.setText("<html>This program is a bot that will perform certain time consuming tasks<br> on ToonTown Rewritten.</html>");
		test.setHorizontalAlignment(JLabel.CENTER);
		frmAboutBox.add(test, BorderLayout.CENTER);
		info.setVisible(true);
		test.setVisible(true);
	}
	
	public static void createHelpWindow()
	{
		JFrame frmAboutBox = new JFrame();
		frmAboutBox.setResizable(false);
		frmAboutBox.setSize(412, 159);
		frmAboutBox.setTitle("Help Information");
		frmAboutBox.setVisible(true);
		frmAboutBox.setAlwaysOnTop(true);
		JLabel info = new JLabel();
		JLabel test = new JLabel();
		info.setText("<html><br>Notice: You will only have to teach the bot once<br> (first time loading the program on PC), <br>unless you reset your coordinates!</html>");
		info.setHorizontalAlignment(JLabel.CENTER);
		frmAboutBox.add(info, BorderLayout.NORTH);
		test.setText("<html>Contact Info:<br> Skype: drprimetime43</html>");
		test.setHorizontalAlignment(JLabel.CENTER);
		frmAboutBox.add(test, BorderLayout.CENTER);
		info.setVisible(true);
		test.setVisible(true);
	}
}
