#tag MobileScreen
Begin TRMobileScreen Screen1
   BackButtonTitle =   ""
   Compatibility   =   ""
   Device = 1
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   False
   Orientation = 0
   TabIcon         =   0
   TabTitle        =   ""
   Title           =   "Untitled"
   Top             =   0
   Begin MobileCanvas Canvas1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Canvas1, 4, <Parent>, 4, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Canvas1, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Canvas1, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Canvas1, 3, <Parent>, 3, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   568
      Left            =   0
      LockedInPosition=   False
      Scope           =   2
      TintColor       =   &c000000
      Top             =   0
      Visible         =   True
      Width           =   320
      Begin MobileLabel Label1
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         Alignment       =   0
         AutoLayout      =   Label1, 8, , 0, False, +1.00, 4, 1, 60, , True
         AutoLayout      =   Label1, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
         AutoLayout      =   Label1, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
         AutoLayout      =   Label1, 10, <Parent>, 10, False, +1.00, 4, 1, 0, , True
         ControlCount    =   0
         Enabled         =   True
         Height          =   60
         Left            =   20
         LineBreakMode   =   0
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Canvas1"
         Scope           =   2
         Text            =   "Untitled"
         TextColor       =   &c000000
         TextFont        =   ""
         TextSize        =   0
         TintColor       =   &c000000
         Top             =   254
         Visible         =   True
         Width           =   280
      End
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Opening()
		  
		  // Workaround XOJO bug? The IDE setting has the NavBar set too False and large title set to .Never, but it's different at launch
		  Me.HasNavigationBar = False
		  Me.LargeTitleDisplayMode = MobileScreen.LargeTitleDisplayModes.Never
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub OrientationChanged()
		  
		  Label1.Text = "Full Screen Canvas Size: " + Canvas1.Width.ToString + " x " + Canvas1.Height.ToString
		  Label1.Text = Label1.Text + EndOfLine + "Screen Size: " + Self.Size.Width.ToString + " x " + Self.Size.Height.ToString
		  
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackButtonCaption"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasNavigationBar"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LargeTitleDisplayMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="MobileScreen.LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabBarVisible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TintColor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="ColorGroup"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
