import java.awt.event.*;
import java.awt.*;
import javax.swing.*;
import javax.swing.JPanel;

public class UpdateCoordsHelper extends JPanel implements Runnable{
	private int seconds;
	private JLabel timerLabel;
	private Color originalColor;
	private Timer secTimer;
	private boolean started = false;
	private static String updatingItem = "";
	private static JFrame mainFrame;

	public UpdateCoordsHelper(String item, JFrame frame)
	{
		updatingItem = item;
		mainFrame = frame;
		mainFrame.setLocationRelativeTo(null);
	}

	public void startTimer()
	{
		seconds = 6;
		JPanel panel = new JPanel();
		panel.setSize(412, 159);
		timerLabel = new JLabel("0");
		timerLabel.setFont(new Font("Tahoma", Font.PLAIN, 16));
		originalColor = timerLabel.getForeground();
		secTimer = new Timer(1000,new ActionListener() 
		{
			@Override
			public void actionPerformed(ActionEvent e) 
			{
				if(started){
					if(seconds == 0)
					{
						mainFrame.dispose();
						CoordinatesManager.updateCoordinatesBehindScenes(updatingItem);
						secTimer.stop();
					}
					//Change the color when 5 seconds remain
					if((seconds <= 5 && seconds > 0)){
						timerLabel.setForeground(Color.RED);
					}
					if(seconds > 0)
					{
						seconds--;
						timerLabel.setText("Updating "  + updatingItem + " in " + seconds + " seconds");
					}
					else
					{
						seconds = 60;
						seconds--;
						timerLabel.setText("Updating "  + updatingItem + " in " + seconds + " seconds");
					}
				}
			}
		});
		timerLabel.setText("Updating "  + updatingItem + " in " + seconds + " seconds");
		timerLabel.setForeground(originalColor);
		started = true;
		secTimer.start();//starts the timer
		panel.add(timerLabel);
		add(panel,BorderLayout.CENTER);
		while(secTimer.isRunning())//if this is removed, the thread will continue at the wrong time. IMPORTANT TO KEEP!
		{
			
		}
	}
	
	public void run()//called from coords manager and starts the timer above ^^^
	{
		startTimer();
	}
}
