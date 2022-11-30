#tag Class
Protected Class TRMobileScreen
Inherits MobileScreen
Implements TRMobileScreenDelegate
	#tag Event
		Sub Opening()
		  
		  Me.LayoutTimer = New TRMobileScreenTimer
		  Me.LayoutTimer.Screen = New WeakRef(Me)
		  Me.LayoutTimer.RunMode = Timer.RunModes.Off
		  
		  Me.LayoutCanvas = New MobileCanvas
		  Me.LayoutCanvas.Visible = False
		  
		  Me.AddControl(Me.LayoutCanvas)
		  
		  Me.AddConstraint(New iOSLayoutConstraint(Me.LayoutCanvas, iOSLayoutConstraint.AttributeTypes.Width, iOSLayoutConstraint.RelationTypes.Equal, Me, iOSLayoutConstraint.AttributeTypes.Width, 1, 0))
		  Me.AddConstraint(New iOSLayoutConstraint(Me.LayoutCanvas, iOSLayoutConstraint.AttributeTypes.Height, iOSLayoutConstraint.RelationTypes.Equal, Me, iOSLayoutConstraint.AttributeTypes.Height, 1, 0))
		  Me.AddConstraint(New iOSLayoutConstraint(Me.LayoutCanvas, iOSLayoutConstraint.AttributeTypes.CenterX, iOSLayoutConstraint.RelationTypes.Equal, Me, iOSLayoutConstraint.AttributeTypes.CenterX, 1, 0))
		  Me.AddConstraint(New iOSLayoutConstraint(Me.LayoutCanvas, iOSLayoutConstraint.AttributeTypes.CenterY, iOSLayoutConstraint.RelationTypes.Equal, Me, iOSLayoutConstraint.AttributeTypes.CenterY, 1, 0))
		  
		  RaiseEvent Opening
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub OrientationChanged()
		  
		  If Me.LayoutCanvas = Nil Then
		    Return // Opening not fired yet
		  End
		  
		  Me.NeedToFireOrientationChanged = True
		  
		  Me.LayoutTimer.RunMode = Timer.RunModes.Multiple
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  
		  If Me.LayoutCanvas = Nil Then
		    Return // Opening not fired yet
		  End
		  
		  Me.NeedToFireResized = True
		  Me.LayoutTimer.RunMode = Timer.RunModes.Multiple
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function LayoutIsReady() As Boolean
		  // Part of the TRMobileScreenDelegate interface.
		  
		  Dim s0 As Size = Me.Size
		  Dim s1 As Size = New Size(Me.LayoutCanvas.Width, Me.LayoutCanvas.Height)
		  Dim layoutIsGood As Boolean = s0.Width = s1.Width And s0.Height = s1.Height
		  
		  If layoutIsGood Then
		    If Me.NeedToFireOrientationChanged Then
		      Me.NeedToFireOrientationChanged = False
		      
		      RaiseEvent OrientationChanged
		    End
		    
		    If Me.NeedToFireResized Then
		      Me.NeedToFireResized = False
		      
		      RaiseEvent Resized
		    End
		  End
		  
		  Return layoutIsGood
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Opening()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event OrientationChanged()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Resized()
	#tag EndHook


	#tag Property, Flags = &h21
		Private LayoutCanvas As MobileCanvas
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LayoutTimer As TRMobileScreenTimer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NeedToFireOrientationChanged As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NeedToFireResized As Boolean
	#tag EndProperty


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
End Class
#tag EndClass
