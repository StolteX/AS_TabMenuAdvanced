﻿B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=9.85
@EndOfDesignText@
#Region Shared Files
#CustomBuildAction: folders ready, %WINDIR%\System32\Robocopy.exe,"..\..\Shared Files" "..\Files"
'Ctrl + click to sync files: ide://run?file=%WINDIR%\System32\Robocopy.exe&args=..\..\Shared+Files&args=..\Files&FilesSync=True
#End Region

'Ctrl + click to export as zip: ide://run?File=%B4X%\Zipper.jar&Args=Project.zip

Sub Class_Globals
	Private Root As B4XView
	Private xui As XUI
	Private AS_TabMenuAdvanced1 As AS_TabMenuAdvanced
	
			#If B4I
	Private xpnl_bottom As B4XView
#End If
End Sub

Public Sub Initialize
	
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	Root.LoadLayout("frm_main")
	
	B4XPages.SetTitle(Me,"AS TabMenuAdvanced")
	
	#If B4I
	xpnl_bottom = xui.CreatePanel("")
	Root.AddView(xpnl_bottom,0,0,Root.Width,B4XPages.GetNativeParent(Me).SafeAreaInsets.Bottom)
	xpnl_bottom.Color = 0xFF202125
	#End If
	
	AS_TabMenuAdvanced1.AddTab("",xui.LoadBitmap(File.DirAssets,"home_active.png"),xui.LoadBitmap(File.DirAssets,"home_inactive.png"))
	AS_TabMenuAdvanced1.AddTab("Parking",xui.LoadBitmap(File.DirAssets,"parking_active.png"),xui.LoadBitmap(File.DirAssets,"parking_inactive.png"))
	AS_TabMenuAdvanced1.AddTab("Maps",xui.LoadBitmap(File.DirAssets,"maps_active.png"),xui.LoadBitmap(File.DirAssets,"maps_inactive.png"))
	AS_TabMenuAdvanced1.AddTab("Maps",xui.LoadBitmap(File.DirAssets,"maps_active.png"),xui.LoadBitmap(File.DirAssets,"maps_inactive.png"))
	'AS_TabMenuAdvanced1.AddTab("Maps",xui.LoadBitmap(File.DirAssets,"maps_active.png"),xui.LoadBitmap(File.DirAssets,"maps_inactive.png"))
	AS_TabMenuAdvanced1.Refresh

	'Sleep(3000)
	AS_TabMenuAdvanced1.GetTab(0).xTab.BadgeValue = 5
	AS_TabMenuAdvanced1.GetTab(1).xTab.BadgeValue = 50
	AS_TabMenuAdvanced1.GetTab(2).xTab.BadgeValue = 50000
	AS_TabMenuAdvanced1.GetTab(3).xTab.BadgeValue = 500
	AS_TabMenuAdvanced1.BadgeWithoutText = False

	'AS_TabMenuAdvanced1.GetTab(3).xTab.Enabled = False
	AS_TabMenuAdvanced1.Refresh
'	Dim xpnl_Tab As B4XView = AS_TabMenuAdvanced1.GetTab(2).xTabViews.xpnl_TabBackground
'	Log("The middle of the tab is: " & (xpnl_Tab.Left + xpnl_Tab.Width/2))
	
End Sub

#If B4I
Private Sub B4XPage_Resize (Width As Int, Height As Int)
	xpnl_bottom.SetLayoutAnimated(0,0,Height - B4XPages.GetNativeParent(Me).SafeAreaInsets.Bottom,Width,B4XPages.GetNativeParent(Me).SafeAreaInsets.Bottom)
	AS_TabMenuAdvanced1.mBase.Top = Height - AS_TabMenuAdvanced1.mBase.Height - B4XPages.GetNativeParent(Me).SafeAreaInsets.Bottom
End Sub
#End If

Private Sub AS_TabMenuAdvanced1_TabClick (Index As Int)
	Log("TabClick: " & Index)
End Sub

Private Sub AS_TabMenuAdvanced1_MiddleButtonClick
	Log("MiddleButtonClick")
End Sub