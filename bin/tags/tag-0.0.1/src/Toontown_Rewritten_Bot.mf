import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import javax.swing.event.*;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.LayoutStyle.ComponentPlacement;

public class Toontown_Rewritten_Bot extends BotFunctions
{

	private JFrame frmToontownRewrittenBot;
	private Thread fishingThread;
	private boolean fishingVariance = false;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Toontown_Rewritten_Bot window = new Toontown_Rewritten_Bot();
					new BotFunctions();
					new Plants();
					new Golf();
					new DoodleTraining();
					window.frmToontownRewrittenBot.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		createCoordinateFile();
	}

	/**
	 * Create the application.
	 */
	public Toontown_Rewritten_Bot() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private static JComboBox comboBoxCoordinates = new JComboBox();
	private static CoordinatesManager coordinateFile;
	private JTextField textBoxSendMessage;
	private BotFunctions botFuncObj;
	private DoodleTraining doodleTrainingObj;
	private Thread botFuncThread;
	private Thread doodleTrainingThread;

	private void initialize() 
	{
		frmToontownRewrittenBot = new JFrame();
		frmToontownRewrittenBot.setTitle("Toontown Rewritten Bot by primetime43");
		frmToontownRewrittenBot.setResizable(true);
		frmToontownRewrittenBot.setSize(491, 348);
		frmToontownRewrittenBot.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		JTabbedPane tabbedPane = new JTabbedPane(JTabbedPane.TOP);
		frmToontownRewrittenBot.getContentPane().add(tabbedPane, BorderLayout.CENTER);

		JPanel panelMain = new JPanel();
		tabbedPane.addTab("Main", null, panelMain, null);

		JLabel lblNewLabel = new JLabel("Note: Keep Toontown Rewritten's screen full screen");
		lblNewLabel.setFont(new Font("Tahoma", Font.PLAIN, 12));

		JButton btnAbout = new JButton("About");
		btnAbout.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				AboutWindow.createAboutWindow();
			}
		});
		btnAbout.setFont(new Font("Tahoma", Font.PLAIN, 12));

		JButton btnHelp = new JButton("Help");
		btnHelp.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				AboutWindow.createHelpWindow();
			}
		});
		btnHelp.setFont(new Font("Tahoma", Font.PLAIN, 12));
		
		JButton btnDefaultSize = new JButton("Restore Default Size");
		btnDefaultSize.setFont(new Font("Tahoma", Font.PLAIN, 12));
		btnDefaultSize.setToolTipText("Resets the window size of the application to the default size.");
		btnDefaultSize.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				frmToontownRewrittenBot.setSize(491, 348);
			}
		});
		GroupLayout gl_panelMain = new GroupLayout(panelMain);
		gl_panelMain.setHorizontalGroup(
			gl_panelMain.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panelMain.createSequentialGroup()
					.addGap(40)
					.addComponent(btnAbout, GroupLayout.PREFERRED_SIZE, 193, GroupLayout.PREFERRED_SIZE)
					.addPreferredGap(ComponentPlacement.UNRELATED)
					.addComponent(btnHelp, GroupLayout.PREFERRED_SIZE, 200, GroupLayout.PREFERRED_SIZE)
					.addContainerGap(27, Short.MAX_VALUE))
				.addGroup(gl_panelMain.createSequentialGroup()
					.addContainerGap(86, Short.MAX_VALUE)
					.addComponent(lblNewLabel)
					.addGap(94))
				.addGroup(gl_panelMain.createSequentialGroup()
					.addContainerGap()
					.addComponent(btnDefaultSize, GroupLayout.PREFERRED_SIZE, 155, GroupLayout.PREFERRED_SIZE)
					.addContainerGap(305, Short.MAX_VALUE))
		);
		gl_panelMain.setVerticalGroup(
			gl_panelMain.createParallelGroup(Alignment.TRAILING)
				.addGroup(gl_panelMain.createSequentialGroup()
					.addContainerGap()
					.addComponent(btnDefaultSize, GroupLayout.PREFERRED_SIZE, 34, GroupLayout.PREFERRED_SIZE)
					.addPreferredGap(ComponentPlacement.RELATED, 122, Short.MAX_VALUE)
					.addComponent(lblNewLabel)
					.addPreferredGap(ComponentPlacement.UNRELATED)
					.addGroup(gl_panelMain.createParallelGroup(Alignment.BASELINE)
						.addComponent(btnHelp, GroupLayout.PREFERRED_SIZE, 77, GroupLayout.PREFERRED_SIZE)
						.addComponent(btnAbout, GroupLayout.PREFERRED_SIZE, 77, GroupLayout.PREFERRED_SIZE))
					.addContainerGap())
		);
		panelMain.setLayout(gl_panelMain);

		JPanel panelFishing = new JPanel();
		tabbedPane.addTab("Fishing", null, panelFishing, null);

		JInternalFrame internalFrameFishingLocations = new JInternalFrame("Fishing Locations");
		internalFrameFishingLocations.setVisible(true);

		JLabel lblCastsRemaining = new JLabel("Number Of Casts Remaining");
		lblCastsRemaining.setFont(new Font("Tahoma", Font.PLAIN, 12));
		lblCastsRemaining.setVisible(false);

		JLabel lblSellsRemaining = new JLabel("Number Of Sells Remaining");
		lblSellsRemaining.setVisible(false);
		lblSellsRemaining.setFont(new Font("Tahoma", Font.PLAIN, 12));
		GroupLayout gl_panelFishing = new GroupLayout(panelFishing);
		gl_panelFishing.setHorizontalGroup(
				gl_panelFishing.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panelFishing.createSequentialGroup()
						.addGroup(gl_panelFishing.createParallelGroup(Alignment.LEADING)
								.addComponent(internalFrameFishingLocations, GroupLayout.PREFERRED_SIZE, 396, GroupLayout.PREFERRED_SIZE)
								.addGroup(gl_panelFishing.createSequentialGroup()
										.addGap(23)
										.addGroup(gl_panelFishing.createParallelGroup(Alignment.LEADING)
												.addComponent(lblSellsRemaining)
												.addComponent(lblCastsRemaining))))
												.addContainerGap(84, Short.MAX_VALUE))
				);
		gl_panelFishing.setVerticalGroup(
				gl_panelFishing.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panelFishing.createSequentialGroup()
						.addComponent(internalFrameFishingLocations, GroupLayout.PREFERRED_SIZE, 213, GroupLayout.PREFERRED_SIZE)
						.addPreferredGap(ComponentPlacement.UNRELATED)
						.addComponent(lblCastsRemaining)
						.addPreferredGap(ComponentPlacement.UNRELATED)
						.addComponent(lblSellsRemaining)
						.addContainerGap(26, Short.MAX_VALUE))
				);

		JComboBox comboBoxFishingLocation = new JComboBox();
		comboBoxFishingLocation.setModel(new DefaultComboBoxModel(new String[] {"TOONTOWN CENTRAL PUNCHLINE PLACE", "DONALD DREAM LAND LULLABY LANE", "BRRRGH POLAR PLACE", "BRRRGH WALRUS WAY", "BRRRGH SLEET STREET", "MINNIE'S MELODYLAND TENOR TERRACE", "DONALD DOCK LIGHTHOUSE LANE", "DAISY'S GARDEN ELM STREET", "FISH ANYWHERE"}));
		comboBoxFishingLocation.setSelectedIndex(0);
		comboBoxFishingLocation.setToolTipText("Select the location you wish to fish");
		comboBoxFishingLocation.setFont(new Font("Tahoma", Font.PLAIN, 12));

		SpinnerModel modelForCasts = new SpinnerNumberModel(1, 1, 20, 1);//use this to set range values to spinners
		JSpinner spinnerCastNum = new JSpinner(modelForCasts);//spinner value for settings the number of casts
		spinnerCastNum.setToolTipText("This number indicates the number of times to cast your fishing rod");
		spinnerCastNum.setFont(new Font("Tahoma", Font.PLAIN, 12));

		JLabel lblNumOfCasts = new JLabel("Number of Casts:");
		lblNumOfCasts.setFont(new Font("Tahoma", Font.PLAIN, 12));

		JLabel lblNumOfSells = new JLabel("Number of Sells:");
		lblNumOfSells.setFont(new Font("Tahoma", Font.PLAIN, 12));

		SpinnerModel modelForSells = new SpinnerNumberModel(1, 1, 50, 1);//use this to set range values to spinners
		JSpinner spinnerSellsNum = new JSpinner(modelForSells);//spinner value for settings the number of sells to fisherman
		spinnerSellsNum.setToolTipText("This number indicates the number of times to go to the fisherman to sell the fish");
		spinnerSellsNum.setFont(new Font("Tahoma", Font.PLAIN, 12));

		JCheckBox chckbxSmartFishing = new JCheckBox("Smart Fishing");
		chckbxSmartFishing.setToolTipText("Fishes by searching for the shadows, instead of just casting the line");
		chckbxSmartFishing.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				if(chckbxSmartFishing.isSelected())
				{
					showMessageBox("Will be added later!");
					chckbxSmartFishing.setSelected(false);
				}
			}
		});
		chckbxSmartFishing.setFont(new Font("Tahoma", Font.PLAIN, 12));

		JCheckBox chckbxRandomVariance = new JCheckBox("Random Variance");
		chckbxRandomVariance.setToolTipText("This add some randomness and will make it so you \r\nwon't cast your line at the same spot every time!");
		chckbxRandomVariance.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				if(chckbxRandomVariance.isSelected())
					fishingVariance = true;
				else
					fishingVariance = false;
			}
		});
		chckbxRandomVariance.setFont(new Font("Tahoma", Font.PLAIN, 12));

		JButton btnStartFishing = new JButton("Start Fishing");
		btnStartFishing.addActionListener(new ActionListener() //start fishing button is clicked
		{
			String selectedFishingLocation = "";
			int numOfCasts = 0;
			int numOfSells = 0;
			public void actionPerformed(ActionEvent e) 
			{
				selectedFishingLocation = comboBoxFishingLocation.getSelectedItem().toString();
				numOfCasts = (int) spinnerCastNum.getValue();
				numOfSells = (int) spinnerSellsNum.getValue();
				tellFishingLocation(selectedFishingLocation);
				showMessageBox("Make sure you're in the fishing dock before pressing OK!");
				Runnable r = new Fishing(selectedFishingLocation, numOfCasts, numOfSells, fishingVariance, lblCastsRemaining, lblSellsRemaining);
				fishingThread = new Thread(r);
				fishingThread.start();
			}
		});
		btnStartFishing.setFont(new Font("Tahoma", Font.PLAIN, 12));

		JButton btnStopFishing = new JButton("Stop Fishing");
		btnStopFishing.addActionListener(new ActionListener() //stop fishing button is clicked
		{
			public void actionPerformed(ActionEvent e) 
			{
				if(fishingThread != null)//will throw null error if user presses stop fishing without ever starting, therefore this if is required here to check for the null.
				{
					fishingThread.stop();
					showMessageBox("Fishing stopped!");
				}
			}
		});
		btnStopFishing.setFont(new Font("Tahoma", Font.PLAIN, 12));
		GroupLayout groupLayout_3 = new GroupLayout(internalFrameFishingLocations.getContentPane());
		groupLayout_3.setHorizontalGroup(
				groupLayout_3.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout_3.createSequentialGroup()
						.addContainerGap()
						.addGroup(groupLayout_3.createParallelGroup(Alignment.LEADING)
								.addGroup(groupLayout_3.createSequentialGroup()
										.addComponent(btnStartFishing, GroupLayout.PREFERRED_SIZE, 179, GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(ComponentPlacement.RELATED)
										.addComponent(btnStopFishing, GroupLayout.DEFAULT_SIZE, 175, Short.MAX_VALUE))
										.addComponent(comboBoxFishingLocation, 0, 360, Short.MAX_VALUE)
										.addGroup(groupLayout_3.createSequentialGroup()
												.addComponent(lblNumOfCasts)
												.addPreferredGap(ComponentPlacement.UNRELATED)
												.addComponent(spinnerCastNum, GroupLayout.PREFERRED_SIZE, 38, GroupLayout.PREFERRED_SIZE)
												.addGap(18)
												.addComponent(chckbxSmartFishing))
												.addGroup(groupLayout_3.createSequentialGroup()
														.addComponent(lblNumOfSells, GroupLayout.PREFERRED_SIZE, 94, GroupLayout.PREFERRED_SIZE)
														.addPreferredGap(ComponentPlacement.UNRELATED)
														.addComponent(spinnerSellsNum, GroupLayout.PREFERRED_SIZE, 38, GroupLayout.PREFERRED_SIZE)
														.addGap(18)
														.addComponent(chckbxRandomVariance)))
														.addContainerGap())
				);
		groupLayout_3.setVerticalGroup(
				groupLayout_3.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout_3.createSequentialGroup()
						.addContainerGap()
						.addComponent(comboBoxFishingLocation, GroupLayout.PREFERRED_SIZE, 28, GroupLayout.PREFERRED_SIZE)
						.addGap(18)
						.addGroup(groupLayout_3.createParallelGroup(Alignment.BASELINE)
								.addComponent(lblNumOfCasts)
								.addComponent(spinnerCastNum, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
								.addComponent(chckbxSmartFishing))
								.addGap(18)
								.addGroup(groupLayout_3.createParallelGroup(Alignment.BASELINE)
										.addComponent(lblNumOfSells, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
										.addComponent(spinnerSellsNum, GroupLayout.PREFERRED_SIZE, 22, GroupLayout.PREFERRED_SIZE)
										.addComponent(chckbxRandomVariance))
										.addGap(18)
										.addGroup(groupLayout_3.createParallelGroup(Alignment.BASELINE)
												.addComponent(btnStartFishing, GroupLayout.DEFAULT_SIZE, 33, Short.MAX_VALUE)
												.addComponent(btnStopFishing, GroupLayout.PREFERRED_SIZE, 33, GroupLayout.PREFERRED_SIZE))
												.addContainerGap())
				);
		internalFrameFishingLocations.getContentPane().setLayout(groupLayout_3);
		panelFishing.setLayout(gl_panelFishing);

		JPanel panelRacing = new JPanel();
		tabbedPane.addTab("Racing", null, panelRacing, null);

		JLabel lblNewLabel_1 = new JLabel("Coming Soon....");
		lblNewLabel_1.setFont(new Font("Tahoma", Font.PLAIN, 12));
		GroupLayout gl_panelRacing = new GroupLayout(panelRacing);
		gl_panelRacing.setHorizontalGroup(
				gl_panelRacing.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panelRacing.createSequentialGroup()
						.addGap(35)
						.addComponent(lblNewLabel_1)
						.addContainerGap(357, Short.MAX_VALUE))
				);
		gl_panelRacing.setVerticalGroup(
				gl_panelRacing.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panelRacing.createSequentialGroup()
						.addGap(35)
						.addComponent(lblNewLabel_1)
						.addContainerGap(241, Short.MAX_VALUE))
				);
		panelRacing.setLayout(gl_panelRacing);

		JPanel panelGardening = new JPanel();
		tabbedPane.addTab("Gardening", null, panelGardening, null);

		JInternalFrame internalFramePlantFlower = new JInternalFrame("Plant Flower");
		internalFramePlantFlower.setVisible(true);

		JInternalFrame internalFrame_1 = new JInternalFrame("Water OR Remove Plant");
		internalFrame_1.setVisible(true);
		GroupLayout gl_panelGardening = new GroupLayout(panelGardening);
		gl_panelGardening.setHorizontalGroup(
				gl_panelGardening.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panelGardening.createSequentialGroup()
						.addGroup(gl_panelGardening.createParallelGroup(Alignment.TRAILING, false)
								.addComponent(internalFrame_1, Alignment.LEADING)
								.addComponent(internalFramePlantFlower, Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 222, Short.MAX_VALUE))
								.addContainerGap(258, Short.MAX_VALUE))
				);
		gl_panelGardening.setVerticalGroup(
				gl_panelGardening.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panelGardening.createSequentialGroup()
						.addComponent(internalFramePlantFlower, GroupLayout.PREFERRED_SIZE, 123, GroupLayout.PREFERRED_SIZE)
						.addPreferredGap(ComponentPlacement.RELATED)
						.addComponent(internalFrame_1, GroupLayout.DEFAULT_SIZE, 151, Short.MAX_VALUE)
						.addContainerGap())
				);

		JButton btnWater = new JButton("Water");
		btnWater.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				Plants.waterPlant();
			}
		});
		btnWater.setFont(new Font("Tahoma", Font.PLAIN, 12));

		JButton btnRemove = new JButton("Remove");
		btnRemove.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				Plants.removePlant();
			}
		});
		btnRemove.setFont(new Font("Tahoma", Font.PLAIN, 12));
		GroupLayout groupLayout_5 = new GroupLayout(internalFrame_1.getContentPane());
		groupLayout_5.setHorizontalGroup(
				groupLayout_5.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout_5.createSequentialGroup()
						.addGap(43)
						.addGroup(groupLayout_5.createParallelGroup(Alignment.LEADING)
								.addComponent(btnRemove, GroupLayout.PREFERRED_SIZE, 111, GroupLayout.PREFERRED_SIZE)
								.addComponent(btnWater, GroupLayout.PREFERRED_SIZE, 111, GroupLayout.PREFERRED_SIZE))
								.addContainerGap(52, Short.MAX_VALUE))
				);
		groupLayout_5.setVerticalGroup(
				groupLayout_5.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout_5.createSequentialGroup()
						.addContainerGap()
						.addComponent(btnWater, GroupLayout.PREFERRED_SIZE, 33, GroupLayout.PREFERRED_SIZE)
						.addGap(18)
						.addComponent(btnRemove, GroupLayout.PREFERRED_SIZE, 33, GroupLayout.PREFERRED_SIZE)
						.addContainerGap(26, Short.MAX_VALUE))
				);
		internalFrame_1.getContentPane().setLayout(groupLayout_5);

		JComboBox comboBoxBeans = new JComboBox();
		comboBoxBeans.setFont(new Font("Tahoma", Font.PLAIN, 12));
		comboBoxBeans.setModel(new DefaultComboBoxModel(new String[] {"1 Bean Plant", "2 Bean Plant", "3 Bean Plant", "4 Bean Plant", "5 Bean Plant", "6 Bean Plant", "7 Bean Plant", "8 Bean Plant"}));
		comboBoxBeans.setSelectedIndex(0);

		JButton btnSelectBean = new JButton("Select");
		btnSelectBean.setFont(new Font("Tahoma", Font.PLAIN, 12));
		btnSelectBean.addActionListener(new ActionListener() 
		{
			String selectedItem = "";
			public void actionPerformed(ActionEvent e) 
			{
				selectedItem = comboBoxBeans.getSelectedItem().toString();
				Plants.createPlantsWindow(selectedItem);
			}
		});
		GroupLayout groupLayout_4 = new GroupLayout(internalFramePlantFlower.getContentPane());
		groupLayout_4.setHorizontalGroup(
				groupLayout_4.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout_4.createSequentialGroup()
						.addGroup(groupLayout_4.createParallelGroup(Alignment.LEADING)
								.addGroup(groupLayout_4.createSequentialGroup()
										.addGap(25)
										.addComponent(comboBoxBeans, GroupLayout.PREFERRED_SIZE, 148, GroupLayout.PREFERRED_SIZE))
										.addGroup(groupLayout_4.createSequentialGroup()
												.addGap(45)
												.addComponent(btnSelectBean, GroupLayout.PREFERRED_SIZE, 111, GroupLayout.PREFERRED_SIZE)))
												.addContainerGap(33, Short.MAX_VALUE))
				);
		groupLayout_4.setVerticalGroup(
				groupLayout_4.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout_4.createSequentialGroup()
						.addContainerGap()
						.addComponent(comboBoxBeans, GroupLayout.PREFERRED_SIZE, 29, GroupLayout.PREFERRED_SIZE)
						.addPreferredGap(ComponentPlacement.RELATED)
						.addComponent(btnSelectBean, GroupLayout.PREFERRED_SIZE, 33, GroupLayout.PREFERRED_SIZE)
						.addContainerGap(36, Short.MAX_VALUE))
				);
		internalFramePlantFlower.getContentPane().setLayout(groupLayout_4);
		panelGardening.setLayout(gl_panelGardening);

		JPanel panelGolf = new JPanel();
		tabbedPane.addTab("Golf", null, panelGolf, null);

		JInternalFrame internalFrame_2 = new JInternalFrame("Walk In The Par - Easy");
		internalFrame_2.setVisible(true);
		GroupLayout gl_panelGolf = new GroupLayout(panelGolf);
		gl_panelGolf.setHorizontalGroup(
				gl_panelGolf.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panelGolf.createSequentialGroup()
						.addComponent(internalFrame_2, GroupLayout.DEFAULT_SIZE, 470, Short.MAX_VALUE)
						.addContainerGap())
				);
		gl_panelGolf.setVerticalGroup(
				gl_panelGolf.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panelGolf.createSequentialGroup()
						.addComponent(internalFrame_2, GroupLayout.DEFAULT_SIZE, 280, Short.MAX_VALUE)
						.addContainerGap())
				);

		JPanel panel = new JPanel();
		panel.setBackground(Color.GREEN);

		JPanel panel_1 = new JPanel();
		panel_1.setBackground(Color.YELLOW);

		JLabel lblNearHole = new JLabel("Near Hole");
		lblNearHole.setFont(new Font("Tahoma", Font.PLAIN, 16));
		GroupLayout groupLayout_6 = new GroupLayout(internalFrame_2.getContentPane());
		groupLayout_6.setHorizontalGroup(
				groupLayout_6.createParallelGroup(Alignment.TRAILING)
				.addGroup(groupLayout_6.createSequentialGroup()
						.addContainerGap()
						.addGroup(groupLayout_6.createParallelGroup(Alignment.LEADING)
								.addComponent(panel, GroupLayout.DEFAULT_SIZE, 434, Short.MAX_VALUE)
								.addComponent(panel_1, GroupLayout.DEFAULT_SIZE, 434, Short.MAX_VALUE))
								.addContainerGap())
				);
		groupLayout_6.setVerticalGroup(
				groupLayout_6.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout_6.createSequentialGroup()
						.addGap(7)
						.addComponent(panel, GroupLayout.PREFERRED_SIZE, 119, GroupLayout.PREFERRED_SIZE)
						.addPreferredGap(ComponentPlacement.RELATED)
						.addComponent(panel_1, GroupLayout.DEFAULT_SIZE, 107, Short.MAX_VALUE)
						.addContainerGap())
				);

		JButton btnDownTheHatch = new JButton("Down the Hatch");
		btnDownTheHatch.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				Golf.downTheHatch();
			}
		});

		JButton btnPeanutPutter = new JButton("Peanut Putter");
		btnPeanutPutter.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				Golf.downTheHatch();
			}
		});

		JButton btnSwingTime = new JButton("Swing Time");
		btnSwingTime.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				Golf.swingTime();
			}
		});

		JButton btnHotLinks = new JButton("Hot Links");
		btnHotLinks.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				Golf.hotLinks();
			}
		});

		JButton btnSwingalong = new JButton("Swing-A-Long");
		btnSwingalong.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				Golf.swingALong();
			}
		});

		JButton btnOneLittleBirdy = new JButton("One Little Birdie");
		btnOneLittleBirdy.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				Golf.oneLittleBirdie();
			}
		});
		GroupLayout gl_panel_1 = new GroupLayout(panel_1);
		gl_panel_1.setHorizontalGroup(
				gl_panel_1.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panel_1.createSequentialGroup()
						.addGroup(gl_panel_1.createParallelGroup(Alignment.LEADING)
								.addGroup(gl_panel_1.createSequentialGroup()
										.addGap(182)
										.addComponent(lblNearHole))
										.addGroup(gl_panel_1.createSequentialGroup()
												.addContainerGap()
												.addGroup(gl_panel_1.createParallelGroup(Alignment.LEADING, false)
														.addComponent(btnPeanutPutter, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
														.addComponent(btnDownTheHatch, GroupLayout.DEFAULT_SIZE, 131, Short.MAX_VALUE))
														.addGap(18)
														.addGroup(gl_panel_1.createParallelGroup(Alignment.TRAILING, false)
																.addComponent(btnHotLinks, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
																.addComponent(btnSwingTime, GroupLayout.DEFAULT_SIZE, 122, Short.MAX_VALUE))
																.addGap(18)
																.addGroup(gl_panel_1.createParallelGroup(Alignment.TRAILING, false)
																		.addComponent(btnOneLittleBirdy, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
																		.addComponent(btnSwingalong, GroupLayout.DEFAULT_SIZE, 125, Short.MAX_VALUE))))
																		.addContainerGap())
				);
		gl_panel_1.setVerticalGroup(
				gl_panel_1.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panel_1.createSequentialGroup()
						.addGap(5)
						.addComponent(lblNearHole)
						.addPreferredGap(ComponentPlacement.RELATED)
						.addGroup(gl_panel_1.createParallelGroup(Alignment.BASELINE)
								.addComponent(btnDownTheHatch)
								.addComponent(btnSwingalong)
								.addComponent(btnSwingTime))
								.addPreferredGap(ComponentPlacement.RELATED)
								.addGroup(gl_panel_1.createParallelGroup(Alignment.BASELINE)
										.addComponent(btnPeanutPutter)
										.addComponent(btnOneLittleBirdy)
										.addComponent(btnHotLinks))
										.addContainerGap(24, Short.MAX_VALUE))
				);
		panel_1.setLayout(gl_panel_1);

		JLabel lblGolf = new JLabel("Hole In One");
		lblGolf.setFont(new Font("Tahoma", Font.PLAIN, 16));

		JButton btnAfternoonTee = new JButton("Afternoon Tee");
		btnAfternoonTee.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				Golf.afternoonTee();
			}
		});

		JButton btnHoleyMackeral = new JButton("Holey Mackeral");
		btnHoleyMackeral.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				Golf.holeyMackeral();
			}
		});

		JButton btnSeeingGreen = new JButton("Seeing Green");
		btnSeeingGreen.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				Golf.seeingGreen();
			}
		});

		JButton btnHoleOnThe = new JButton("Hole on the Range");
		btnHoleOnThe.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				Golf.holeOnTheRange();
			}
		});

		JButton btnHoleInFun = new JButton("Hole In Fun");
		btnHoleInFun.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				Golf.holeInFun();
			}
		});
		GroupLayout gl_panel = new GroupLayout(panel);
		gl_panel.setHorizontalGroup(
				gl_panel.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panel.createSequentialGroup()
						.addGroup(gl_panel.createParallelGroup(Alignment.LEADING)
								.addGroup(gl_panel.createSequentialGroup()
										.addGap(174)
										.addComponent(lblGolf))
										.addGroup(gl_panel.createSequentialGroup()
												.addContainerGap()
												.addGroup(gl_panel.createParallelGroup(Alignment.LEADING)
														.addComponent(btnHoleyMackeral, GroupLayout.DEFAULT_SIZE, 130, Short.MAX_VALUE)
														.addComponent(btnAfternoonTee, GroupLayout.DEFAULT_SIZE, 130, Short.MAX_VALUE))
														.addGap(18)
														.addComponent(btnHoleOnThe)
														.addGap(18)
														.addGroup(gl_panel.createParallelGroup(Alignment.TRAILING, false)
																.addComponent(btnHoleInFun, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
																.addComponent(btnSeeingGreen, GroupLayout.DEFAULT_SIZE, 127, Short.MAX_VALUE))))
																.addContainerGap())
				);
		gl_panel.setVerticalGroup(
				gl_panel.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panel.createSequentialGroup()
						.addGap(5)
						.addComponent(lblGolf)
						.addGroup(gl_panel.createParallelGroup(Alignment.LEADING)
								.addGroup(gl_panel.createSequentialGroup()
										.addPreferredGap(ComponentPlacement.RELATED)
										.addGroup(gl_panel.createParallelGroup(Alignment.BASELINE)
												.addComponent(btnAfternoonTee)
												.addComponent(btnSeeingGreen))
												.addPreferredGap(ComponentPlacement.UNRELATED)
												.addGroup(gl_panel.createParallelGroup(Alignment.LEADING)
														.addComponent(btnHoleInFun)
														.addComponent(btnHoleyMackeral)))
														.addGroup(gl_panel.createSequentialGroup()
																.addGap(27)
																.addComponent(btnHoleOnThe)))
																.addContainerGap(31, Short.MAX_VALUE))
				);
		panel.setLayout(gl_panel);
		internalFrame_2.getContentPane().setLayout(groupLayout_6);
		panelGolf.setLayout(gl_panelGolf);

		JPanel panelDoodles = new JPanel();
		tabbedPane.addTab("Doodles", null, panelDoodles, null);

		JInternalFrame internalFrame_3 = new JInternalFrame("Doodle Training");
		internalFrame_3.setVisible(true);

		JEditorPane dtrpnNoteBeforeStarting = new JEditorPane();
		dtrpnNoteBeforeStarting.setText("Note: Before starting \r\nto train, call your \r\ndoodle and have it's \r\nprofile box open; \r\nmeaning the box that shows the feed, \r\nscratch & call option \r\netc. Also, the bot will \r\nsay the trick two \r\ntimes, incase the \r\ndoodle gets confused the first time.\r\n");
		GroupLayout gl_panelDoodles = new GroupLayout(panelDoodles);
		gl_panelDoodles.setHorizontalGroup(
			gl_panelDoodles.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panelDoodles.createSequentialGroup()
					.addComponent(internalFrame_3, GroupLayout.PREFERRED_SIZE, 349, GroupLayout.PREFERRED_SIZE)
					.addPreferredGap(ComponentPlacement.RELATED, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
					.addComponent(dtrpnNoteBeforeStarting, GroupLayout.PREFERRED_SIZE, 130, GroupLayout.PREFERRED_SIZE)
					.addGap(80))
		);
		gl_panelDoodles.setVerticalGroup(
			gl_panelDoodles.createParallelGroup(Alignment.TRAILING)
				.addComponent(internalFrame_3, Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 281, Short.MAX_VALUE)
				.addGroup(gl_panelDoodles.createSequentialGroup()
					.addGap(11)
					.addComponent(dtrpnNoteBeforeStarting, GroupLayout.DEFAULT_SIZE, 259, Short.MAX_VALUE)
					.addGap(11))
		);

		JComboBox comboBoxTrainTrick = new JComboBox();
		comboBoxTrainTrick.setModel(new DefaultComboBoxModel(new String[] {"Jump (5 - 10 laff)", "Beg (6 - 12 laff)", "Play Dead (7 - 14 laff)", "Rollover (8 - 16 laff)", "Backflip (9 - 18 laff)", "Dance (10 - 20 laff)", "Speak (11 - 22 laff)"}));
		comboBoxTrainTrick.setSelectedIndex(0);
		comboBoxTrainTrick.setFont(new Font("Tahoma", Font.PLAIN, 12));

		JLabel lblNumberOfFeeds = new JLabel("Number of Feeds:");
		lblNumberOfFeeds.setFont(new Font("Tahoma", Font.PLAIN, 12));

		SpinnerModel modelForFeeds = new SpinnerNumberModel(1, 1, 900, 1);//use this to set range values to spinners
		JSpinner numOfFeeds = new JSpinner(modelForFeeds);
		numOfFeeds.setToolTipText("This number indicates the number of times to cast your fishing rod");
		numOfFeeds.setFont(new Font("Tahoma", Font.PLAIN, 12));

		JLabel lblNumberOfScratches = new JLabel("Number of Scratches:");
		lblNumberOfScratches.setFont(new Font("Tahoma", Font.PLAIN, 12));

		SpinnerModel modelForScratches = new SpinnerNumberModel(1, 1, 900, 1);//use this to set range values to spinners
		JSpinner numOfScratches = new JSpinner(modelForScratches);
		numOfScratches.setToolTipText("This number indicates the number of times to cast your fishing rod");
		numOfScratches.setFont(new Font("Tahoma", Font.PLAIN, 12));

		JCheckBox chckbxTrainUntilIStop = new JCheckBox("Train until I click stop training");
		chckbxTrainUntilIStop.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				if(chckbxTrainUntilIStop.isSelected())
				{
					numOfFeeds.setEnabled(false);
					numOfScratches.setEnabled(false);
				}
				else
				{
					numOfFeeds.setEnabled(true);
					numOfScratches.setEnabled(true);
				}
			}
		});
		chckbxTrainUntilIStop.setToolTipText("Has no feed or scratch limit, it will go forever until you click the stop training button.");
		JCheckBox chckbxJustScratchDoodle = new JCheckBox("Just Scratch Doodle");
		JCheckBox chckbxJustFeedDoodle = new JCheckBox("Just Feed Doodle");
		chckbxJustScratchDoodle.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				if (chckbxJustScratchDoodle.isSelected())
				{
					if(!chckbxTrainUntilIStop.isSelected())
					{
						numOfScratches.setEnabled(true);
					}
					numOfFeeds.setEnabled(false);
					chckbxJustFeedDoodle.setSelected(false);
				}
				else
				{
					numOfFeeds.setEnabled(true);
					if (chckbxTrainUntilIStop.isSelected())
					{
						numOfFeeds.setEnabled(false);
						numOfScratches.setEnabled(false);
					}
				}
			}
		});
		chckbxJustFeedDoodle.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				if (chckbxJustFeedDoodle.isSelected())
				{
					if(!chckbxTrainUntilIStop.isSelected())
					{
						numOfFeeds.setEnabled(true);	
					}
					numOfScratches.setEnabled(false);
					chckbxJustScratchDoodle.setSelected(false);
				}
				else
				{
					numOfScratches.setEnabled(true);
					if(chckbxTrainUntilIStop.isSelected())
					{
						numOfFeeds.setEnabled(false);
						numOfScratches.setEnabled(false);
					}
				}
			}
		});
		chckbxJustFeedDoodle.setToolTipText("Select this if you only want to train using feeding");

		chckbxJustScratchDoodle.setToolTipText("Select this if you only want to train using scratching");

		JButton btnStartTraining = new JButton("Start Training");
		btnStartTraining.addActionListener(new ActionListener() 
		{
			public void actionPerformed(ActionEvent e) //doodle training button starts here
			{
				int result = JOptionPane.showConfirmDialog(null, "Press OK when ready to begin!", "", JOptionPane.OK_CANCEL_OPTION);
				if(result == JOptionPane.OK_OPTION)//continue
				{
					//passes all values through to the object
					doodleTrainingObj = new DoodleTraining((int)numOfFeeds.getValue(), (int)numOfScratches.getValue(), chckbxTrainUntilIStop.isSelected(), comboBoxTrainTrick.getSelectedItem().toString(), chckbxJustFeedDoodle.isSelected(), chckbxJustScratchDoodle.isSelected());
					doodleTrainingThread = new Thread(doodleTrainingObj, "DoodleTrainingThread");//multithreading thread
					makeBotSleep(1);
					bringTTRScreenToFocus();
					//.start does the same as .run()
					doodleTrainingThread.start();//starts the thread with the object attached (starts the training process)
				}
			}
		});
		btnStartTraining.setFont(new Font("Tahoma", Font.PLAIN, 12));

		JButton btnStopTraining = new JButton("Stop Training");
		btnStopTraining.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				if(doodleTrainingThread != null)//will throw null error if user presses stop fishing without ever starting, therefore this if is required here to check for the null.
				{
					doodleTrainingThread.stop();
					showMessageBox("Doodle Training stopped!");
				}
			}
		});
		btnStopTraining.setFont(new Font("Tahoma", Font.PLAIN, 12));
		GroupLayout groupLayout_7 = new GroupLayout(internalFrame_3.getContentPane());
		groupLayout_7.setHorizontalGroup(
				groupLayout_7.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout_7.createSequentialGroup()
						.addContainerGap()
						.addGroup(groupLayout_7.createParallelGroup(Alignment.LEADING)
								.addGroup(groupLayout_7.createSequentialGroup()
										.addComponent(btnStartTraining, GroupLayout.PREFERRED_SIZE, 153, GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(ComponentPlacement.UNRELATED)
										.addComponent(btnStopTraining, GroupLayout.PREFERRED_SIZE, 153, GroupLayout.PREFERRED_SIZE))
										.addComponent(chckbxJustScratchDoodle, GroupLayout.PREFERRED_SIZE, 165, GroupLayout.PREFERRED_SIZE)
										.addComponent(chckbxJustFeedDoodle, GroupLayout.PREFERRED_SIZE, 165, GroupLayout.PREFERRED_SIZE)
										.addComponent(chckbxTrainUntilIStop)
										.addGroup(groupLayout_7.createSequentialGroup()
												.addComponent(lblNumberOfFeeds, GroupLayout.PREFERRED_SIZE, 100, GroupLayout.PREFERRED_SIZE)
												.addPreferredGap(ComponentPlacement.RELATED)
												.addComponent(numOfFeeds, GroupLayout.PREFERRED_SIZE, 38, GroupLayout.PREFERRED_SIZE))
												.addGroup(groupLayout_7.createSequentialGroup()
														.addComponent(lblNumberOfScratches)
														.addPreferredGap(ComponentPlacement.RELATED)
														.addComponent(numOfScratches, GroupLayout.PREFERRED_SIZE, 38, GroupLayout.PREFERRED_SIZE))
														.addComponent(comboBoxTrainTrick, GroupLayout.PREFERRED_SIZE, 167, GroupLayout.PREFERRED_SIZE))
														.addContainerGap(89, Short.MAX_VALUE))
				);
		groupLayout_7.setVerticalGroup(
				groupLayout_7.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout_7.createSequentialGroup()
						.addContainerGap()
						.addComponent(comboBoxTrainTrick, GroupLayout.PREFERRED_SIZE, 29, GroupLayout.PREFERRED_SIZE)
						.addGap(18)
						.addGroup(groupLayout_7.createParallelGroup(Alignment.BASELINE)
								.addComponent(lblNumberOfFeeds, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
								.addComponent(numOfFeeds, GroupLayout.PREFERRED_SIZE, 22, GroupLayout.PREFERRED_SIZE))
								.addGap(18)
								.addGroup(groupLayout_7.createParallelGroup(Alignment.BASELINE)
										.addComponent(lblNumberOfScratches, GroupLayout.PREFERRED_SIZE, 15, GroupLayout.PREFERRED_SIZE)
										.addComponent(numOfScratches, GroupLayout.PREFERRED_SIZE, 22, GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(ComponentPlacement.UNRELATED)
										.addComponent(chckbxTrainUntilIStop)
										.addPreferredGap(ComponentPlacement.RELATED)
										.addComponent(chckbxJustFeedDoodle)
										.addPreferredGap(ComponentPlacement.RELATED)
										.addComponent(chckbxJustScratchDoodle)
										.addPreferredGap(ComponentPlacement.UNRELATED)
										.addGroup(groupLayout_7.createParallelGroup(Alignment.LEADING)
												.addComponent(btnStartTraining, GroupLayout.DEFAULT_SIZE, 36, Short.MAX_VALUE)
												.addComponent(btnStopTraining, GroupLayout.PREFERRED_SIZE, 36, GroupLayout.PREFERRED_SIZE))
												.addContainerGap())
				);
		internalFrame_3.getContentPane().setLayout(groupLayout_7);
		panelDoodles.setLayout(gl_panelDoodles);

		JPanel panelMisc = new JPanel();
		tabbedPane.addTab("Misc", null, panelMisc, null);

		JCheckBox chckbxKeepProgramOnTop = new JCheckBox("Keep Program On Top");
		chckbxKeepProgramOnTop.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				if(chckbxKeepProgramOnTop.isSelected())
					frmToontownRewrittenBot.setAlwaysOnTop(true);
				else
					frmToontownRewrittenBot.setAlwaysOnTop(false);
			}
		});
		chckbxKeepProgramOnTop.setFont(new Font("Tahoma", Font.PLAIN, 12));

		JInternalFrame internalFrameSendMessage = new JInternalFrame("Send Message");
		internalFrameSendMessage.setVisible(true);

		JInternalFrame internalFrameKeepToonAwake = new JInternalFrame("Keep Toon Awake");
		internalFrameKeepToonAwake.setVisible(true);
		GroupLayout gl_panelMisc = new GroupLayout(panelMisc);
		gl_panelMisc.setHorizontalGroup(
				gl_panelMisc.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panelMisc.createSequentialGroup()
						.addGroup(gl_panelMisc.createParallelGroup(Alignment.LEADING)
								.addComponent(internalFrameSendMessage, GroupLayout.PREFERRED_SIZE, 247, GroupLayout.PREFERRED_SIZE)
								.addGroup(gl_panelMisc.createSequentialGroup()
										.addContainerGap()
										.addComponent(chckbxKeepProgramOnTop)))
										.addPreferredGap(ComponentPlacement.RELATED)
										.addComponent(internalFrameKeepToonAwake, GroupLayout.DEFAULT_SIZE, 227, Short.MAX_VALUE))
				);
		gl_panelMisc.setVerticalGroup(
				gl_panelMisc.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panelMisc.createSequentialGroup()
						.addGroup(gl_panelMisc.createParallelGroup(Alignment.TRAILING)
								.addComponent(internalFrameKeepToonAwake, Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 190, Short.MAX_VALUE)
								.addComponent(internalFrameSendMessage, Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 190, Short.MAX_VALUE))
								.addGap(18)
								.addComponent(chckbxKeepProgramOnTop)
								.addGap(47))
				);

		JLabel lblSliderValue = new JLabel("here");
		lblSliderValue.setVisible(false);
		JSlider sliderKeepToonAwakeTime = new JSlider();
		sliderKeepToonAwakeTime.setMinimum(1);
		sliderKeepToonAwakeTime.setToolTipText("How many minutes do you wish to keep your toon awake for?");
		sliderKeepToonAwakeTime.addChangeListener(new ChangeListener() {
			public void stateChanged(ChangeEvent e) 
			{
				if(sliderKeepToonAwakeTime.getValueIsAdjusting())
				{
					lblSliderValue.setVisible(true);
					lblSliderValue.setText("Slider Value: " + Integer.toString(sliderKeepToonAwakeTime.getValue()) + " min");
				}
			}
		});
		sliderKeepToonAwakeTime.setValue(0);
		sliderKeepToonAwakeTime.setFont(new Font("Tahoma", Font.PLAIN, 12));

		lblSliderValue.setFont(new Font("Tahoma", Font.PLAIN, 14));

		JButton btnStartStayAwake = new JButton("Start Stay Awake");
		btnStartStayAwake.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				JFrame parent = new JFrame();
				int result = JOptionPane.showConfirmDialog(parent, "Keep toon awake for " + sliderKeepToonAwakeTime.getValue() + " minutes?");
				if(result == JOptionPane.YES_OPTION)
				{
					makeBotSleep(1);
					bringTTRScreenToFocus();
					botFuncThread.start();//starts the thread in botfunc obj
				}
			}
		});
		btnStartStayAwake.setFont(new Font("Tahoma", Font.PLAIN, 12));

		JButton btnStop = new JButton("Stop");
		btnStop.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				botFuncThread.stop();//suspends the thread
				robot.keyRelease(KeyEvent.VK_CONTROL);//release the control button or else it will be held in
				showMessageBox("Keep toon awake stopped!");
			}
		});
		btnStop.setFont(new Font("Tahoma", Font.PLAIN, 12));
		GroupLayout groupLayout_2 = new GroupLayout(internalFrameKeepToonAwake.getContentPane());
		groupLayout_2.setHorizontalGroup(
				groupLayout_2.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout_2.createSequentialGroup()
						.addGroup(groupLayout_2.createParallelGroup(Alignment.LEADING)
								.addGroup(groupLayout_2.createSequentialGroup()
										.addContainerGap()
										.addComponent(sliderKeepToonAwakeTime, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
										.addGroup(groupLayout_2.createSequentialGroup()
												.addGap(34)
												.addGroup(groupLayout_2.createParallelGroup(Alignment.LEADING)
														.addComponent(btnStartStayAwake, GroupLayout.PREFERRED_SIZE, 137, GroupLayout.PREFERRED_SIZE)
														.addComponent(btnStop, GroupLayout.PREFERRED_SIZE, 137, GroupLayout.PREFERRED_SIZE)))
														.addGroup(groupLayout_2.createSequentialGroup()
																.addGap(45)
																.addComponent(lblSliderValue)))
																.addContainerGap(GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
				);
		groupLayout_2.setVerticalGroup(
				groupLayout_2.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout_2.createSequentialGroup()
						.addContainerGap()
						.addComponent(sliderKeepToonAwakeTime, GroupLayout.PREFERRED_SIZE, 31, GroupLayout.PREFERRED_SIZE)
						.addPreferredGap(ComponentPlacement.RELATED)
						.addComponent(lblSliderValue)
						.addPreferredGap(ComponentPlacement.RELATED, 38, Short.MAX_VALUE)
						.addComponent(btnStartStayAwake, GroupLayout.PREFERRED_SIZE, 32, GroupLayout.PREFERRED_SIZE)
						.addPreferredGap(ComponentPlacement.RELATED)
						.addComponent(btnStop)
						.addGap(9))
				);
		internalFrameKeepToonAwake.getContentPane().setLayout(groupLayout_2);

		JSlider sliderMessageSpamNum = new JSlider();
		sliderMessageSpamNum.setMinimum(1);
		JCheckBox chckbxSpamMessage = new JCheckBox("Spam Message?");
		textBoxSendMessage = new JTextField();
		textBoxSendMessage.setFont(new Font("Tahoma", Font.PLAIN, 12));
		textBoxSendMessage.setColumns(10);

		JButton btnSendMessage = new JButton("Send Message");
		JLabel lblSliderValueMessage = new JLabel("");
		btnSendMessage.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				JFrame parent = new JFrame();
				int result = JOptionPane.showConfirmDialog(parent, "Send Message?");
				if(result == JOptionPane.YES_OPTION)
				{
					makeBotSleep(1);
					bringTTRScreenToFocus();
					if(chckbxSpamMessage.isSelected())
					{
						String message = textBoxSendMessage.getText();
						for(int i = 0; i < sliderMessageSpamNum.getValue(); i++)
						{
							typeSentenceInGame(message);
							try {
								Thread.sleep(600);
							} catch (InterruptedException e1) {
								e1.printStackTrace();
							}
						}
					}
					else
						typeSentenceInGame(textBoxSendMessage.getText());
				}
			}
		});
		btnSendMessage.setFont(new Font("Tahoma", Font.PLAIN, 12));

		sliderMessageSpamNum.setVisible(false);
		lblSliderValueMessage.setVisible(false);
		chckbxSpamMessage.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				if(chckbxSpamMessage.isSelected())
				{
					sliderMessageSpamNum.setVisible(true);
					lblSliderValueMessage.setVisible(true);
				}
				else
				{
					sliderMessageSpamNum.setVisible(false);
					lblSliderValueMessage.setVisible(false);
				}
			}
		});
		chckbxSpamMessage.setFont(new Font("Tahoma", Font.PLAIN, 12));

		sliderMessageSpamNum.addChangeListener(new ChangeListener() {
			public void stateChanged(ChangeEvent e) 
			{
				if(sliderMessageSpamNum.getValueIsAdjusting())
				{
					lblSliderValueMessage.setVisible(true);
					lblSliderValueMessage.setText("Spam message " + Integer.toString(sliderMessageSpamNum.getValue()) + " times");
				}
			}
		});
		sliderMessageSpamNum.setToolTipText("Number of times to spam your message");
		sliderMessageSpamNum.setValue(0);

		GroupLayout groupLayout_1 = new GroupLayout(internalFrameSendMessage.getContentPane());
		groupLayout_1.setHorizontalGroup(
				groupLayout_1.createParallelGroup(Alignment.TRAILING)
				.addGroup(groupLayout_1.createSequentialGroup()
						.addGroup(groupLayout_1.createParallelGroup(Alignment.LEADING)
								.addGroup(groupLayout_1.createSequentialGroup()
										.addContainerGap()
										.addGroup(groupLayout_1.createParallelGroup(Alignment.LEADING)
												.addComponent(chckbxSpamMessage)
												.addComponent(sliderMessageSpamNum, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)))
												.addGroup(groupLayout_1.createSequentialGroup()
														.addContainerGap()
														.addComponent(textBoxSendMessage, GroupLayout.DEFAULT_SIZE, 211, Short.MAX_VALUE)))
														.addContainerGap())
														.addGroup(groupLayout_1.createSequentialGroup()
																.addContainerGap(61, Short.MAX_VALUE)
																.addComponent(btnSendMessage, GroupLayout.PREFERRED_SIZE, 112, GroupLayout.PREFERRED_SIZE)
																.addGap(58))
																.addGroup(Alignment.LEADING, groupLayout_1.createSequentialGroup()
																		.addGap(44)
																		.addComponent(lblSliderValueMessage)
																		.addContainerGap(168, Short.MAX_VALUE))
				);
		groupLayout_1.setVerticalGroup(
				groupLayout_1.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout_1.createSequentialGroup()
						.addContainerGap()
						.addComponent(textBoxSendMessage, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
						.addPreferredGap(ComponentPlacement.UNRELATED)
						.addComponent(btnSendMessage, GroupLayout.PREFERRED_SIZE, 33, GroupLayout.PREFERRED_SIZE)
						.addGap(7)
						.addComponent(chckbxSpamMessage)
						.addPreferredGap(ComponentPlacement.RELATED)
						.addComponent(sliderMessageSpamNum, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
						.addPreferredGap(ComponentPlacement.RELATED)
						.addComponent(lblSliderValueMessage)
						.addContainerGap(GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
				);
		internalFrameSendMessage.getContentPane().setLayout(groupLayout_1);
		panelMisc.setLayout(gl_panelMisc);

		JPanel panelDev = new JPanel();
		tabbedPane.addTab("Dev", null, panelDev, null);

		JInternalFrame internalFrame = new JInternalFrame("Coordinates");
		internalFrame.setVisible(true);

		JLabel lblOnlyUseThis = new JLabel("Only use this if the bot is not working \r\nproperly or the coordinates need reconfigured!");
		lblOnlyUseThis.setFont(new Font("Tahoma", Font.PLAIN, 11));
		GroupLayout gl_panelDev = new GroupLayout(panelDev);
		gl_panelDev.setHorizontalGroup(
				gl_panelDev.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panelDev.createSequentialGroup()
						.addGroup(gl_panelDev.createParallelGroup(Alignment.LEADING)
								.addComponent(internalFrame, GroupLayout.PREFERRED_SIZE, 349, GroupLayout.PREFERRED_SIZE)
								.addGroup(gl_panelDev.createSequentialGroup()
										.addContainerGap()
										.addComponent(lblOnlyUseThis)))
										.addContainerGap(63, Short.MAX_VALUE))
				);
		gl_panelDev.setVerticalGroup(
				gl_panelDev.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panelDev.createSequentialGroup()
						.addComponent(internalFrame, GroupLayout.PREFERRED_SIZE, 238, GroupLayout.PREFERRED_SIZE)
						.addGap(18)
						.addComponent(lblOnlyUseThis)
						.addContainerGap(21, Short.MAX_VALUE))
				);

		JButton btnUpdateCoordinate = new JButton("Update Coordinate");
		btnUpdateCoordinate.addActionListener(new ActionListener() {
			String selectedItem = "";
			public void actionPerformed(ActionEvent e) //perform action when selected coordinate is selected to be updated
			{
				selectedItem = comboBoxCoordinates.getSelectedItem().toString();
				CoordinatesManager.updateCoordinates(selectedItem);
				//CoordinatesManager.createPopupWindow(selectedItem);
			}
		});

		JButton btnResetAllCoordinates = new JButton("Reset All Coordinates");
		btnResetAllCoordinates.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) //perform action when reset all coordinates button is pressed
			{
				CoordinatesManager.resetAllCoordinates();
			}
		});
		GroupLayout groupLayout = new GroupLayout(internalFrame.getContentPane());
		groupLayout.setHorizontalGroup(
				groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
						.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
								.addGroup(groupLayout.createSequentialGroup()
										.addGap(26)
										.addComponent(comboBoxCoordinates, GroupLayout.PREFERRED_SIZE, 275, GroupLayout.PREFERRED_SIZE))
										.addGroup(groupLayout.createSequentialGroup()
												.addGap(80)
												.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
														.addComponent(btnResetAllCoordinates, GroupLayout.PREFERRED_SIZE, 167, GroupLayout.PREFERRED_SIZE)
														.addComponent(btnUpdateCoordinate, GroupLayout.PREFERRED_SIZE, 167, GroupLayout.PREFERRED_SIZE))))
														.addContainerGap(32, Short.MAX_VALUE))
				);
		groupLayout.setVerticalGroup(
				groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
						.addContainerGap()
						.addComponent(comboBoxCoordinates, GroupLayout.PREFERRED_SIZE, 36, GroupLayout.PREFERRED_SIZE)
						.addGap(18)
						.addComponent(btnUpdateCoordinate, GroupLayout.PREFERRED_SIZE, 50, GroupLayout.PREFERRED_SIZE)
						.addPreferredGap(ComponentPlacement.UNRELATED)
						.addComponent(btnResetAllCoordinates, GroupLayout.PREFERRED_SIZE, 50, GroupLayout.PREFERRED_SIZE)
						.addContainerGap(32, Short.MAX_VALUE))
				);
		internalFrame.getContentPane().setLayout(groupLayout);
		panelDev.setLayout(gl_panelDev);
		botFuncObj = new BotFunctions(sliderKeepToonAwakeTime);
		botFuncThread = new Thread(botFuncObj, "BotFunctionsThread");
	}

	private static void createCoordinateFile()
	{
		coordinateFile = new CoordinatesManager();//create the coordinates file obj
		comboBoxCoordinates.setToolTipText("Select the coordinate you wish to update");
		comboBoxCoordinates.setModel(coordinateFile.loadCoordsIntoResetBox(new DefaultComboBoxModel()));//loads the strings into the combobox on dev tab
		comboBoxCoordinates.setSelectedIndex(0);
	}
}
