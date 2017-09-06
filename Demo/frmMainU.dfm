object frmMain: TfrmMain
  Left = 207
  Top = 140
  Caption = 'Chrome Tabs Demo'
  ClientHeight = 606
  ClientWidth = 1017
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object ChromeTabsTop: TChromeTabs32
    Left = 0
    Top = 0
    Width = 1017
    Height = 27
    OnActiveTabChanging = ChromeTabs32ActiveTabChanging
    OnChange = ChromeTabs32Change
    OnActiveTabChanged = ChromeTabs32ActiveTabChanged
    OnDebugLog = ChromeTabs32DebugLog
    OnButtonAddClick = ChromeTabs32ButtonAddClick
    OnNeedDragImageControl = ChromeTabs32NeedDragImageControl
    OnAfterDrawItem = ChromeTabs32AfterDrawItem
    OnGetControlPolygons = ChromeTabs32GetControlPolygons
    OnTabDragDrop = ChromeTabsTopTabDragDrop
    OnTabDragDropped = ChromeTabs32TabDragDropped
    OnScroll = ChromeTabs32ScrollWidthChanged
    OnScrollWidthChanged = ChromeTabs32ScrollWidthChanged
    OnSetTabWidth = ChromeTabs32SetTabWidth
    ActiveTabIndex = 0
    Images = ImageList1
    ImagesOverlay = ImageList2
    ImagesSpinnerUpload = ImageList3
    ImagesSpinnerDownload = ImageList4
    Options.Display.CloseButton.Offsets.Vertical = 6
    Options.Display.CloseButton.Offsets.Horizontal = 2
    Options.Display.CloseButton.Height = 14
    Options.Display.CloseButton.Width = 14
    Options.Display.CloseButton.AutoHide = True
    Options.Display.CloseButton.Visibility = bvAll
    Options.Display.CloseButton.AutoHideWidth = 20
    Options.Display.CloseButton.CrossRadialOffset = 4
    Options.Display.AddButton.Offsets.Vertical = 8
    Options.Display.AddButton.Offsets.Horizontal = 2
    Options.Display.AddButton.Height = 14
    Options.Display.AddButton.Width = 31
    Options.Display.AddButton.ShowPlusSign = False
    Options.Display.AddButton.Visibility = avRightFloating
    Options.Display.AddButton.HorizontalOffsetFloating = -3
    Options.Display.ScrollButtonLeft.Offsets.Vertical = 10
    Options.Display.ScrollButtonLeft.Offsets.Horizontal = 1
    Options.Display.ScrollButtonLeft.Height = 15
    Options.Display.ScrollButtonLeft.Width = 15
    Options.Display.ScrollButtonRight.Offsets.Vertical = 10
    Options.Display.ScrollButtonRight.Offsets.Horizontal = 1
    Options.Display.ScrollButtonRight.Height = 15
    Options.Display.ScrollButtonRight.Width = 15
    Options.Display.TabModifiedGlow.Style = msRightToLeft
    Options.Display.TabModifiedGlow.VerticalOffset = -6
    Options.Display.TabModifiedGlow.Height = 30
    Options.Display.TabModifiedGlow.Width = 100
    Options.Display.TabModifiedGlow.AnimationPeriodMS = 4000
    Options.Display.TabModifiedGlow.EaseType = ttEaseInOutQuad
    Options.Display.TabModifiedGlow.AnimationUpdateMS = 50
    Options.Display.Tabs.SeeThroughTabs = False
    Options.Display.Tabs.TabOverlap = 15
    Options.Display.Tabs.ContentOffsetLeft = 18
    Options.Display.Tabs.ContentOffsetRight = 16
    Options.Display.Tabs.OffsetLeft = 0
    Options.Display.Tabs.OffsetTop = 2
    Options.Display.Tabs.OffsetRight = 0
    Options.Display.Tabs.OffsetBottom = 0
    Options.Display.Tabs.MinWidth = 25
    Options.Display.Tabs.MaxWidth = 200
    Options.Display.Tabs.TabWidthFromContent = False
    Options.Display.Tabs.PinnedWidth = 39
    Options.Display.Tabs.ImageOffsetLeft = 13
    Options.Display.Tabs.TextTrimType = tttFade
    Options.Display.Tabs.Orientation = toTop
    Options.Display.Tabs.BaseLineTabRegionOnly = False
    Options.Display.Tabs.WordWrap = False
    Options.Display.Tabs.TextAlignmentHorizontal = taLeftJustify
    Options.Display.Tabs.TextAlignmentVertical = taVerticalCenter
    Options.Display.Tabs.ShowImages = True
    Options.Display.Tabs.ShowPinnedTabText = False
    Options.Display.TabContainer.TransparentBackground = True
    Options.Display.TabContainer.OverlayButtons = True
    Options.Display.TabContainer.PaddingLeft = 0
    Options.Display.TabContainer.PaddingRight = 0
    Options.Display.TabMouseGlow.Offsets.Vertical = 0
    Options.Display.TabMouseGlow.Offsets.Horizontal = 0
    Options.Display.TabMouseGlow.Height = 200
    Options.Display.TabMouseGlow.Width = 200
    Options.Display.TabMouseGlow.Visible = True
    Options.Display.TabSpinners.Upload.ReverseDirection = True
    Options.Display.TabSpinners.Upload.RenderedAnimationStep = 4
    Options.Display.TabSpinners.Upload.Position.Offsets.Vertical = 0
    Options.Display.TabSpinners.Upload.Position.Offsets.Horizontal = 0
    Options.Display.TabSpinners.Upload.Position.Height = 16
    Options.Display.TabSpinners.Upload.Position.Width = 16
    Options.Display.TabSpinners.Upload.SweepAngle = 135
    Options.Display.TabSpinners.Download.ReverseDirection = False
    Options.Display.TabSpinners.Download.RenderedAnimationStep = 15
    Options.Display.TabSpinners.Download.Position.Offsets.Vertical = 0
    Options.Display.TabSpinners.Download.Position.Offsets.Horizontal = 0
    Options.Display.TabSpinners.Download.Position.Height = 16
    Options.Display.TabSpinners.Download.Position.Width = 16
    Options.Display.TabSpinners.Download.SweepAngle = 135
    Options.Display.TabSpinners.AnimationUpdateMS = 50
    Options.Display.TabSpinners.HideImagesWhenSpinnerVisible = True
    Options.DragDrop.DragType = dtBetweenContainers
    Options.DragDrop.DragOutsideImageAlpha = 220
    Options.DragDrop.DragOutsideDistancePixels = 30
    Options.DragDrop.DragStartPixels = 2
    Options.DragDrop.DragControlImageResizeFactor = 0.500000000000000000
    Options.DragDrop.DragCursor = crDefault
    Options.DragDrop.DragDisplay = ddTabAndControl
    Options.DragDrop.DragFormBorderWidth = 2
    Options.DragDrop.DragFormBorderColor = 8421504
    Options.DragDrop.ContrainDraggedTabWithinContainer = True
    Options.Animation.DefaultMovementAnimationTimeMS = 100
    Options.Animation.DefaultStyleAnimationTimeMS = 300
    Options.Animation.AnimationTimerInterval = 15
    Options.Animation.MinimumTabAnimationWidth = 40
    Options.Animation.DefaultMovementEaseType = ttLinearTween
    Options.Animation.DefaultStyleEaseType = ttLinearTween
    Options.Animation.MovementAnimations.TabAdd.UseDefaultEaseType = True
    Options.Animation.MovementAnimations.TabAdd.UseDefaultAnimationTime = True
    Options.Animation.MovementAnimations.TabAdd.EaseType = ttEaseOutExpo
    Options.Animation.MovementAnimations.TabAdd.AnimationTimeMS = 500
    Options.Animation.MovementAnimations.TabDelete.UseDefaultEaseType = True
    Options.Animation.MovementAnimations.TabDelete.UseDefaultAnimationTime = True
    Options.Animation.MovementAnimations.TabDelete.EaseType = ttEaseOutExpo
    Options.Animation.MovementAnimations.TabDelete.AnimationTimeMS = 500
    Options.Animation.MovementAnimations.TabMove.UseDefaultEaseType = False
    Options.Animation.MovementAnimations.TabMove.UseDefaultAnimationTime = False
    Options.Animation.MovementAnimations.TabMove.EaseType = ttEaseOutExpo
    Options.Animation.MovementAnimations.TabMove.AnimationTimeMS = 500
    Options.Behaviour.BackgroundDblClickMaximiseRestoreForm = True
    Options.Behaviour.BackgroundDragMovesForm = True
    Options.Behaviour.TabSmartDeleteResizing = True
    Options.Behaviour.TabSmartDeleteResizeCancelDelay = 700
    Options.Behaviour.UseBuiltInPopupMenu = True
    Options.Behaviour.TabRightClickSelect = True
    Options.Behaviour.ActivateNewTab = True
    Options.Behaviour.DebugMode = False
    Options.Behaviour.IgnoreDoubleClicksWhileAnimatingMovement = True
    Options.Scrolling.Enabled = True
    Options.Scrolling.ScrollButtons = csbRight
    Options.Scrolling.ScrollStep = 20
    Options.Scrolling.ScrollRepeatDelay = 20
    Options.Scrolling.AutoHideButtons = True
    Options.Scrolling.DragScroll = True
    Options.Scrolling.DragScrollOffset = 50
    Options.Scrolling.MouseWheelScroll = True
    Tabs = <
      item
        Caption = 'Chrome Tab 1'
        Active = True
        Tag = 0
        ImageIndex = 3
        ImageIndexOverlay = -1
        Pinned = False
        Visible = True
        Modified = False
        SpinnerState = tssRenderedDownload
        HideCloseButton = False
      end
      item
        Caption = 'Chrome Tab 2'
        Active = False
        Tag = 0
        ImageIndex = -1
        ImageIndexOverlay = -1
        Pinned = False
        Visible = True
        Modified = False
        SpinnerState = tssNone
        HideCloseButton = False
      end>
    LookAndFeel.TabsContainer.StartColor = 14586466
    LookAndFeel.TabsContainer.StopColor = 13201730
    LookAndFeel.TabsContainer.OutlineColor = 14520930
    LookAndFeel.Tabs.BaseLine.Color = 11110509
    LookAndFeel.Tabs.BaseLine.Thickness = 1.000000000000000000
    LookAndFeel.Tabs.Modified.CenterColor = -2097152001
    LookAndFeel.Tabs.Modified.OutsideColor = 16777215
    LookAndFeel.Tabs.DefaultFont.Name = 'Segoe UI'
    LookAndFeel.Tabs.DefaultFont.Color = -16777216
    LookAndFeel.Tabs.DefaultFont.Size = 9
    LookAndFeel.Tabs.MouseGlow.CenterColor = 2030043135
    LookAndFeel.Tabs.MouseGlow.OutsideColor = 16777215
    LookAndFeel.Tabs.Spinners.Upload.Color = 12759975
    LookAndFeel.Tabs.Spinners.Upload.Thickness = 2.500000000000000000
    LookAndFeel.Tabs.Spinners.Download.Color = 14388040
    LookAndFeel.Tabs.Spinners.Download.Thickness = 2.500000000000000000
    LookAndFeel.Tabs.Active.Font.Name = 'Segoe UI'
    LookAndFeel.Tabs.Active.Font.Color = 1686077184
    LookAndFeel.Tabs.Active.Font.Size = 9
    LookAndFeel.Tabs.Active.Font.UseDefaultFont = True
    LookAndFeel.Tabs.Active.Style.StartColor = -1
    LookAndFeel.Tabs.Active.Style.StopColor = 16316920
    LookAndFeel.Tabs.Active.Style.OutlineColor = 10189918
    LookAndFeel.Tabs.Active.Style.OutlineSize = 1.000000000000000000
    LookAndFeel.Tabs.NotActive.Font.Name = 'Segoe UI'
    LookAndFeel.Tabs.NotActive.Font.Color = 4603477
    LookAndFeel.Tabs.NotActive.Font.Size = 9
    LookAndFeel.Tabs.NotActive.Font.UseDefaultFont = False
    LookAndFeel.Tabs.NotActive.Style.StartColor = 15194573
    LookAndFeel.Tabs.NotActive.Style.StopColor = 15194573
    LookAndFeel.Tabs.NotActive.Style.OutlineColor = 13546390
    LookAndFeel.Tabs.NotActive.Style.OutlineSize = 1.000000000000000000
    LookAndFeel.Tabs.Hot.Font.Name = 'Segoe UI'
    LookAndFeel.Tabs.Hot.Font.Color = 4210752
    LookAndFeel.Tabs.Hot.Font.Size = 9
    LookAndFeel.Tabs.Hot.Font.UseDefaultFont = False
    LookAndFeel.Tabs.Hot.Style.StartColor = 15721176
    LookAndFeel.Tabs.Hot.Style.StopColor = 15589847
    LookAndFeel.Tabs.Hot.Style.OutlineColor = 12423799
    LookAndFeel.Tabs.Hot.Style.OutlineSize = 1.000000000000000000
    LookAndFeel.CloseButton.Cross.Normal.Color = 6643031
    LookAndFeel.CloseButton.Cross.Normal.Thickness = 1.500000000000000000
    LookAndFeel.CloseButton.Cross.Down.Color = 15461369
    LookAndFeel.CloseButton.Cross.Down.Thickness = 2.000000000000000000
    LookAndFeel.CloseButton.Cross.Hot.Color = -587202561
    LookAndFeel.CloseButton.Cross.Hot.Thickness = 2.000000000000000000
    LookAndFeel.CloseButton.Circle.Normal.StartColor = 10930928
    LookAndFeel.CloseButton.Circle.Normal.StopColor = 16777215
    LookAndFeel.CloseButton.Circle.Normal.OutlineColor = 8421504
    LookAndFeel.CloseButton.Circle.Normal.OutlineSize = 1.000000000000000000
    LookAndFeel.CloseButton.Circle.Down.StartColor = 3487169
    LookAndFeel.CloseButton.Circle.Down.StopColor = 3487169
    LookAndFeel.CloseButton.Circle.Down.OutlineColor = 8421504
    LookAndFeel.CloseButton.Circle.Down.OutlineSize = 1.000000000000000000
    LookAndFeel.CloseButton.Circle.Hot.StartColor = 9408475
    LookAndFeel.CloseButton.Circle.Hot.StopColor = 9803748
    LookAndFeel.CloseButton.Circle.Hot.OutlineColor = 6054595
    LookAndFeel.CloseButton.Circle.Hot.OutlineSize = 1.000000000000000000
    LookAndFeel.AddButton.Button.Normal.StartColor = 14340292
    LookAndFeel.AddButton.Button.Normal.StopColor = 14340035
    LookAndFeel.AddButton.Button.Normal.OutlineColor = 13088421
    LookAndFeel.AddButton.Button.Normal.OutlineSize = 1.000000000000000000
    LookAndFeel.AddButton.Button.Down.StartColor = 13417645
    LookAndFeel.AddButton.Button.Down.StopColor = 13417644
    LookAndFeel.AddButton.Button.Down.OutlineColor = 10852748
    LookAndFeel.AddButton.Button.Down.OutlineSize = 1.000000000000000000
    LookAndFeel.AddButton.Button.Hot.StartColor = 15524314
    LookAndFeel.AddButton.Button.Hot.StopColor = 15524314
    LookAndFeel.AddButton.Button.Hot.OutlineColor = 14927787
    LookAndFeel.AddButton.Button.Hot.OutlineSize = 1.000000000000000000
    LookAndFeel.AddButton.PlusSign.Normal.StartColor = -1
    LookAndFeel.AddButton.PlusSign.Normal.StopColor = -1
    LookAndFeel.AddButton.PlusSign.Normal.OutlineColor = -8421505
    LookAndFeel.AddButton.PlusSign.Normal.OutlineSize = 1.000000000000000000
    LookAndFeel.AddButton.PlusSign.Down.StartColor = -1
    LookAndFeel.AddButton.PlusSign.Down.StopColor = -1
    LookAndFeel.AddButton.PlusSign.Down.OutlineColor = -8421505
    LookAndFeel.AddButton.PlusSign.Down.OutlineSize = 1.000000000000000000
    LookAndFeel.AddButton.PlusSign.Hot.StartColor = -1
    LookAndFeel.AddButton.PlusSign.Hot.StopColor = -1
    LookAndFeel.AddButton.PlusSign.Hot.OutlineColor = -8421505
    LookAndFeel.AddButton.PlusSign.Hot.OutlineSize = 1.000000000000000000
    LookAndFeel.ScrollButtons.Button.Normal.StartColor = 14735310
    LookAndFeel.ScrollButtons.Button.Normal.StopColor = 14274499
    LookAndFeel.ScrollButtons.Button.Normal.OutlineColor = 11507842
    LookAndFeel.ScrollButtons.Button.Normal.OutlineSize = 1.000000000000000000
    LookAndFeel.ScrollButtons.Button.Down.StartColor = 13417645
    LookAndFeel.ScrollButtons.Button.Down.StopColor = 13417644
    LookAndFeel.ScrollButtons.Button.Down.OutlineColor = 10852748
    LookAndFeel.ScrollButtons.Button.Down.OutlineSize = 1.000000000000000000
    LookAndFeel.ScrollButtons.Button.Hot.StartColor = 15524314
    LookAndFeel.ScrollButtons.Button.Hot.StopColor = 15524313
    LookAndFeel.ScrollButtons.Button.Hot.OutlineColor = 14927788
    LookAndFeel.ScrollButtons.Button.Hot.OutlineSize = 1.000000000000000000
    LookAndFeel.ScrollButtons.Button.Disabled.StartColor = 14340036
    LookAndFeel.ScrollButtons.Button.Disabled.StopColor = 14274499
    LookAndFeel.ScrollButtons.Button.Disabled.OutlineColor = 11113341
    LookAndFeel.ScrollButtons.Button.Disabled.OutlineSize = 1.000000000000000000
    LookAndFeel.ScrollButtons.Arrow.Normal.StartColor = -1
    LookAndFeel.ScrollButtons.Arrow.Normal.StopColor = -1
    LookAndFeel.ScrollButtons.Arrow.Normal.OutlineColor = -931102592
    LookAndFeel.ScrollButtons.Arrow.Normal.OutlineSize = 1.000000000000000000
    LookAndFeel.ScrollButtons.Arrow.Down.StartColor = -1
    LookAndFeel.ScrollButtons.Arrow.Down.StopColor = -1
    LookAndFeel.ScrollButtons.Arrow.Down.OutlineColor = -931102592
    LookAndFeel.ScrollButtons.Arrow.Down.OutlineSize = 1.000000000000000000
    LookAndFeel.ScrollButtons.Arrow.Hot.StartColor = -1
    LookAndFeel.ScrollButtons.Arrow.Hot.StopColor = -1
    LookAndFeel.ScrollButtons.Arrow.Hot.OutlineColor = -931102592
    LookAndFeel.ScrollButtons.Arrow.Hot.OutlineSize = 1.000000000000000000
    LookAndFeel.ScrollButtons.Arrow.Disabled.StartColor = -1765752640
    LookAndFeel.ScrollButtons.Arrow.Disabled.StopColor = -1765752640
    LookAndFeel.ScrollButtons.Arrow.Disabled.OutlineColor = -931102592
    LookAndFeel.ScrollButtons.Arrow.Disabled.OutlineSize = 1.000000000000000000
    Align = alTop
    TabOrder = 0
    OnMouseEnter = ChromeTabs32MouseEnter
    OnMouseLeave = ChromeTabs32MouseLeave
  end
  object ChromeTabsBottom: TChromeTabs32
    Left = 0
    Top = 575
    Width = 1017
    Height = 31
    OnChange = ChromeTabs32Change
    OnActiveTabChanged = ChromeTabs32ActiveTabChanged
    OnDebugLog = ChromeTabs32DebugLog
    OnButtonAddClick = ChromeTabs32ButtonAddClick
    OnButtonCloseTabClick = ChromeTabs32ButtonCloseTabClick
    OnNeedDragImageControl = ChromeTabs32NeedDragImageControl
    OnShowHint = ChromeTabs32ShowHint
    OnTabDragDrop = ChromeTabsBottomTabDragDrop
    ActiveTabIndex = -1
    Images = ImageList1
    ImagesOverlay = ImageList2
    ImagesSpinnerUpload = ImageList4
    ImagesSpinnerDownload = ImageList3
    Options.Display.CloseButton.Offsets.Vertical = 6
    Options.Display.CloseButton.Offsets.Horizontal = 2
    Options.Display.CloseButton.Height = 14
    Options.Display.CloseButton.Width = 14
    Options.Display.CloseButton.AutoHide = True
    Options.Display.CloseButton.Visibility = bvAll
    Options.Display.CloseButton.AutoHideWidth = 20
    Options.Display.CloseButton.CrossRadialOffset = 4
    Options.Display.AddButton.Offsets.Vertical = 7
    Options.Display.AddButton.Offsets.Horizontal = 2
    Options.Display.AddButton.Height = 15
    Options.Display.AddButton.Width = 32
    Options.Display.AddButton.ShowPlusSign = False
    Options.Display.AddButton.Visibility = avRightFloating
    Options.Display.AddButton.HorizontalOffsetFloating = -3
    Options.Display.ScrollButtonLeft.Offsets.Vertical = 7
    Options.Display.ScrollButtonLeft.Offsets.Horizontal = 1
    Options.Display.ScrollButtonLeft.Height = 15
    Options.Display.ScrollButtonLeft.Width = 15
    Options.Display.ScrollButtonRight.Offsets.Vertical = 7
    Options.Display.ScrollButtonRight.Offsets.Horizontal = 1
    Options.Display.ScrollButtonRight.Height = 15
    Options.Display.ScrollButtonRight.Width = 15
    Options.Display.TabModifiedGlow.Style = msRightToLeft
    Options.Display.TabModifiedGlow.VerticalOffset = -6
    Options.Display.TabModifiedGlow.Height = 30
    Options.Display.TabModifiedGlow.Width = 100
    Options.Display.TabModifiedGlow.AnimationPeriodMS = 4000
    Options.Display.TabModifiedGlow.EaseType = ttEaseInOutQuad
    Options.Display.TabModifiedGlow.AnimationUpdateMS = 50
    Options.Display.Tabs.SeeThroughTabs = False
    Options.Display.Tabs.TabOverlap = 15
    Options.Display.Tabs.ContentOffsetLeft = 18
    Options.Display.Tabs.ContentOffsetRight = 16
    Options.Display.Tabs.OffsetLeft = 0
    Options.Display.Tabs.OffsetTop = 0
    Options.Display.Tabs.OffsetRight = 0
    Options.Display.Tabs.OffsetBottom = 4
    Options.Display.Tabs.MinWidth = 25
    Options.Display.Tabs.MaxWidth = 200
    Options.Display.Tabs.TabWidthFromContent = False
    Options.Display.Tabs.PinnedWidth = 39
    Options.Display.Tabs.ImageOffsetLeft = 13
    Options.Display.Tabs.TextTrimType = tttFade
    Options.Display.Tabs.Orientation = toBottom
    Options.Display.Tabs.BaseLineTabRegionOnly = False
    Options.Display.Tabs.WordWrap = False
    Options.Display.Tabs.TextAlignmentHorizontal = taLeftJustify
    Options.Display.Tabs.TextAlignmentVertical = taVerticalCenter
    Options.Display.Tabs.ShowImages = True
    Options.Display.Tabs.ShowPinnedTabText = False
    Options.Display.TabContainer.TransparentBackground = False
    Options.Display.TabContainer.OverlayButtons = True
    Options.Display.TabContainer.PaddingLeft = 0
    Options.Display.TabContainer.PaddingRight = 0
    Options.Display.TabMouseGlow.Offsets.Vertical = 0
    Options.Display.TabMouseGlow.Offsets.Horizontal = 0
    Options.Display.TabMouseGlow.Height = 200
    Options.Display.TabMouseGlow.Width = 200
    Options.Display.TabMouseGlow.Visible = True
    Options.Display.TabSpinners.Upload.ReverseDirection = True
    Options.Display.TabSpinners.Upload.RenderedAnimationStep = 2
    Options.Display.TabSpinners.Upload.Position.Offsets.Vertical = 0
    Options.Display.TabSpinners.Upload.Position.Offsets.Horizontal = 0
    Options.Display.TabSpinners.Upload.Position.Height = 16
    Options.Display.TabSpinners.Upload.Position.Width = 16
    Options.Display.TabSpinners.Upload.SweepAngle = 135
    Options.Display.TabSpinners.Download.ReverseDirection = False
    Options.Display.TabSpinners.Download.RenderedAnimationStep = 5
    Options.Display.TabSpinners.Download.Position.Offsets.Vertical = 0
    Options.Display.TabSpinners.Download.Position.Offsets.Horizontal = 0
    Options.Display.TabSpinners.Download.Position.Height = 16
    Options.Display.TabSpinners.Download.Position.Width = 16
    Options.Display.TabSpinners.Download.SweepAngle = 135
    Options.Display.TabSpinners.AnimationUpdateMS = 50
    Options.Display.TabSpinners.HideImagesWhenSpinnerVisible = True
    Options.DragDrop.DragType = dtBetweenContainers
    Options.DragDrop.DragOutsideImageAlpha = 220
    Options.DragDrop.DragOutsideDistancePixels = 30
    Options.DragDrop.DragStartPixels = 2
    Options.DragDrop.DragControlImageResizeFactor = 0.500000000000000000
    Options.DragDrop.DragCursor = crDefault
    Options.DragDrop.DragDisplay = ddTabAndControl
    Options.DragDrop.DragFormBorderWidth = 2
    Options.DragDrop.DragFormBorderColor = 8421504
    Options.DragDrop.ContrainDraggedTabWithinContainer = True
    Options.Animation.DefaultMovementAnimationTimeMS = 100
    Options.Animation.DefaultStyleAnimationTimeMS = 300
    Options.Animation.AnimationTimerInterval = 15
    Options.Animation.MinimumTabAnimationWidth = 40
    Options.Animation.DefaultMovementEaseType = ttLinearTween
    Options.Animation.DefaultStyleEaseType = ttLinearTween
    Options.Animation.MovementAnimations.TabAdd.UseDefaultEaseType = True
    Options.Animation.MovementAnimations.TabAdd.UseDefaultAnimationTime = True
    Options.Animation.MovementAnimations.TabAdd.EaseType = ttEaseOutExpo
    Options.Animation.MovementAnimations.TabAdd.AnimationTimeMS = 500
    Options.Animation.MovementAnimations.TabDelete.UseDefaultEaseType = True
    Options.Animation.MovementAnimations.TabDelete.UseDefaultAnimationTime = True
    Options.Animation.MovementAnimations.TabDelete.EaseType = ttEaseOutExpo
    Options.Animation.MovementAnimations.TabDelete.AnimationTimeMS = 500
    Options.Animation.MovementAnimations.TabMove.UseDefaultEaseType = True
    Options.Animation.MovementAnimations.TabMove.UseDefaultAnimationTime = True
    Options.Animation.MovementAnimations.TabMove.EaseType = ttEaseOutExpo
    Options.Animation.MovementAnimations.TabMove.AnimationTimeMS = 500
    Options.Behaviour.BackgroundDblClickMaximiseRestoreForm = True
    Options.Behaviour.BackgroundDragMovesForm = True
    Options.Behaviour.TabSmartDeleteResizing = True
    Options.Behaviour.TabSmartDeleteResizeCancelDelay = 700
    Options.Behaviour.UseBuiltInPopupMenu = True
    Options.Behaviour.TabRightClickSelect = True
    Options.Behaviour.ActivateNewTab = True
    Options.Behaviour.DebugMode = False
    Options.Behaviour.IgnoreDoubleClicksWhileAnimatingMovement = True
    Options.Scrolling.Enabled = True
    Options.Scrolling.ScrollButtons = csbRight
    Options.Scrolling.ScrollStep = 20
    Options.Scrolling.ScrollRepeatDelay = 20
    Options.Scrolling.AutoHideButtons = False
    Options.Scrolling.DragScroll = True
    Options.Scrolling.DragScrollOffset = 50
    Options.Scrolling.MouseWheelScroll = True
    Tabs = <>
    LookAndFeel.TabsContainer.StartColor = 14586466
    LookAndFeel.TabsContainer.StopColor = 13201730
    LookAndFeel.TabsContainer.OutlineColor = 14520930
    LookAndFeel.Tabs.BaseLine.Color = 11110509
    LookAndFeel.Tabs.BaseLine.Thickness = 1.000000000000000000
    LookAndFeel.Tabs.Modified.CenterColor = -2097152001
    LookAndFeel.Tabs.Modified.OutsideColor = 16777215
    LookAndFeel.Tabs.DefaultFont.Name = 'Segoe UI'
    LookAndFeel.Tabs.DefaultFont.Color = -16777216
    LookAndFeel.Tabs.DefaultFont.Size = 9
    LookAndFeel.Tabs.MouseGlow.CenterColor = 2030043135
    LookAndFeel.Tabs.MouseGlow.OutsideColor = 16777215
    LookAndFeel.Tabs.Spinners.Upload.Color = 12759975
    LookAndFeel.Tabs.Spinners.Upload.Thickness = 2.500000000000000000
    LookAndFeel.Tabs.Spinners.Download.Color = 14388040
    LookAndFeel.Tabs.Spinners.Download.Thickness = 2.500000000000000000
    LookAndFeel.Tabs.Active.Font.Name = 'Segoe UI'
    LookAndFeel.Tabs.Active.Font.Color = 1686077184
    LookAndFeel.Tabs.Active.Font.Size = 9
    LookAndFeel.Tabs.Active.Font.UseDefaultFont = True
    LookAndFeel.Tabs.Active.Style.StartColor = -1
    LookAndFeel.Tabs.Active.Style.StopColor = 16316664
    LookAndFeel.Tabs.Active.Style.OutlineColor = 9985595
    LookAndFeel.Tabs.Active.Style.OutlineSize = 1.000000000000000000
    LookAndFeel.Tabs.NotActive.Font.Name = 'Segoe UI'
    LookAndFeel.Tabs.NotActive.Font.Color = -682277314
    LookAndFeel.Tabs.NotActive.Font.Size = 9
    LookAndFeel.Tabs.NotActive.Font.UseDefaultFont = True
    LookAndFeel.Tabs.NotActive.Style.StartColor = 16107683
    LookAndFeel.Tabs.NotActive.Style.StopColor = 15778203
    LookAndFeel.Tabs.NotActive.Style.OutlineColor = 10576703
    LookAndFeel.Tabs.NotActive.Style.OutlineSize = 1.000000000000000000
    LookAndFeel.Tabs.Hot.Font.Name = 'Segoe UI'
    LookAndFeel.Tabs.Hot.Font.Color = 4210752
    LookAndFeel.Tabs.Hot.Font.Size = 9
    LookAndFeel.Tabs.Hot.Font.UseDefaultFont = True
    LookAndFeel.Tabs.Hot.Style.StartColor = 16308929
    LookAndFeel.Tabs.Hot.Style.StopColor = 15979450
    LookAndFeel.Tabs.Hot.Style.OutlineColor = 12423799
    LookAndFeel.Tabs.Hot.Style.OutlineSize = 1.000000000000000000
    LookAndFeel.CloseButton.Cross.Normal.Color = 6643031
    LookAndFeel.CloseButton.Cross.Normal.Thickness = 2.000000000000000000
    LookAndFeel.CloseButton.Cross.Down.Color = 15461369
    LookAndFeel.CloseButton.Cross.Down.Thickness = 2.000000000000000000
    LookAndFeel.CloseButton.Cross.Hot.Color = -587202561
    LookAndFeel.CloseButton.Cross.Hot.Thickness = 2.000000000000000000
    LookAndFeel.CloseButton.Circle.Normal.StartColor = 10930928
    LookAndFeel.CloseButton.Circle.Normal.StopColor = 16777215
    LookAndFeel.CloseButton.Circle.Normal.OutlineColor = 8421504
    LookAndFeel.CloseButton.Circle.Normal.OutlineSize = 1.000000000000000000
    LookAndFeel.CloseButton.Circle.Down.StartColor = 3487169
    LookAndFeel.CloseButton.Circle.Down.StopColor = 3487169
    LookAndFeel.CloseButton.Circle.Down.OutlineColor = 8421504
    LookAndFeel.CloseButton.Circle.Down.OutlineSize = 1.000000000000000000
    LookAndFeel.CloseButton.Circle.Hot.StartColor = 9408475
    LookAndFeel.CloseButton.Circle.Hot.StopColor = 9803748
    LookAndFeel.CloseButton.Circle.Hot.OutlineColor = 6054595
    LookAndFeel.CloseButton.Circle.Hot.OutlineSize = 1.000000000000000000
    LookAndFeel.AddButton.Button.Normal.StartColor = 16041889
    LookAndFeel.AddButton.Button.Normal.StopColor = 15844511
    LookAndFeel.AddButton.Button.Normal.OutlineColor = 11889731
    LookAndFeel.AddButton.Button.Normal.OutlineSize = 1.000000000000000000
    LookAndFeel.AddButton.Button.Down.StartColor = 12355685
    LookAndFeel.AddButton.Button.Down.StopColor = 12091999
    LookAndFeel.AddButton.Button.Down.OutlineColor = 9135436
    LookAndFeel.AddButton.Button.Down.OutlineSize = 1.000000000000000000
    LookAndFeel.AddButton.Button.Hot.StartColor = 16375240
    LookAndFeel.AddButton.Button.Hot.StopColor = 16044468
    LookAndFeel.AddButton.Button.Hot.OutlineColor = 11824194
    LookAndFeel.AddButton.Button.Hot.OutlineSize = 1.000000000000000000
    LookAndFeel.AddButton.PlusSign.Normal.StartColor = -1
    LookAndFeel.AddButton.PlusSign.Normal.StopColor = -1
    LookAndFeel.AddButton.PlusSign.Normal.OutlineColor = -8421505
    LookAndFeel.AddButton.PlusSign.Normal.OutlineSize = 1.000000000000000000
    LookAndFeel.AddButton.PlusSign.Down.StartColor = -1
    LookAndFeel.AddButton.PlusSign.Down.StopColor = -1
    LookAndFeel.AddButton.PlusSign.Down.OutlineColor = -8421505
    LookAndFeel.AddButton.PlusSign.Down.OutlineSize = 1.000000000000000000
    LookAndFeel.AddButton.PlusSign.Hot.StartColor = -1
    LookAndFeel.AddButton.PlusSign.Hot.StopColor = -1
    LookAndFeel.AddButton.PlusSign.Hot.OutlineColor = -8421505
    LookAndFeel.AddButton.PlusSign.Hot.OutlineSize = 1.000000000000000000
    LookAndFeel.ScrollButtons.Button.Normal.StartColor = 15975841
    LookAndFeel.ScrollButtons.Button.Normal.StopColor = 15778204
    LookAndFeel.ScrollButtons.Button.Normal.OutlineColor = -8218449
    LookAndFeel.ScrollButtons.Button.Normal.OutlineSize = 1.000000000000000000
    LookAndFeel.ScrollButtons.Button.Down.StartColor = 12355684
    LookAndFeel.ScrollButtons.Button.Down.StopColor = 12091999
    LookAndFeel.ScrollButtons.Button.Down.OutlineColor = 9135180
    LookAndFeel.ScrollButtons.Button.Down.OutlineSize = 1.000000000000000000
    LookAndFeel.ScrollButtons.Button.Hot.StartColor = 16241848
    LookAndFeel.ScrollButtons.Button.Hot.StopColor = 16044468
    LookAndFeel.ScrollButtons.Button.Hot.OutlineColor = 11824194
    LookAndFeel.ScrollButtons.Button.Hot.OutlineSize = 1.000000000000000000
    LookAndFeel.ScrollButtons.Button.Disabled.StartColor = 13531723
    LookAndFeel.ScrollButtons.Button.Disabled.StopColor = 13267523
    LookAndFeel.ScrollButtons.Button.Disabled.OutlineColor = 9985595
    LookAndFeel.ScrollButtons.Button.Disabled.OutlineSize = 1.000000000000000000
    LookAndFeel.ScrollButtons.Arrow.Normal.StartColor = -1
    LookAndFeel.ScrollButtons.Arrow.Normal.StopColor = -1
    LookAndFeel.ScrollButtons.Arrow.Normal.OutlineColor = -931102592
    LookAndFeel.ScrollButtons.Arrow.Normal.OutlineSize = 1.000000000000000000
    LookAndFeel.ScrollButtons.Arrow.Down.StartColor = -1
    LookAndFeel.ScrollButtons.Arrow.Down.StopColor = -1
    LookAndFeel.ScrollButtons.Arrow.Down.OutlineColor = -931102592
    LookAndFeel.ScrollButtons.Arrow.Down.OutlineSize = 1.000000000000000000
    LookAndFeel.ScrollButtons.Arrow.Hot.StartColor = -1
    LookAndFeel.ScrollButtons.Arrow.Hot.StopColor = -1
    LookAndFeel.ScrollButtons.Arrow.Hot.OutlineColor = -931102592
    LookAndFeel.ScrollButtons.Arrow.Hot.OutlineSize = 1.000000000000000000
    LookAndFeel.ScrollButtons.Arrow.Disabled.StartColor = -1765752640
    LookAndFeel.ScrollButtons.Arrow.Disabled.StopColor = -1765752640
    LookAndFeel.ScrollButtons.Arrow.Disabled.OutlineColor = -931102592
    LookAndFeel.ScrollButtons.Arrow.Disabled.OutlineSize = 1.000000000000000000
    Align = alBottom
    TabOrder = 2
  end
  object PanelMain: TPanel
    Left = 0
    Top = 27
    Width = 1017
    Height = 548
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object PanelTop: TPanel
      Left = 0
      Top = 0
      Width = 1017
      Height = 29
      Align = alTop
      BevelOuter = bvNone
      Color = clMoneyGreen
      TabOrder = 0
      object LabelShowOptionsAndEventsFor: TLabel
        Left = 7
        Top = 7
        Width = 155
        Height = 15
        Caption = 'Show Options and Events for:'
      end
      object ComboBoxSelectTabs: TComboBox
        Left = 167
        Top = 4
        Width = 128
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 1
        Text = 'Top Tabs'
        OnChange = ComboBoxSelectTabsChange
        Items.Strings = (
          'Top Tabs'
          'Bottom Tabs')
      end
      object PanelOpenNewForm: TPanel
        Left = 873
        Top = 0
        Width = 144
        Height = 29
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object ButtonOpenForm: TButton
          Left = 0
          Top = 1
          Width = 141
          Height = 26
          Caption = 'Open New Form'
          TabOrder = 0
          OnClick = ButtonOpenFormClick
        end
      end
    end
    object PageControlMain: TPageControl
      Left = 0
      Top = 29
      Width = 1017
      Height = 519
      ActivePage = TabSheetOptions
      Align = alClient
      TabOrder = 1
      object TabSheetOptions: TTabSheet
        Caption = 'Options'
        object GroupBoxNewActiveTab: TGroupBox
          Left = 0
          Top = 0
          Width = 270
          Height = 456
          Align = alLeft
          Caption = 'New/Active Tab'
          TabOrder = 0
          object LabelNewTabText: TLabel
            Left = 11
            Top = 22
            Width = 25
            Height = 15
            Caption = 'Text:'
            FocusControl = EditTabCaption
          end
          object LabelNewTabImageIndex: TLabel
            Left = 11
            Top = 70
            Width = 67
            Height = 15
            Caption = 'Image Index:'
            FocusControl = EditImageIndex
          end
          object LabelNewTabImageOverlayIndex: TLabel
            Left = 135
            Top = 70
            Width = 110
            Height = 15
            Caption = 'Image Overlay Index:'
            FocusControl = EditImageOverlayIndex
          end
          object LabelNewTabSpinner: TLabel
            Left = 11
            Top = 115
            Width = 43
            Height = 15
            Caption = 'Spinner:'
            FocusControl = ComboBoxSpinnerState
          end
          object EditTabCaption: TEdit
            Left = 11
            Top = 37
            Width = 246
            Height = 23
            TabOrder = 0
            Text = 'New Tab'
            OnChange = CommonTabPropertyChange
          end
          object EditImageIndex: TSpinEdit
            Left = 11
            Top = 85
            Width = 118
            Height = 24
            MaxValue = 5
            MinValue = -1
            TabOrder = 1
            Value = 0
            OnChange = CommonTabPropertyChange
          end
          object EditImageOverlayIndex: TSpinEdit
            Left = 135
            Top = 85
            Width = 122
            Height = 24
            MaxValue = 1
            MinValue = -1
            TabOrder = 2
            Value = -1
            OnChange = CommonTabPropertyChange
          end
          object CheckBoxPinned: TCheckBox
            Left = 11
            Top = 163
            Width = 67
            Height = 16
            Caption = 'Pinned'
            TabOrder = 4
            OnClick = CommonTabPropertyChange
          end
          object ButtonMakeAllTabsVisible: TButton
            Left = 135
            Top = 193
            Width = 122
            Height = 25
            Caption = 'Make All Tabs Visible'
            TabOrder = 8
            OnClick = ButtonMakeAllTabsVisibleClick
          end
          object CheckBoxModified: TCheckBox
            Left = 75
            Top = 163
            Width = 66
            Height = 16
            Caption = 'Modified'
            TabOrder = 5
            OnClick = CommonTabPropertyChange
          end
          object ButtonHideTab: TButton
            Left = 11
            Top = 193
            Width = 118
            Height = 25
            Caption = 'Hide Tab'
            TabOrder = 7
            OnClick = ButtonHideTabClick
          end
          object ComboBoxSpinnerState: TComboBox
            Left = 11
            Top = 131
            Width = 246
            Height = 23
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 3
            Text = 'None'
            OnChange = CommonTabPropertyChange
            Items.Strings = (
              'None'
              'Rendered-Upload'
              'Rendered-Download'
              'Upload-Image'
              'Download-Image')
          end
          object ButtonDeleteActiveTab: TButton
            Left = 11
            Top = 224
            Width = 118
            Height = 25
            Caption = 'Delete Active Tab'
            TabOrder = 9
            OnClick = ButtonDeleteActiveTabClick
          end
          object CheckBoxHideClosebutton: TCheckBox
            Left = 151
            Top = 163
            Width = 117
            Height = 16
            Caption = 'Hide Close Button'
            TabOrder = 6
            OnClick = CommonTabPropertyChange
          end
        end
        object PageControlOptions: TPageControl
          Left = 270
          Top = 0
          Width = 739
          Height = 456
          ActivePage = TabSheetInternationalization
          Align = alClient
          TabOrder = 1
          object TabSheetTabs: TTabSheet
            Caption = 'Tabs'
            object GroupBoxTabs: TGroupBox
              Left = 0
              Top = 0
              Width = 731
              Height = 185
              Align = alTop
              Caption = 'Tabs'
              TabOrder = 0
              object LabelPinnedWidth: TLabel
                Left = 8
                Top = 76
                Width = 75
                Height = 15
                Caption = 'Pinned Width:'
                FocusControl = EditPinnedWidth
              end
              object LabelMaxTabWidth: TLabel
                Left = 108
                Top = 20
                Width = 83
                Height = 15
                Caption = 'Max Tab Width:'
                FocusControl = EditMaxTabWidth
              end
              object LabelMinTabWidth: TLabel
                Left = 8
                Top = 21
                Width = 82
                Height = 15
                Caption = 'Min Tab Width:'
                FocusControl = EditMinTabWidth
              end
              object LabelTabOffset: TLabel
                Left = 278
                Top = 20
                Width = 120
                Height = 15
                Caption = 'Tab/Container Offsets:'
                FocusControl = EditTabOffsetTop
              end
              object LabelTabContentMargins: TLabel
                Left = 283
                Top = 131
                Width = 115
                Height = 15
                Caption = 'Tab Content Margins:'
                FocusControl = EditTabOffsetTop
              end
              object LabelTabOverlay: TLabel
                Left = 108
                Top = 76
                Width = 67
                Height = 15
                Caption = 'Tab Overlap:'
                FocusControl = EditTabOverlap
              end
              object EditPinnedWidth: TSpinEdit
                Left = 8
                Top = 92
                Width = 94
                Height = 24
                MaxValue = 65535
                MinValue = -65535
                TabOrder = 7
                Value = 39
                OnChange = OnCommonControlPropertyChange
              end
              object EditMaxTabWidth: TSpinEdit
                Left = 108
                Top = 37
                Width = 94
                Height = 24
                MaxValue = 65535
                MinValue = 4
                TabOrder = 1
                Value = 200
                OnChange = OnCommonControlPropertyChange
              end
              object EditMinTabWidth: TSpinEdit
                Left = 8
                Top = 37
                Width = 94
                Height = 24
                MaxValue = 65535
                MinValue = 4
                TabOrder = 0
                Value = 150
                OnChange = OnCommonControlPropertyChange
              end
              object EditTabOffsetTop: TSpinEdit
                Left = 312
                Top = 37
                Width = 53
                Height = 24
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = []
                Increment = 2
                MaxValue = 65535
                MinValue = -65535
                ParentFont = False
                TabOrder = 2
                Value = 4
                OnChange = OnCommonControlPropertyChange
              end
              object EditTabOffsetLeft: TSpinEdit
                Left = 280
                Top = 67
                Width = 53
                Height = 24
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = []
                Increment = 10
                MaxValue = 65535
                MinValue = -65535
                ParentFont = False
                TabOrder = 4
                Value = 0
                OnChange = OnCommonControlPropertyChange
              end
              object EditTabOffsetRight: TSpinEdit
                Left = 352
                Top = 67
                Width = 53
                Height = 24
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = []
                Increment = 10
                MaxValue = 65535
                MinValue = -65535
                ParentFont = False
                TabOrder = 5
                Value = 0
                OnChange = OnCommonControlPropertyChange
              end
              object EditTabOffsetBottom: TSpinEdit
                Left = 312
                Top = 97
                Width = 53
                Height = 24
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = []
                Increment = 2
                MaxValue = 65535
                MinValue = -65535
                ParentFont = False
                TabOrder = 9
                Value = 0
                OnChange = OnCommonControlPropertyChange
              end
              object EditContainerOffsetLeft: TSpinEdit
                Left = 221
                Top = 67
                Width = 53
                Height = 24
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = []
                Increment = 10
                MaxValue = 65535
                MinValue = -65535
                ParentFont = False
                TabOrder = 3
                Value = 0
                OnChange = OnCommonControlPropertyChange
              end
              object EditContainerOffsetRight: TSpinEdit
                Left = 411
                Top = 67
                Width = 53
                Height = 24
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = []
                Increment = 10
                MaxValue = 65535
                MinValue = -65535
                ParentFont = False
                TabOrder = 6
                Value = 0
                OnChange = OnCommonControlPropertyChange
              end
              object EditTabContentMarginLeft: TSpinEdit
                Left = 285
                Top = 148
                Width = 53
                Height = 24
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = []
                MaxValue = 65535
                MinValue = -65535
                ParentFont = False
                TabOrder = 11
                Value = 18
                OnChange = OnCommonControlPropertyChange
              end
              object EditTabContentMarginRight: TSpinEdit
                Left = 344
                Top = 148
                Width = 53
                Height = 24
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = []
                MaxValue = 65535
                MinValue = -65535
                ParentFont = False
                TabOrder = 12
                Value = 16
                OnChange = OnCommonControlPropertyChange
              end
              object EditTabOverlap: TSpinEdit
                Left = 108
                Top = 92
                Width = 94
                Height = 24
                MaxValue = 65535
                MinValue = -65535
                TabOrder = 8
                Value = 15
                OnChange = OnCommonControlPropertyChange
              end
              object CheckBoxSeeThroughTabs: TCheckBox
                Left = 8
                Top = 122
                Width = 129
                Height = 17
                Caption = 'See through tabs'
                TabOrder = 10
                OnClick = OnCommonControlPropertyChange
              end
              object CheckBoxSetTabWidthsFromCaptions: TCheckBox
                Left = 8
                Top = 142
                Width = 182
                Height = 17
                Caption = 'Set tab widths from captions'
                TabOrder = 13
                OnClick = OnCommonControlPropertyChange
              end
              object CheckBoxCustomTabShapes: TCheckBox
                Left = 9
                Top = 162
                Width = 270
                Height = 17
                Caption = 'Custom tab shapes (OnGetControlPolygons)'
                TabOrder = 14
                OnClick = OnCommonControlPropertyChange
              end
            end
            object PageControlTabExtras: TPageControl
              Left = 0
              Top = 185
              Width = 731
              Height = 216
              ActivePage = TabSheetSpinners
              Align = alTop
              TabOrder = 1
              object TabSheetModifiedGlow: TTabSheet
                Caption = 'Modified Glow'
                object LabelModifiedGlowAnimationStyle: TLabel
                  Left = 3
                  Top = 4
                  Width = 87
                  Height = 15
                  Caption = 'Animation Style:'
                  FocusControl = ComboBoxModifiedGlowStyle
                end
                object LabelModifiedGlowVerticalOffset: TLabel
                  Left = 227
                  Top = 50
                  Width = 77
                  Height = 15
                  Caption = 'Vertical Offset:'
                  FocusControl = EditModifiedGlowVerticalOffset
                end
                object LabelModifiedGlowAnimationPeriod: TLabel
                  Left = 335
                  Top = 50
                  Width = 96
                  Height = 15
                  Caption = 'Animation Period:'
                  FocusControl = EditModifiedGlowAnimationPeriod
                end
                object LabelModifiedGlowHeight: TLabel
                  Left = 3
                  Top = 50
                  Width = 39
                  Height = 15
                  Caption = 'Height:'
                  FocusControl = EditModifiedGlowHeight
                end
                object LabelModifiedGlowWidth: TLabel
                  Left = 111
                  Top = 50
                  Width = 35
                  Height = 15
                  Caption = 'Width:'
                  FocusControl = EditModifiedGlowWidth
                end
                object LabelModifiedGlowAnimationEaseType: TLabel
                  Left = 163
                  Top = 2
                  Width = 114
                  Height = 15
                  Caption = 'Animation Ease Type:'
                  FocusControl = ComboBoxModifiedGlowEaseType
                end
                object LabelModifiedGlowAnimationUpdate: TLabel
                  Left = 447
                  Top = 50
                  Width = 100
                  Height = 15
                  Caption = 'Animation Update:'
                  FocusControl = EditModifiedGlowAnimationUpdate
                end
                object ComboBoxModifiedGlowStyle: TComboBox
                  Left = 3
                  Top = 19
                  Width = 143
                  Height = 23
                  Style = csDropDownList
                  ItemIndex = 2
                  TabOrder = 0
                  Text = 'Right to Left'
                  OnChange = OnCommonControlPropertyChange
                  Items.Strings = (
                    'None'
                    'Left to Right'
                    'Right to Left'
                    'Knight Rider')
                end
                object EditModifiedGlowVerticalOffset: TSpinEdit
                  Left = 227
                  Top = 67
                  Width = 94
                  Height = 24
                  MaxValue = 65535
                  MinValue = -65535
                  TabOrder = 4
                  Value = -2
                  OnChange = OnCommonControlPropertyChange
                end
                object EditModifiedGlowAnimationPeriod: TSpinEdit
                  Left = 335
                  Top = 67
                  Width = 106
                  Height = 24
                  MaxValue = 65535
                  MinValue = 1
                  TabOrder = 5
                  Value = 4000
                  OnChange = OnCommonControlPropertyChange
                end
                object EditModifiedGlowHeight: TSpinEdit
                  Left = 3
                  Top = 67
                  Width = 94
                  Height = 24
                  MaxValue = 65535
                  MinValue = 1
                  TabOrder = 2
                  Value = 20
                  OnChange = OnCommonControlPropertyChange
                end
                object EditModifiedGlowWidth: TSpinEdit
                  Left = 111
                  Top = 67
                  Width = 94
                  Height = 24
                  MaxValue = 65535
                  MinValue = 1
                  TabOrder = 3
                  Value = 50
                  OnChange = OnCommonControlPropertyChange
                end
                object ComboBoxModifiedGlowEaseType: TComboBox
                  Left = 163
                  Top = 19
                  Width = 165
                  Height = 23
                  Style = csDropDownList
                  ItemIndex = 0
                  TabOrder = 1
                  Text = 'None'
                  OnChange = OnCommonControlPropertyChange
                  Items.Strings = (
                    'None'
                    'Linear'
                    'In Quad'
                    'Out Quad'
                    'In Out Quad'
                    'In Cubic'
                    'Out Cubic'
                    'In Out Cubic'
                    'In Quart'
                    'Out Quart'
                    'In Out Quart'
                    'In Quint'
                    'Out Quint'
                    'In Out Quint'
                    'In Sine'
                    'Out Sine'
                    'In Out Sine'
                    'In Expo'
                    'Out Expo'
                    'In Out Expo'
                    'In Circ'
                    'Out Circ'
                    'In Out Circ')
                end
                object EditModifiedGlowAnimationUpdate: TSpinEdit
                  Left = 447
                  Top = 67
                  Width = 106
                  Height = 24
                  MaxValue = 65535
                  MinValue = 1
                  TabOrder = 6
                  Value = 50
                  OnChange = OnCommonControlPropertyChange
                end
              end
              object TabSheetMouseGlow: TTabSheet
                Caption = 'Mouse Glow'
                ImageIndex = 1
                object PanelMouseGlow: TPanel
                  Left = -5
                  Top = 27
                  Width = 521
                  Height = 41
                  BevelOuter = bvNone
                  TabOrder = 1
                  object LabelMouseGlowVerticalOffset: TLabel
                    Left = 233
                    Top = -1
                    Width = 77
                    Height = 15
                    Caption = 'Vertical Offset:'
                    FocusControl = EditMouseGlowVerticalOffset
                  end
                  object LabelMouseGlowHorrizontalOffset: TLabel
                    Left = 341
                    Top = -1
                    Width = 93
                    Height = 15
                    Caption = 'Horizontal Offset:'
                    FocusControl = EditMouseGlowHorzOffset
                  end
                  object LabelMouseGlowHeight: TLabel
                    Left = 9
                    Top = -1
                    Width = 39
                    Height = 15
                    Caption = 'Height:'
                    FocusControl = EditMouseGlowHeight
                  end
                  object LabelMouseGlowWidth: TLabel
                    Left = 117
                    Top = -1
                    Width = 35
                    Height = 15
                    Caption = 'Width:'
                    FocusControl = EditMouseGlowWidth
                  end
                  object EditMouseGlowVerticalOffset: TSpinEdit
                    Left = 233
                    Top = 14
                    Width = 94
                    Height = 24
                    MaxValue = 65535
                    MinValue = -65535
                    TabOrder = 2
                    Value = 0
                    OnChange = OnCommonControlPropertyChange
                  end
                  object EditMouseGlowHorzOffset: TSpinEdit
                    Left = 341
                    Top = 14
                    Width = 94
                    Height = 24
                    MaxValue = 65535
                    MinValue = -65535
                    TabOrder = 3
                    Value = 0
                    OnChange = OnCommonControlPropertyChange
                  end
                  object EditMouseGlowHeight: TSpinEdit
                    Left = 9
                    Top = 14
                    Width = 94
                    Height = 24
                    MaxValue = 65535
                    MinValue = 1
                    TabOrder = 0
                    Value = 100
                    OnChange = OnCommonControlPropertyChange
                  end
                  object EditMouseGlowWidth: TSpinEdit
                    Left = 117
                    Top = 14
                    Width = 94
                    Height = 24
                    MaxValue = 65535
                    MinValue = 1
                    TabOrder = 1
                    Value = 100
                    OnChange = OnCommonControlPropertyChange
                  end
                end
                object CheckBoxMouseGlowVisible: TCheckBox
                  Left = 4
                  Top = 5
                  Width = 84
                  Height = 17
                  Caption = 'Visible'
                  Checked = True
                  State = cbChecked
                  TabOrder = 0
                  OnClick = OnCommonControlPropertyChange
                end
              end
              object TabSheetSpinners: TTabSheet
                Caption = 'Spinners'
                ImageIndex = 2
                object LabelSpinnersAnimationUpdate: TLabel
                  Left = 3
                  Top = 2
                  Width = 100
                  Height = 15
                  Caption = 'Animation Update:'
                  FocusControl = EditSpinnerAnimationUpdate
                end
                object EditSpinnerAnimationUpdate: TSpinEdit
                  Left = 3
                  Top = 19
                  Width = 106
                  Height = 24
                  MaxValue = 65535
                  MinValue = 1
                  TabOrder = 0
                  Value = 50
                  OnChange = OnCommonControlPropertyChange
                end
                object CheckBoxHideImagesWhenSpinnerActive: TCheckBox
                  Left = 132
                  Top = 21
                  Width = 229
                  Height = 17
                  Caption = 'Hide Images when Spinner active'
                  Checked = True
                  State = cbChecked
                  TabOrder = 1
                  OnClick = OnCommonControlPropertyChange
                end
                object PageControlTabSpinners: TPageControl
                  Left = 0
                  Top = 49
                  Width = 723
                  Height = 137
                  ActivePage = TabSheetDownload
                  Align = alBottom
                  TabOrder = 2
                  object TabSheetUpload: TTabSheet
                    Caption = 'Upload'
                    ImageIndex = 1
                    object LabelUploadAnimationStep: TLabel
                      Left = 3
                      Top = 5
                      Width = 85
                      Height = 15
                      Caption = 'Animation Step:'
                      FocusControl = EditSpinnerUploadAnimationStep
                    end
                    object LabelUploadWidth: TLabel
                      Left = 3
                      Top = 53
                      Width = 35
                      Height = 15
                      Caption = 'Width:'
                      FocusControl = EditSpinnerUploadWidth
                    end
                    object LabelUploadSweepAngle: TLabel
                      Left = 127
                      Top = 5
                      Width = 71
                      Height = 15
                      Caption = 'Sweep Angle:'
                      FocusControl = EditSpinnerUploadSweepAngle
                    end
                    object LabelUploadHeight: TLabel
                      Left = 127
                      Top = 53
                      Width = 39
                      Height = 15
                      Caption = 'Height:'
                      FocusControl = EditSpinnerUploadHeight
                    end
                    object LabelUploadOffsetX: TLabel
                      Left = 250
                      Top = 53
                      Width = 45
                      Height = 15
                      Caption = 'Offset X:'
                      FocusControl = EditSpinnerUploadOffsetX
                    end
                    object LabelUploadOffsetY: TLabel
                      Left = 370
                      Top = 53
                      Width = 42
                      Height = 15
                      Caption = 'OffsetY:'
                      FocusControl = EditSpinnerUploadOffsetY
                    end
                    object EditSpinnerUploadAnimationStep: TSpinEdit
                      Left = 3
                      Top = 22
                      Width = 106
                      Height = 24
                      MaxValue = 65535
                      MinValue = 1
                      TabOrder = 0
                      Value = 50
                      OnChange = OnCommonControlPropertyChange
                    end
                    object EditSpinnerUploadWidth: TSpinEdit
                      Left = 3
                      Top = 70
                      Width = 106
                      Height = 24
                      MaxValue = 65535
                      MinValue = 1
                      TabOrder = 3
                      Value = 50
                      OnChange = OnCommonControlPropertyChange
                    end
                    object EditSpinnerUploadSweepAngle: TSpinEdit
                      Left = 127
                      Top = 22
                      Width = 106
                      Height = 24
                      MaxValue = 360
                      MinValue = 1
                      TabOrder = 1
                      Value = 50
                      OnChange = OnCommonControlPropertyChange
                    end
                    object CheckBoxSpinnerUploadReverseDirection: TCheckBox
                      Left = 250
                      Top = 25
                      Width = 164
                      Height = 17
                      Caption = 'Reverse Direction'
                      Checked = True
                      State = cbChecked
                      TabOrder = 2
                      OnClick = OnCommonControlPropertyChange
                    end
                    object EditSpinnerUploadHeight: TSpinEdit
                      Left = 127
                      Top = 70
                      Width = 106
                      Height = 24
                      MaxValue = 65535
                      MinValue = 1
                      TabOrder = 4
                      Value = 50
                      OnChange = OnCommonControlPropertyChange
                    end
                    object EditSpinnerUploadOffsetX: TSpinEdit
                      Left = 250
                      Top = 70
                      Width = 106
                      Height = 24
                      MaxValue = 65535
                      MinValue = 1
                      TabOrder = 5
                      Value = 50
                      OnChange = OnCommonControlPropertyChange
                    end
                    object EditSpinnerUploadOffsetY: TSpinEdit
                      Left = 370
                      Top = 70
                      Width = 106
                      Height = 24
                      MaxValue = 65535
                      MinValue = 1
                      TabOrder = 6
                      Value = 50
                      OnChange = OnCommonControlPropertyChange
                    end
                  end
                  object TabSheetDownload: TTabSheet
                    Caption = 'Download'
                    object LabelSpinnersDownloadAnimationStep: TLabel
                      Left = 3
                      Top = 5
                      Width = 85
                      Height = 15
                      Caption = 'Animation Step:'
                      FocusControl = EditSpinnerDownloadAnimationStep
                    end
                    object LabelSpinnersDownloadWidth: TLabel
                      Left = 3
                      Top = 53
                      Width = 35
                      Height = 15
                      Caption = 'Width:'
                      FocusControl = EditSpinnerDownloadWidth
                    end
                    object LabelSpinnersDownloadSweepAngle: TLabel
                      Left = 127
                      Top = 5
                      Width = 71
                      Height = 15
                      Caption = 'Sweep Angle:'
                      FocusControl = EditSpinnerDownloadSweepAngle
                    end
                    object LabelSpinnersDownloadHeight: TLabel
                      Left = 127
                      Top = 53
                      Width = 39
                      Height = 15
                      Caption = 'Height:'
                      FocusControl = EditSpinnerDownloadHeight
                    end
                    object LabelSpinnersDownloadOffsetX: TLabel
                      Left = 250
                      Top = 53
                      Width = 45
                      Height = 15
                      Caption = 'Offset X:'
                      FocusControl = EditSpinnerDownloadOffsetX
                    end
                    object LabelSpinnersDownloadOffsetY: TLabel
                      Left = 370
                      Top = 53
                      Width = 42
                      Height = 15
                      Caption = 'OffsetY:'
                      FocusControl = EditSpinnerDownloadOffsetY
                    end
                    object EditSpinnerDownloadAnimationStep: TSpinEdit
                      Left = 3
                      Top = 22
                      Width = 106
                      Height = 24
                      MaxValue = 65535
                      MinValue = 1
                      TabOrder = 0
                      Value = 50
                      OnChange = OnCommonControlPropertyChange
                    end
                    object EditSpinnerDownloadWidth: TSpinEdit
                      Left = 3
                      Top = 70
                      Width = 106
                      Height = 24
                      MaxValue = 65535
                      MinValue = 1
                      TabOrder = 3
                      Value = 50
                      OnChange = OnCommonControlPropertyChange
                    end
                    object EditSpinnerDownloadSweepAngle: TSpinEdit
                      Left = 127
                      Top = 22
                      Width = 106
                      Height = 24
                      MaxValue = 350
                      MinValue = 1
                      TabOrder = 1
                      Value = 50
                      OnChange = OnCommonControlPropertyChange
                    end
                    object CheckBoxSpinnerDownloadReverseDirection: TCheckBox
                      Left = 250
                      Top = 25
                      Width = 164
                      Height = 17
                      Caption = 'Reverse Direction'
                      Checked = True
                      State = cbChecked
                      TabOrder = 2
                      OnClick = OnCommonControlPropertyChange
                    end
                    object EditSpinnerDownloadHeight: TSpinEdit
                      Left = 127
                      Top = 70
                      Width = 106
                      Height = 24
                      MaxValue = 65535
                      MinValue = 1
                      TabOrder = 4
                      Value = 50
                      OnChange = OnCommonControlPropertyChange
                    end
                    object EditSpinnerDownloadOffsetX: TSpinEdit
                      Left = 250
                      Top = 70
                      Width = 106
                      Height = 24
                      MaxValue = 65535
                      MinValue = 1
                      TabOrder = 5
                      Value = 50
                      OnChange = OnCommonControlPropertyChange
                    end
                    object EditSpinnerDownloadOffsetY: TSpinEdit
                      Left = 370
                      Top = 70
                      Width = 106
                      Height = 24
                      MaxValue = 65535
                      MinValue = 1
                      TabOrder = 6
                      Value = 50
                      OnChange = OnCommonControlPropertyChange
                    end
                  end
                end
              end
            end
          end
          object TabSheetText: TTabSheet
            Caption = 'Text'
            ImageIndex = 6
            object GroupBoxDefaultFont: TGroupBox
              Left = 0
              Top = 0
              Width = 731
              Height = 172
              Align = alTop
              Caption = 'Default Font'
              TabOrder = 0
              object LabelDefaultRenderingMode: TLabel
                Left = 8
                Top = 20
                Width = 157
                Height = 15
                Caption = 'Default Text Rendering Mode:'
                FocusControl = ComboBoxFontHintMode
              end
              object LabelTextFontName: TLabel
                Left = 8
                Top = 73
                Width = 62
                Height = 15
                Caption = 'Font Name:'
                FocusControl = EditDragImageAapha
              end
              object LabelTextFontSize: TLabel
                Left = 184
                Top = 72
                Width = 23
                Height = 15
                Caption = 'Size:'
                FocusControl = EditFontSize
              end
              object LabelTextFontAlpha: TLabel
                Left = 184
                Top = 120
                Width = 34
                Height = 15
                Caption = 'Alpha:'
                FocusControl = EditFontAlpha
              end
              object LabelTextFontColor: TLabel
                Left = 8
                Top = 124
                Width = 66
                Height = 15
                Caption = 'Font Colour:'
                FocusControl = EditFontColor
              end
              object ComboBoxFontHintMode: TComboBox
                Left = 8
                Top = 36
                Width = 170
                Height = 23
                Style = csDropDownList
                ItemIndex = 4
                TabOrder = 0
                Text = 'Anti Alias'
                OnChange = OnCommonControlPropertyChange
                Items.Strings = (
                  'System Default'
                  'Single Bit Per Pixel Grid Fit'
                  'Single Bit Per Pixel'
                  'Anti Alias Grid Fit'
                  'Anti Alias'
                  'ClearType Grid Fit')
              end
              object ComboBoxFontName: TComboBox
                Left = 8
                Top = 89
                Width = 170
                Height = 23
                TabOrder = 1
                Text = 'Segoe UI'
                OnChange = OnCommonControlPropertyChange
              end
              object EditFontSize: TSpinEdit
                Left = 184
                Top = 89
                Width = 94
                Height = 24
                MaxValue = 65535
                MinValue = 1
                TabOrder = 2
                Value = 9
                OnChange = OnCommonControlPropertyChange
              end
              object EditFontAlpha: TSpinEdit
                Left = 184
                Top = 137
                Width = 94
                Height = 24
                MaxValue = 255
                MinValue = 0
                TabOrder = 3
                Value = 255
                OnChange = OnCommonControlPropertyChange
              end
              object EditFontColor: TColorBox
                Left = 8
                Top = 139
                Width = 170
                Height = 22
                DefaultColorColor = clSkyBlue
                TabOrder = 4
                OnChange = OnCommonControlPropertyChange
              end
            end
            object GroupBoxDisplay: TGroupBox
              Left = 0
              Top = 172
              Width = 731
              Height = 151
              Align = alTop
              Caption = 'Display'
              TabOrder = 1
              object LabelTextDisplayTrimmingMode: TLabel
                Left = 13
                Top = 99
                Width = 90
                Height = 15
                Caption = 'Trimming Mode:'
                FocusControl = ComboBoxTextTrimming
              end
              object LabelTextDisplayHorizontalAlignment: TLabel
                Left = 13
                Top = 51
                Width = 122
                Height = 15
                Caption = 'Horzizontal Alignment:'
                FocusControl = ComboBoxTextAlignment
              end
              object LabelTextDisplayVerticalAlignment: TLabel
                Left = 174
                Top = 51
                Width = 101
                Height = 15
                Caption = 'Vertical Alignment:'
                FocusControl = ComboBoxTextVerticalAlignment
              end
              object ComboBoxTextTrimming: TComboBox
                Left = 13
                Top = 115
                Width = 152
                Height = 23
                Style = csDropDownList
                ItemIndex = 6
                TabOrder = 3
                Text = 'Fade'
                OnChange = OnCommonControlPropertyChange
                Items.Strings = (
                  'None'
                  'Character'
                  'Word'
                  'Ellipsis Character'
                  'Ellipsis Word'
                  'Ellipsis Path'
                  'Fade')
              end
              object CheckBoxTabWordWrap: TCheckBox
                Tag = 1
                Left = 13
                Top = 24
                Width = 91
                Height = 17
                Caption = 'Word Wrap'
                TabOrder = 0
                OnClick = OnCommonControlPropertyChange
              end
              object ComboBoxTextAlignment: TComboBox
                Left = 13
                Top = 66
                Width = 150
                Height = 23
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 1
                Text = 'Left'
                OnChange = OnCommonControlPropertyChange
                Items.Strings = (
                  'Left'
                  'Right'
                  'Centre')
              end
              object ComboBoxTextVerticalAlignment: TComboBox
                Left = 174
                Top = 66
                Width = 139
                Height = 23
                Style = csDropDownList
                ItemIndex = 2
                TabOrder = 2
                Text = 'Centre'
                OnChange = OnCommonControlPropertyChange
                Items.Strings = (
                  'Top'
                  'Bottom'
                  'Centre')
              end
              object CheckBoxShowTextOnPinnedTabs: TCheckBox
                Tag = 1
                Left = 173
                Top = 26
                Width = 188
                Height = 17
                Caption = 'Show text on pinned tabs'
                TabOrder = 4
                OnClick = OnCommonControlPropertyChange
              end
            end
          end
          object TabSheetButtons: TTabSheet
            Caption = 'Buttons'
            ImageIndex = 5
            object PageControlButtons: TPageControl
              Left = 0
              Top = 19
              Width = 731
              Height = 407
              ActivePage = TabSheetAddButton
              Align = alClient
              TabOrder = 1
              object TabSheetCloseButtons: TTabSheet
                Caption = 'Close Buttons'
                ImageIndex = 1
                object LabelCloseButtonsVisibility: TLabel
                  Left = 11
                  Top = 6
                  Width = 47
                  Height = 15
                  Caption = 'Visibility:'
                  FocusControl = ComboBoxCloseButtonVisibility
                end
                object LabelCloseButtonsAutoHideTabWidth: TLabel
                  Left = 207
                  Top = 6
                  Width = 108
                  Height = 15
                  Caption = 'Auto hide tab width:'
                  FocusControl = EditCloseButtonAutoHideWidth
                end
                object LabelCloseButtonsVerticalOffset: TLabel
                  Left = 235
                  Top = 56
                  Width = 77
                  Height = 15
                  Caption = 'Vertical Offset:'
                  FocusControl = EditCloseButtonVerticalOffset
                end
                object LabelCloseButtonsHorizontalOffset: TLabel
                  Left = 343
                  Top = 56
                  Width = 63
                  Height = 15
                  Caption = 'Horz Offset:'
                  FocusControl = EditCloseButtonHorzOffset
                end
                object LabelCloseButtonsHeight: TLabel
                  Left = 11
                  Top = 56
                  Width = 39
                  Height = 15
                  Caption = 'Height:'
                  FocusControl = EditCloseButtonHeight
                end
                object LabelCloseButtonsWidth: TLabel
                  Left = 119
                  Top = 56
                  Width = 35
                  Height = 15
                  Caption = 'Width:'
                  FocusControl = EditCloseButtonWidth
                end
                object LabelCloseButtonsCrossOffset: TLabel
                  Left = 11
                  Top = 112
                  Width = 67
                  Height = 15
                  Caption = 'Cross Offset:'
                  FocusControl = EditCrossOffset
                end
                object ComboBoxCloseButtonVisibility: TComboBox
                  Left = 11
                  Top = 21
                  Width = 94
                  Height = 23
                  Style = csDropDownList
                  ItemIndex = 1
                  TabOrder = 0
                  Text = 'All Tabs'
                  OnChange = OnCommonControlPropertyChange
                  Items.Strings = (
                    'Never'
                    'All Tabs'
                    'Active Tab')
                end
                object CheckBoxCloseButtonAutoHide: TCheckBox
                  Left = 115
                  Top = 24
                  Width = 84
                  Height = 17
                  Caption = 'Auto Hide'
                  TabOrder = 2
                  OnClick = OnCommonControlPropertyChange
                end
                object EditCloseButtonAutoHideWidth: TSpinEdit
                  Left = 206
                  Top = 21
                  Width = 114
                  Height = 24
                  MaxValue = 65535
                  MinValue = 1
                  TabOrder = 1
                  Value = 20
                  OnChange = OnCommonControlPropertyChange
                end
                object EditCloseButtonVerticalOffset: TSpinEdit
                  Left = 235
                  Top = 73
                  Width = 94
                  Height = 24
                  MaxValue = 65535
                  MinValue = -65535
                  TabOrder = 5
                  Value = 6
                  OnChange = OnCommonControlPropertyChange
                end
                object EditCloseButtonHorzOffset: TSpinEdit
                  Left = 343
                  Top = 73
                  Width = 94
                  Height = 24
                  MaxValue = 65535
                  MinValue = -65535
                  TabOrder = 6
                  Value = 2
                  OnChange = OnCommonControlPropertyChange
                end
                object EditCloseButtonHeight: TSpinEdit
                  Left = 11
                  Top = 73
                  Width = 94
                  Height = 24
                  MaxValue = 65535
                  MinValue = -65535
                  TabOrder = 3
                  Value = 14
                  OnChange = OnCommonControlPropertyChange
                end
                object EditCloseButtonWidth: TSpinEdit
                  Left = 119
                  Top = 73
                  Width = 94
                  Height = 24
                  MaxValue = 65535
                  MinValue = -65535
                  TabOrder = 4
                  Value = 14
                  OnChange = OnCommonControlPropertyChange
                end
                object EditCrossOffset: TSpinEdit
                  Left = 11
                  Top = 129
                  Width = 94
                  Height = 24
                  MaxValue = 65535
                  MinValue = -65535
                  TabOrder = 7
                  Value = 3
                  OnChange = OnCommonControlPropertyChange
                end
              end
              object TabSheetAddButton: TTabSheet
                Caption = 'Add Button'
                ImageIndex = 2
                object LabelAddButtonVisibility: TLabel
                  Left = 11
                  Top = 6
                  Width = 47
                  Height = 15
                  Caption = 'Visibility:'
                  FocusControl = ComboBoxAddButtonVisibility
                end
                object LabelAddButtonVerticalOffset: TLabel
                  Left = 235
                  Top = 56
                  Width = 77
                  Height = 15
                  Caption = 'Vertical Offset:'
                  FocusControl = EditAddButtonVerticalOffset
                end
                object LabelAddButtonHorizontalOffset: TLabel
                  Left = 343
                  Top = 56
                  Width = 63
                  Height = 15
                  Caption = 'Horz Offset:'
                  FocusControl = EditAddButtonHorzOffset
                end
                object LabelAddButtonHeight: TLabel
                  Left = 11
                  Top = 56
                  Width = 39
                  Height = 15
                  Caption = 'Height:'
                  FocusControl = EditAddButtonHeight
                end
                object LabelAddButtonWidth: TLabel
                  Left = 119
                  Top = 56
                  Width = 35
                  Height = 15
                  Caption = 'Width:'
                  FocusControl = EditAddButtonWidth
                end
                object LabelAddButtonFloatingOffset: TLabel
                  Left = 443
                  Top = 56
                  Width = 109
                  Height = 15
                  Caption = 'Floating Horz Offset:'
                  FocusControl = EditAddButtonFloatingHorzOffset
                end
                object ComboBoxAddButtonVisibility: TComboBox
                  Left = 11
                  Top = 21
                  Width = 118
                  Height = 23
                  Style = csDropDownList
                  ItemIndex = 2
                  TabOrder = 0
                  Text = 'Floating Right'
                  OnChange = OnCommonControlPropertyChange
                  Items.Strings = (
                    'None'
                    'Left'
                    'Floating Right'
                    'Fixed Right')
                end
                object EditAddButtonVerticalOffset: TSpinEdit
                  Left = 235
                  Top = 73
                  Width = 94
                  Height = 24
                  MaxValue = 65535
                  MinValue = -65535
                  TabOrder = 4
                  Value = 9
                  OnChange = OnCommonControlPropertyChange
                end
                object EditAddButtonHorzOffset: TSpinEdit
                  Left = 343
                  Top = 73
                  Width = 94
                  Height = 24
                  MaxValue = 65535
                  MinValue = -65535
                  TabOrder = 5
                  Value = 2
                  OnChange = OnCommonControlPropertyChange
                end
                object EditAddButtonHeight: TSpinEdit
                  Left = 11
                  Top = 73
                  Width = 94
                  Height = 24
                  MaxValue = 65535
                  MinValue = -65535
                  TabOrder = 2
                  Value = 14
                  OnChange = OnCommonControlPropertyChange
                end
                object EditAddButtonWidth: TSpinEdit
                  Left = 119
                  Top = 73
                  Width = 94
                  Height = 24
                  MaxValue = 65535
                  MinValue = -65535
                  TabOrder = 3
                  Value = 25
                  OnChange = OnCommonControlPropertyChange
                end
                object CheckBoxShowPlus: TCheckBox
                  Left = 147
                  Top = 24
                  Width = 118
                  Height = 17
                  Caption = 'Show Plus'
                  Checked = True
                  State = cbChecked
                  TabOrder = 1
                  OnClick = OnCommonControlPropertyChange
                end
                object EditAddButtonFloatingHorzOffset: TSpinEdit
                  Left = 443
                  Top = 73
                  Width = 118
                  Height = 24
                  MaxValue = 65535
                  MinValue = -65535
                  TabOrder = 6
                  Value = 2
                  OnChange = OnCommonControlPropertyChange
                end
              end
              object TabSheetScrollButtons: TTabSheet
                Caption = 'Scroll Buttons'
                ImageIndex = 3
                object LabelButtonsScrollButtons: TLabel
                  Left = 11
                  Top = 7
                  Width = 76
                  Height = 15
                  Caption = 'Scroll Buttons:'
                  FocusControl = ComboBoxScrollButtons
                end
                object ComboBoxScrollButtons: TComboBox
                  Left = 11
                  Top = 23
                  Width = 144
                  Height = 23
                  Style = csDropDownList
                  ItemIndex = 2
                  TabOrder = 0
                  Text = 'Right'
                  OnChange = OnCommonControlPropertyChange
                  Items.Strings = (
                    'None'
                    'Left'
                    'Right'
                    'LeftAndRight')
                end
                object CheckBoxAutoHideScrollButtons: TCheckBox
                  Left = 161
                  Top = 26
                  Width = 138
                  Height = 17
                  Caption = 'Auto Hide'
                  Checked = True
                  State = cbChecked
                  TabOrder = 1
                  OnClick = OnCommonControlPropertyChange
                end
                object GroupBoxLeftButton: TGroupBox
                  Left = 13
                  Top = 63
                  Width = 508
                  Height = 74
                  Caption = 'Left Button'
                  TabOrder = 2
                  object LabelButtonsScrollLeftVerticalOffset: TLabel
                    Left = 235
                    Top = 20
                    Width = 77
                    Height = 15
                    Caption = 'Vertical Offset:'
                    FocusControl = EditLeftScrollButtonsVerticalOffset
                  end
                  object LabelButtonsScrollLeftHorizontalOffset: TLabel
                    Left = 343
                    Top = 20
                    Width = 63
                    Height = 15
                    Caption = 'Horz Offset:'
                    FocusControl = EditLeftScrollButtonsHorzOffset
                  end
                  object LabelButtonsScrollLeftHeight: TLabel
                    Left = 11
                    Top = 20
                    Width = 39
                    Height = 15
                    Caption = 'Height:'
                    FocusControl = EditLeftScrollButtonHeight
                  end
                  object LabelButtonsScrollLeftWidth: TLabel
                    Left = 119
                    Top = 20
                    Width = 35
                    Height = 15
                    Caption = 'Width:'
                    FocusControl = EditLeftScrollButtonWidth
                  end
                  object EditLeftScrollButtonsVerticalOffset: TSpinEdit
                    Left = 235
                    Top = 37
                    Width = 94
                    Height = 24
                    MaxValue = 65535
                    MinValue = -65535
                    TabOrder = 2
                    Value = 10
                    OnChange = OnCommonControlPropertyChange
                  end
                  object EditLeftScrollButtonsHorzOffset: TSpinEdit
                    Left = 343
                    Top = 37
                    Width = 94
                    Height = 24
                    MaxValue = 65535
                    MinValue = -65535
                    TabOrder = 3
                    Value = 0
                    OnChange = OnCommonControlPropertyChange
                  end
                  object EditLeftScrollButtonHeight: TSpinEdit
                    Left = 11
                    Top = 37
                    Width = 94
                    Height = 24
                    MaxValue = 65535
                    MinValue = -65535
                    TabOrder = 0
                    Value = 15
                    OnChange = OnCommonControlPropertyChange
                  end
                  object EditLeftScrollButtonWidth: TSpinEdit
                    Left = 119
                    Top = 37
                    Width = 94
                    Height = 24
                    MaxValue = 65535
                    MinValue = -65535
                    TabOrder = 1
                    Value = 15
                    OnChange = OnCommonControlPropertyChange
                  end
                end
                object GroupBoxRightButton: TGroupBox
                  Left = 13
                  Top = 143
                  Width = 508
                  Height = 74
                  Caption = 'Right Button'
                  TabOrder = 3
                  object LabelButtonsScrollRightVerticalOffset: TLabel
                    Left = 235
                    Top = 20
                    Width = 77
                    Height = 15
                    Caption = 'Vertical Offset:'
                    FocusControl = EditRightScrollButtonVerticalOffset
                  end
                  object LabelButtonsScrollRightHorizontalOffset: TLabel
                    Left = 343
                    Top = 20
                    Width = 63
                    Height = 15
                    Caption = 'Horz Offset:'
                    FocusControl = EditRightScrollButtonHorzOffset
                  end
                  object LabelButtonsScrollRightHeight: TLabel
                    Left = 11
                    Top = 20
                    Width = 39
                    Height = 15
                    Caption = 'Height:'
                    FocusControl = EditRightScrollButtonHeight
                  end
                  object LabelButtonsScrollRightWidth: TLabel
                    Left = 119
                    Top = 20
                    Width = 35
                    Height = 15
                    Caption = 'Width:'
                    FocusControl = EditRightScrollButtonWidth
                  end
                  object EditRightScrollButtonVerticalOffset: TSpinEdit
                    Left = 235
                    Top = 37
                    Width = 94
                    Height = 24
                    MaxValue = 65535
                    MinValue = -65535
                    TabOrder = 2
                    Value = 10
                    OnChange = OnCommonControlPropertyChange
                  end
                  object EditRightScrollButtonHorzOffset: TSpinEdit
                    Left = 343
                    Top = 37
                    Width = 94
                    Height = 24
                    MaxValue = 65535
                    MinValue = -65535
                    TabOrder = 3
                    Value = 0
                    OnChange = OnCommonControlPropertyChange
                  end
                  object EditRightScrollButtonHeight: TSpinEdit
                    Left = 11
                    Top = 37
                    Width = 94
                    Height = 24
                    MaxValue = 65535
                    MinValue = -65535
                    TabOrder = 0
                    Value = 15
                    OnChange = OnCommonControlPropertyChange
                  end
                  object EditRightScrollButtonWidth: TSpinEdit
                    Left = 119
                    Top = 37
                    Width = 94
                    Height = 24
                    MaxValue = 65535
                    MinValue = -65535
                    TabOrder = 1
                    Value = 15
                    OnChange = OnCommonControlPropertyChange
                  end
                end
              end
            end
            object PanelOverlayButtons: TPanel
              Left = 0
              Top = 0
              Width = 731
              Height = 19
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object CheckBoxScrollOverlayButtons: TCheckBox
                Left = 0
                Top = 0
                Width = 728
                Height = 17
                Caption = 'Overlay Buttons'
                TabOrder = 0
                OnClick = OnCommonControlPropertyChange
              end
            end
          end
          object TabSheetInternationalization: TTabSheet
            Caption = 'Internationlization'
            ImageIndex = 8
            object LabelBiDiMode: TLabel
              Left = 3
              Top = 6
              Width = 57
              Height = 15
              Caption = 'Bidi Mode:'
              FocusControl = ComboBoxBidiMode
            end
            object ComboBoxBidiMode: TComboBox
              Left = 3
              Top = 21
              Width = 206
              Height = 23
              Style = csDropDownList
              ItemIndex = 0
              TabOrder = 0
              Text = 'Left to Right'
              OnChange = OnCommonControlPropertyChange
              Items.Strings = (
                'Left to Right'
                'Right to Left'
                'Right to Left No ALign'
                'Right to Left Reading Only')
            end
          end
          object TabSheetScrolling: TTabSheet
            Caption = 'Scrolling'
            ImageIndex = 4
            object CheckBoxScrolling: TCheckBox
              Left = 3
              Top = 3
              Width = 1057
              Height = 17
              Caption = 'Enable Scrolling'
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = OnCommonControlPropertyChange
            end
            object PanelScroll: TPanel
              Left = 0
              Top = 0
              Width = 731
              Height = 426
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object LabelScrollingScrollStep: TLabel
                Left = 17
                Top = 60
                Width = 60
                Height = 15
                Caption = 'Scroll Steps'
                FocusControl = EditScrollSteps
              end
              object LabelScrollingRepeatDelay: TLabel
                Left = 172
                Top = 60
                Width = 95
                Height = 15
                Caption = 'Repeat Delay (ms)'
                FocusControl = EditScrollRepeatDelay
              end
              object LabelScrollingScrollOffset: TLabel
                Left = 17
                Top = 8
                Width = 67
                Height = 15
                Caption = 'Scroll Offset:'
                FocusControl = ScrollBarScrollOffset
              end
              object LabelScrollingScrollOffsetValue: TLabel
                Left = 319
                Top = 26
                Width = 6
                Height = 15
                Caption = '0'
              end
              object LabelScrollingScrollEdgeDistance: TLabel
                Left = 172
                Top = 110
                Width = 109
                Height = 15
                Caption = 'Scroll Edge Distance:'
                FocusControl = EditDragScrollEdge
              end
              object EditScrollSteps: TSpinEdit
                Left = 17
                Top = 77
                Width = 144
                Height = 24
                MaxValue = 65535
                MinValue = 1
                TabOrder = 1
                Value = 20
                OnChange = OnCommonControlPropertyChange
              end
              object EditScrollRepeatDelay: TSpinEdit
                Left = 172
                Top = 77
                Width = 141
                Height = 24
                MaxValue = 65535
                MinValue = 0
                TabOrder = 2
                Value = 20
                OnChange = OnCommonControlPropertyChange
              end
              object ScrollBarScrollOffset: TScrollBar
                Left = 17
                Top = 26
                Width = 296
                Height = 17
                PageSize = 1
                TabOrder = 0
                OnChange = ScrollBarScrollOffsetChange
              end
              object CheckBoxScrollWhileDragging: TCheckBox
                Left = 17
                Top = 130
                Width = 149
                Height = 17
                Caption = 'Scroll While Dragging'
                Checked = True
                State = cbChecked
                TabOrder = 4
                OnClick = OnCommonControlPropertyChange
              end
              object EditDragScrollEdge: TSpinEdit
                Left = 172
                Top = 127
                Width = 141
                Height = 24
                MaxValue = 65535
                MinValue = 1
                TabOrder = 3
                Value = 50
                OnChange = OnCommonControlPropertyChange
              end
              object CheckBoxMouseWheelScrolling: TCheckBox
                Left = 17
                Top = 170
                Width = 149
                Height = 17
                Caption = 'Mouse Wheel Scrolling'
                Checked = True
                State = cbChecked
                TabOrder = 5
                OnClick = OnCommonControlPropertyChange
              end
              object ButtonScrollActiveTabIntoView: TButton
                Left = 17
                Top = 208
                Width = 184
                Height = 25
                Caption = 'Scroll Active Tab into View'
                TabOrder = 6
                OnClick = ButtonScrollActiveTabIntoViewClick
              end
            end
          end
          object TabSheetTabContainer: TTabSheet
            Caption = 'Tab Container'
            ImageIndex = 1
            object LabelCanvasSmoothingMode: TLabel
              Left = 3
              Top = 4
              Width = 137
              Height = 15
              Caption = 'Canvas Smoothing Mode:'
              FocusControl = ComboBoxCanvasSmoothingMode
            end
            object CheckBoxTransparentBackground: TCheckBox
              Left = 3
              Top = 50
              Width = 198
              Height = 17
              Caption = 'Transparent Background'
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = OnCommonControlPropertyChange
            end
            object ComboBoxCanvasSmoothingMode: TComboBox
              Left = 3
              Top = 21
              Width = 170
              Height = 23
              Style = csDropDownList
              ItemIndex = 2
              TabOrder = 0
              Text = 'High Quality'
              OnChange = OnCommonControlPropertyChange
              Items.Strings = (
                'Default'
                'High Speed'
                'High Quality'
                'None'
                'Anti Alias')
            end
          end
          object TabSheetBehaviour: TTabSheet
            Caption = 'Behaviour'
            ImageIndex = 2
            object LabelBehaviourDelay: TLabel
              Left = 24
              Top = 166
              Width = 240
              Height = 15
              Alignment = taRightJustify
              Caption = 'Delay before resizing tabs when cursor leaves:'
              FocusControl = EditCloseButtonMouseLeaveDelay
            end
            object LabelBehaviourUnit: TLabel
              Left = 348
              Top = 166
              Width = 16
              Height = 15
              Caption = 'ms'
            end
            object LabelFeature: TLabel
              Left = 16
              Top = 26
              Width = 308
              Height = 15
              Caption = 'This feature is only supported in Delphi versions from 2010'
              Font.Charset = ANSI_CHARSET
              Font.Color = clSilver
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object CheckBoxBackgroundDoubleClickMaximise: TCheckBox
              Left = 3
              Top = 54
              Width = 371
              Height = 17
              Caption = 'Double click background to minimise/maximise form'
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = OnCommonControlPropertyChange
            end
            object CheckBoxDraggingBackgoundMovesForm: TCheckBox
              Left = 3
              Top = 77
              Width = 371
              Height = 17
              Caption = 'Dragging background moves form'
              Checked = True
              State = cbChecked
              TabOrder = 2
              OnClick = OnCommonControlPropertyChange
            end
            object CheckBoxSmartResize: TCheckBox
              Left = 3
              Top = 142
              Width = 371
              Height = 17
              Caption = 'Reposition tab close button under mouse after closing a tab'
              Checked = True
              State = cbChecked
              TabOrder = 4
              OnClick = OnCommonControlPropertyChange
            end
            object EditCloseButtonMouseLeaveDelay: TSpinEdit
              Left = 270
              Top = 163
              Width = 75
              Height = 24
              Increment = 100
              MaxValue = 65535
              MinValue = 1
              TabOrder = 5
              Value = 700
              OnChange = OnCommonControlPropertyChange
            end
            object CheckBoxRightClickSelect: TCheckBox
              Left = 3
              Top = 108
              Width = 371
              Height = 17
              Caption = 'Right Click Select'
              Checked = True
              State = cbChecked
              TabOrder = 3
              OnClick = OnCommonControlPropertyChange
            end
            object CheckBoxDisplayTopTabsInTitleBar: TCheckBox
              Left = 3
              Top = 6
              Width = 371
              Height = 17
              Caption = 'Display the top tabs in the Title Bar non client area'
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = OnCommonControlPropertyChange
            end
          end
          object TabSheetAnimation: TTabSheet
            Caption = 'Animation'
            ImageIndex = 3
            object GroupBoxDefaultAnimationProperties: TGroupBox
              Left = 0
              Top = 0
              Width = 731
              Height = 177
              Align = alTop
              Caption = 'Default Animation Properties'
              TabOrder = 0
              object LabelDefaultAnimationPropertiesDefaultMovement: TLabel
                Left = 8
                Top = 76
                Width = 122
                Height = 15
                Caption = 'Default Movement MS:'
                FocusControl = EditAnimationStepsMovement
              end
              object LabelDefaultAnimationPropertiesDefaultStyle: TLabel
                Left = 8
                Top = 127
                Width = 89
                Height = 15
                Caption = 'Default Style MS:'
                FocusControl = EditAnimationStepsStyle
              end
              object LabelDefaultAnimationPropertiesUpdateTimer: TLabel
                Left = 8
                Top = 23
                Width = 102
                Height = 15
                Caption = 'Update Timer (ms):'
                FocusControl = EditAnimationUpdate
              end
              object LabelDefaultAnimationPropertiesDefaultMovementEaseType: TLabel
                Left = 164
                Top = 76
                Width = 157
                Height = 15
                Caption = 'Default Movement Ease Type:'
                FocusControl = ComboBoxMovementEaseType
              end
              object LabelDefaultAnimationPropertiesDefaultStyleEaseType: TLabel
                Left = 164
                Top = 127
                Width = 124
                Height = 15
                Caption = 'Default Style Ease Type:'
                FocusControl = ComboBoxStyleEaseType
              end
              object EditAnimationStepsMovement: TSpinEdit
                Left = 8
                Top = 93
                Width = 148
                Height = 24
                MaxValue = 65535
                MinValue = 1
                TabOrder = 1
                Value = 500
                OnChange = OnCommonControlPropertyChange
              end
              object EditAnimationStepsStyle: TSpinEdit
                Left = 8
                Top = 144
                Width = 148
                Height = 24
                MaxValue = 65535
                MinValue = 1
                TabOrder = 3
                Value = 300
                OnChange = OnCommonControlPropertyChange
              end
              object EditAnimationUpdate: TSpinEdit
                Left = 8
                Top = 40
                Width = 148
                Height = 24
                MaxValue = 65535
                MinValue = 1
                TabOrder = 0
                Value = 30
                OnChange = OnCommonControlPropertyChange
              end
              object ComboBoxMovementEaseType: TComboBox
                Left = 164
                Top = 93
                Width = 165
                Height = 23
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 2
                Text = 'None'
                OnChange = OnCommonControlPropertyChange
                Items.Strings = (
                  'None'
                  'Linear'
                  'In Quad'
                  'Out Quad'
                  'In Out Quad'
                  'In Cubic'
                  'Out Cubic'
                  'In Out Cubic'
                  'In Quart'
                  'Out Quart'
                  'In Out Quart'
                  'In Quint'
                  'Out Quint'
                  'In Out Quint'
                  'In Sine'
                  'Out Sine'
                  'In Out Sine'
                  'In Expo'
                  'Out Expo'
                  'In Out Expo'
                  'In Circ'
                  'Out Circ'
                  'In Out Circ')
              end
              object ComboBoxStyleEaseType: TComboBox
                Left = 164
                Top = 144
                Width = 165
                Height = 23
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 4
                Text = 'None'
                OnChange = OnCommonControlPropertyChange
                Items.Strings = (
                  'None'
                  'Linear'
                  'In Quad'
                  'Out Quad'
                  'In Out Quad'
                  'In Cubic'
                  'Out Cubic'
                  'In Out Cubic'
                  'In Quart'
                  'Out Quart'
                  'In Out Quart'
                  'In Quint'
                  'Out Quint'
                  'In Out Quint'
                  'In Sine'
                  'Out Sine'
                  'In Out Sine'
                  'In Expo'
                  'Out Expo'
                  'In Out Expo'
                  'In Circ'
                  'Out Circ'
                  'In Out Circ')
              end
            end
            object GroupBoxSpecificAnimations: TGroupBox
              Left = 0
              Top = 177
              Width = 731
              Height = 177
              Align = alTop
              Caption = 'Specific Animations'
              TabOrder = 1
              object GroupBoxMoveTab: TGroupBox
                Left = 336
                Top = 17
                Width = 168
                Height = 158
                Align = alLeft
                Caption = 'Move Tab'
                TabOrder = 2
                object LabelMoveTabMovement: TLabel
                  Left = 24
                  Top = 52
                  Width = 81
                  Height = 15
                  Caption = 'Movement MS:'
                  FocusControl = EditMoveTabTime
                end
                object LabelMoveTabMovementEaseType: TLabel
                  Left = 24
                  Top = 103
                  Width = 116
                  Height = 15
                  Caption = 'Movement Ease Type:'
                  FocusControl = ComboBoxMoveTabEase
                end
                object CheckBoxMoveTabDefaults: TCheckBox
                  Left = 8
                  Top = 24
                  Width = 97
                  Height = 17
                  Caption = 'Use defaults'
                  TabOrder = 0
                  OnClick = OnCommonControlPropertyChange
                end
                object EditMoveTabTime: TSpinEdit
                  Left = 24
                  Top = 69
                  Width = 118
                  Height = 24
                  MaxValue = 65535
                  MinValue = 1
                  TabOrder = 1
                  Value = 500
                  OnChange = OnCommonControlPropertyChange
                end
                object ComboBoxMoveTabEase: TComboBox
                  Left = 24
                  Top = 120
                  Width = 129
                  Height = 23
                  Style = csDropDownList
                  ItemIndex = 0
                  TabOrder = 2
                  Text = 'None'
                  OnChange = OnCommonControlPropertyChange
                  Items.Strings = (
                    'None'
                    'Linear'
                    'In Quad'
                    'Out Quad'
                    'In Out Quad'
                    'In Cubic'
                    'Out Cubic'
                    'In Out Cubic'
                    'In Quart'
                    'Out Quart'
                    'In Out Quart'
                    'In Quint'
                    'Out Quint'
                    'In Out Quint'
                    'In Sine'
                    'Out Sine'
                    'In Out Sine'
                    'In Expo'
                    'Out Expo'
                    'In Out Expo'
                    'In Circ'
                    'Out Circ'
                    'In Out Circ')
                end
              end
              object GroupBoxDeleteTab: TGroupBox
                Left = 168
                Top = 17
                Width = 168
                Height = 158
                Align = alLeft
                Caption = 'Delete Tab'
                TabOrder = 1
                object LabelDeleteTabMovement: TLabel
                  Left = 24
                  Top = 52
                  Width = 81
                  Height = 15
                  Caption = 'Movement MS:'
                  FocusControl = EditDeleteTabTime
                end
                object LabelDeleteTabMovementEaseType: TLabel
                  Left = 24
                  Top = 103
                  Width = 116
                  Height = 15
                  Caption = 'Movement Ease Type:'
                  FocusControl = ComboBoxDeleteTabEase
                end
                object CheckBoxDeleteTabDefaults: TCheckBox
                  Left = 8
                  Top = 24
                  Width = 97
                  Height = 17
                  Caption = 'Use defaults'
                  TabOrder = 0
                  OnClick = OnCommonControlPropertyChange
                end
                object EditDeleteTabTime: TSpinEdit
                  Left = 24
                  Top = 69
                  Width = 118
                  Height = 24
                  MaxValue = 65535
                  MinValue = 1
                  TabOrder = 1
                  Value = 500
                  OnChange = OnCommonControlPropertyChange
                end
                object ComboBoxDeleteTabEase: TComboBox
                  Left = 24
                  Top = 120
                  Width = 129
                  Height = 23
                  Style = csDropDownList
                  ItemIndex = 0
                  TabOrder = 2
                  Text = 'None'
                  OnChange = OnCommonControlPropertyChange
                  Items.Strings = (
                    'None'
                    'Linear'
                    'In Quad'
                    'Out Quad'
                    'In Out Quad'
                    'In Cubic'
                    'Out Cubic'
                    'In Out Cubic'
                    'In Quart'
                    'Out Quart'
                    'In Out Quart'
                    'In Quint'
                    'Out Quint'
                    'In Out Quint'
                    'In Sine'
                    'Out Sine'
                    'In Out Sine'
                    'In Expo'
                    'Out Expo'
                    'In Out Expo'
                    'In Circ'
                    'Out Circ'
                    'In Out Circ')
                end
              end
              object GroupBoxAddTab: TGroupBox
                Left = 2
                Top = 17
                Width = 166
                Height = 158
                Align = alLeft
                Caption = 'Add Tab'
                TabOrder = 0
                object LabelAddTabMovement: TLabel
                  Left = 24
                  Top = 52
                  Width = 81
                  Height = 15
                  Caption = 'Movement MS:'
                  FocusControl = EditAddTabTime
                end
                object LabelAddTabMovementEaseType: TLabel
                  Left = 24
                  Top = 103
                  Width = 116
                  Height = 15
                  Caption = 'Movement Ease Type:'
                  FocusControl = ComboBoxAddTabEase
                end
                object CheckBoxAddTabDefaults: TCheckBox
                  Left = 8
                  Top = 24
                  Width = 97
                  Height = 17
                  Caption = 'Use defaults'
                  TabOrder = 0
                  OnClick = OnCommonControlPropertyChange
                end
                object EditAddTabTime: TSpinEdit
                  Left = 24
                  Top = 69
                  Width = 118
                  Height = 24
                  MaxValue = 65535
                  MinValue = 1
                  TabOrder = 1
                  Value = 500
                  OnChange = OnCommonControlPropertyChange
                end
                object ComboBoxAddTabEase: TComboBox
                  Left = 24
                  Top = 120
                  Width = 129
                  Height = 23
                  Style = csDropDownList
                  ItemIndex = 0
                  TabOrder = 2
                  Text = 'None'
                  OnChange = OnCommonControlPropertyChange
                  Items.Strings = (
                    'None'
                    'Linear'
                    'In Quad'
                    'Out Quad'
                    'In Out Quad'
                    'In Cubic'
                    'Out Cubic'
                    'In Out Cubic'
                    'In Quart'
                    'Out Quart'
                    'In Out Quart'
                    'In Quint'
                    'Out Quint'
                    'In Out Quint'
                    'In Sine'
                    'Out Sine'
                    'In Out Sine'
                    'In Expo'
                    'Out Expo'
                    'In Out Expo'
                    'In Circ'
                    'Out Circ'
                    'In Out Circ')
                end
              end
            end
          end
          object TabSheetDragAndDrop: TTabSheet
            Caption = 'Drag Drop'
            ImageIndex = 7
            object ComboBoxDragType: TComboBox
              Left = 3
              Top = 21
              Width = 200
              Height = 23
              Style = csDropDownList
              Constraints.MaxWidth = 250
              Constraints.MinWidth = 200
              ItemIndex = 2
              TabOrder = 1
              Text = 'Drag between containers'
              OnChange = OnCommonControlPropertyChange
              Items.Strings = (
                'None'
                'Drag within container'
                'Drag between containers')
            end
            object PanelDragDrop: TPanel
              Left = 0
              Top = 0
              Width = 731
              Height = 426
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object LabelDragDropDragCursor: TLabel
                Left = 6
                Top = 6
                Width = 63
                Height = 15
                Caption = 'Drag Cursor'
                FocusControl = ComboBoxDragCursor
              end
              object LabelDragDropDragPixels: TLabel
                Left = 140
                Top = 5
                Width = 87
                Height = 15
                Caption = 'Drag Start Pixels:'
                FocusControl = EditDragStartPixels
              end
              object LabelDragDropExternalDisplay: TLabel
                Left = 6
                Top = 62
                Width = 113
                Height = 15
                Caption = 'External Drag Display:'
                FocusControl = ComboBoxExternalDragDisplay
              end
              object LabelDragDropDragAwayDistance: TLabel
                Left = 274
                Top = 5
                Width = 105
                Height = 15
                Caption = 'Drag away distance:'
                FocusControl = EditDragAwayDistance
              end
              object ComboBoxDragCursor: TComboBox
                Left = 6
                Top = 22
                Width = 126
                Height = 23
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 0
                Text = 'Default'
                OnChange = OnCommonControlPropertyChange
                Items.Strings = (
                  'Default'
                  'Drag')
              end
              object EditDragStartPixels: TSpinEdit
                Left = 140
                Top = 22
                Width = 128
                Height = 24
                MaxValue = 65535
                MinValue = 0
                TabOrder = 1
                Value = 2
                OnChange = OnCommonControlPropertyChange
              end
              object ComboBoxExternalDragDisplay: TComboBox
                Left = 6
                Top = 78
                Width = 126
                Height = 23
                Style = csDropDownList
                ItemIndex = 3
                TabOrder = 3
                Text = 'Tab and Control'
                OnChange = OnCommonControlPropertyChange
                Items.Strings = (
                  'Cursor'
                  'Tab'
                  'Control'
                  'Tab and Control')
              end
              object PanelDragDisplay: TPanel
                Left = 6
                Top = 107
                Width = 470
                Height = 62
                BevelOuter = bvNone
                TabOrder = 4
                object LabelDragDropImageAlpha: TLabel
                  Left = 1
                  Top = 3
                  Width = 98
                  Height = 15
                  Caption = 'Drag Image Alpha:'
                  FocusControl = EditDragImageAapha
                end
                object LabelDragDropImageResize: TLabel
                  Left = 135
                  Top = 3
                  Width = 99
                  Height = 15
                  Caption = 'Drag Image Resize:'
                  FocusControl = EditDragImageAapha
                end
                object EditDragImageAapha: TSpinEdit
                  Left = 0
                  Top = 19
                  Width = 128
                  Height = 24
                  MaxValue = 255
                  MinValue = 0
                  TabOrder = 0
                  Value = 220
                  OnChange = OnCommonControlPropertyChange
                end
                object EditDragImageResize: TEdit
                  Left = 135
                  Top = 20
                  Width = 121
                  Height = 23
                  TabOrder = 1
                  Text = '0.5'
                  OnChange = OnCommonControlPropertyChange
                end
              end
              object EditDragAwayDistance: TSpinEdit
                Left = 274
                Top = 22
                Width = 130
                Height = 24
                MaxValue = 65535
                MinValue = 0
                TabOrder = 2
                Value = 30
                OnChange = OnCommonControlPropertyChange
              end
              object CheckBoxContrainDraggedTab: TCheckBox
                Left = 7
                Top = 165
                Width = 397
                Height = 17
                Caption = 
                  'Don'#39't allow dragged tab to move beyond the edges of the containe' +
                  'r'
                TabOrder = 5
                OnClick = OnCommonControlPropertyChange
              end
            end
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 456
          Width = 1009
          Height = 33
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object ButtonSaveOptions: TButton
            Left = 133
            Top = 0
            Width = 133
            Height = 33
            Action = ActionSaveOptions
            TabOrder = 1
          end
          object ButtonLoadOptions: TButton
            Left = 0
            Top = 0
            Width = 133
            Height = 33
            Action = ActionLoadOptions
            TabOrder = 0
          end
          object ButtonCopyOptions: TButton
            Left = 266
            Top = 0
            Width = 170
            Height = 33
            Action = ActionCopyOptionsAsCode
            TabOrder = 2
          end
        end
      end
      object TabSheetLookAndFeel: TTabSheet
        Caption = 'Look and Feel'
        ImageIndex = 3
        object TreeViewLookAndFeelItems: TTreeView
          Left = 0
          Top = 0
          Width = 169
          Height = 456
          Align = alLeft
          HideSelection = False
          Indent = 19
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          OnChange = TreeViewLookAndFeelItemsChange
        end
        object Panel1: TPanel
          Left = 169
          Top = 0
          Width = 840
          Height = 456
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object PanelLookAndFeelPath: TPanel
            Left = 0
            Top = 0
            Width = 840
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = 'PanelLookAndFeelPath'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object ScrollBox1: TScrollBox
            Left = 0
            Top = 25
            Width = 840
            Height = 431
            HorzScrollBar.Smooth = True
            HorzScrollBar.Style = ssHotTrack
            HorzScrollBar.Tracking = True
            VertScrollBar.Smooth = True
            VertScrollBar.Tracking = True
            Align = alClient
            BorderStyle = bsNone
            Color = clWindow
            ParentColor = False
            TabOrder = 1
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 456
          Width = 1009
          Height = 33
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object ButtonSaveLookAndFeel: TButton
            Left = 133
            Top = 0
            Width = 133
            Height = 33
            Action = ActionSaveLookandFeel
            TabOrder = 1
          end
          object ButtonLoadLookAndFeel: TButton
            Left = 0
            Top = 0
            Width = 133
            Height = 33
            Action = ActionLoadLookAndFeel
            TabOrder = 0
          end
          object ButtonCopyLookAndFeel: TButton
            Left = 266
            Top = 0
            Width = 170
            Height = 33
            Action = ActionCopyLookAndFeelAsCode
            TabOrder = 2
          end
        end
      end
      object TabSheetGeneral: TTabSheet
        Caption = 'General'
        ImageIndex = 4
        object LabelTabContainerHeight: TLabel
          Left = 16
          Top = 8
          Width = 117
          Height = 15
          Caption = 'Tab Container Height:'
          FocusControl = EditTabHeight
        end
        object LabelGlassHeightTop: TLabel
          Left = 30
          Top = 88
          Width = 90
          Height = 15
          Alignment = taRightJustify
          Caption = 'Glass Height Top'
          FocusControl = EditGlassHeightTop
        end
        object LabelGlassHeightButton: TLabel
          Left = 11
          Top = 115
          Width = 109
          Height = 15
          Alignment = taRightJustify
          Caption = 'Glass Height Bottom'
          FocusControl = EditGlassHeightBottom
        end
        object EditTabHeight: TSpinEdit
          Left = 16
          Top = 25
          Width = 129
          Height = 24
          MaxValue = 65535
          MinValue = 4
          TabOrder = 0
          Value = 65
          OnChange = OnCommonControlPropertyChange
        end
        object EditGlassHeightTop: TSpinEdit
          Left = 126
          Top = 85
          Width = 74
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 25
          OnChange = OnCommonControlPropertyChange
        end
        object CheckBoxUseGlass: TCheckBox
          Left = 14
          Top = 63
          Width = 155
          Height = 17
          Caption = 'Glass Form'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = OnCommonControlPropertyChange
        end
        object EditGlassHeightBottom: TSpinEdit
          Left = 126
          Top = 112
          Width = 74
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 3
          Value = 25
          OnChange = OnCommonControlPropertyChange
        end
      end
      object TabSheetEvents: TTabSheet
        Caption = 'Events'
        ImageIndex = 2
        object PanelEvents: TPanel
          Left = 0
          Top = 63
          Width = 1009
          Height = 426
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object GroupBoxOtherEvents: TGroupBox
            Left = 685
            Top = 0
            Width = 324
            Height = 426
            Align = alClient
            Caption = 'Other Events'
            TabOrder = 3
          end
          object GroupBoxChange: TGroupBox
            Left = 241
            Top = 0
            Width = 222
            Height = 426
            Align = alLeft
            Caption = 'OnChange'
            TabOrder = 1
            object PanelIgnorePropertyUpdatedEvents: TPanel
              Left = 2
              Top = 407
              Width = 218
              Height = 17
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 0
              object CheckBoxIgnorePropertyUpdated: TCheckBox
                Left = 4
                Top = 0
                Width = 218
                Height = 17
                Caption = 'Ignore Property Updated Events'
                Checked = True
                State = cbChecked
                TabOrder = 0
              end
            end
          end
          object PanelEventsLeft: TPanel
            Left = 0
            Top = 0
            Width = 241
            Height = 426
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object GroupBoxMouseMove: TGroupBox
              Left = 0
              Top = 0
              Width = 241
              Height = 169
              Align = alTop
              Caption = 'OnMouseMove'
              TabOrder = 0
            end
            object GroupBoxDragOver: TGroupBox
              Left = 0
              Top = 169
              Width = 241
              Height = 257
              Align = alClient
              Caption = 'OnTabDragOver'
              TabOrder = 1
              object ListBoxTabDragOver: TListBox
                Left = 2
                Top = 17
                Width = 237
                Height = 238
                Align = alClient
                BorderStyle = bsNone
                ItemHeight = 15
                TabOrder = 0
              end
            end
          end
          object GroupBoxEvents: TGroupBox
            Left = 463
            Top = 0
            Width = 222
            Height = 426
            Align = alLeft
            Caption = 'Event Counts'
            TabOrder = 2
          end
        end
        object PanelEvent: TPanel
          Left = 0
          Top = 0
          Width = 1009
          Height = 63
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            1009
            63)
          object LabelEventsCurrentStates: TLabel
            Left = 1
            Top = 21
            Width = 77
            Height = 15
            Caption = 'Current States:'
          end
          object CheckBoxEnableEvents: TCheckBox
            Left = 1
            Top = 1
            Width = 191
            Height = 19
            Caption = 'Enable Events'
            TabOrder = 0
            OnClick = CheckBoxEnableEventsClick
          end
          object EditStates: TEdit
            Left = 1
            Top = 36
            Width = 1007
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            ReadOnly = True
            TabOrder = 1
          end
        end
      end
      object TabSheetDebug: TTabSheet
        Caption = 'Debug'
        ImageIndex = 2
        object PanelDebug: TPanel
          Left = 0
          Top = 0
          Width = 1009
          Height = 19
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object CheckBoxDebugLog: TCheckBox
            Left = 0
            Top = 0
            Width = 145
            Height = 19
            Caption = 'Debug Mode'
            TabOrder = 0
            OnClick = OnCommonControlPropertyChange
          end
        end
      end
    end
  end
  object ImageList1: TImageList
    DrawingStyle = dsTransparent
    Left = 48
    Top = 472
    Bitmap = {
      494C010106000900040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002F3E46FF2F3E46FF2F3E46FF2F3E46FF2F3E46FF2F3E46FF2F3E
      46FF2F3E46FF2F3E46FF2F3E46FF000000000000000000000000000000000000
      000000000000000000000D0D5BBF1717A3FF1717A3FF0D0D5BBF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002F3E46FF658396FF658396FF658396FF5D798BFF5B6C77FF4F64
      71FF445A67FF3F535EFF2F3E46FF0000000000000000929292FF929292FF9292
      92FF929292FF929292FF1717A3FF8484F6FF5F5FEDFF1717A3FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002F3E46FF2F3E46FF2F3E46FF2F3E46FF2F3E46FF2F3E46FF2F3E
      46FF2F3E46FF2F3E46FF2F3E46FF0000000000000000929292FF000000000000
      000000000000000000000D0D5BBF1717A3FF1717A3FF0D0D5BBF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002F3E46FF679FC1FF679FC1FF679FC1FF6195B5FF658398FF6A87
      9AFF517791FF446D88FF2F3E46FF0000000000000000929292FF000000000000
      00000000000000000000174F17BF2A8F29FF2A8F29FF174F17BF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002F3E46FF2F3E46FF2F3E46FF2F3E46FF2F3E46FF2F3E46FF2F3E
      46FF2F3E46FF2F3E46FF2F3E46FF0000000000000000929292FF929292FF9292
      92FF929292FF929292FF2A8F29FF87E087FF60CC60FF2A8F29FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002F3E46FF658396FF658396FF658396FF5D798BFF5B6C77FF4F64
      71FF445A67FF3F535EFF2F3E46FF0000000000000000929292FF000000000000
      00000000000000000000174F17BF2A8F29FF2A8F29FF174F17BF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002F3E46FF2F3E46FF2F3E46FF2F3E46FF2F3E46FF2F3E46FF2F3E
      46FF2F3E46FF2F3E46FF2F3E46FF0000000000000000929292FF000000000000
      00000000000000000000115B81BF1EA4E7FF1EA4E7FF115B81BF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000928F8FFF928F8FFF0000000000000000000000000000
      0000928F8FFF928F8FFF000000000000000000000000929292FF929292FF9292
      92FF929292FF929292FF1EA4E7FF56FFFFFF23FFFFFF1EA4E7FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000928F8FFF928F8FFF0000000000000000000000000000
      0000928F8FFF928F8FFF000000000000000000000000929292FF000000000000
      00000000000000000000115B81BF1EA4E7FF1EA4E7FF115B81BF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000404040AF928F8FFF1818187000000000000000001818
      1870928F8FFF444242AF0000000000000000552300BF9A3F00FF9A3F00FF5523
      00BF00000000000000000000000000000000000000000000000000000000041D
      06940C5713FF041D069400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008080840928F8FFF928F8FFF928F8FFF928F8FFF928F
      8FFF928F8FFF0808084000000000000000009A3F00FFEAC83AFFDCA216FF9A3F
      00FF000000000000000000000000000000000000000000000000000000000C57
      13FF21BB29FF0C5713FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000C0C0C506D6C6CDF928F8FFF928F8FFF7979
      79DF0C0C0C50000000000000000000000000552300BF9A3F00FF9A3F00FF5523
      00BF0000000000000000000000000000000000000000041D06940C5713FF0C57
      13FF5DCD5EFF0C5713FF0C5713FF041D06940000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C5713FFABEEADFFA5EA
      A6FF80E07EFF60D462FF16B11DFF0C5713FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000041D06940C5713FF0C57
      13FF9FE7A0FF0C5713FF0C5713FF041D06940000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000C57
      13FFA1E8A3FF0C5713FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000041D
      06940C5713FF041D069400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001B1D58BF3B3EA9FF2D2F8DEF0101053000000000000000001313
      3D9F3234A1FF2A2D8BEF03030A40000000000000000000000000000000000000
      000012121260484747BF818080FF818080FF818080FF818080FF484747BF1212
      1260000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000202169CF7174D8FF5A5DC5FF13133D9F00000000000000001B1D
      58BF4C4FBAFF393CA7FF0F10318F000000000000000000000000020202205454
      54CF8B7368FF95573DFF903613FF8E2C08FF8E2C08FF913714FF985B40FF876E
      64FF545454CF0202022000000000000000002B2B2B99787878FF787878FF7878
      78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7878
      78FF787878FF787878FF787878FF2B2B2B99000000000009125D155BD8FF0320
      429F000102200000000000000000000000000000000000000000000000000001
      0220031F429F1158D8FF0009125D000000000000000000000000000000000000
      0000000002203F41ACFF8689E7FF8287E6FF3437A4FF3234A0FF1B1D58BF2E30
      8FEF5D62C9FF5255BFFF202169CF000000000000000002020220707070EF935F
      49FF90340EFFA33F0CFFD38642FFEEC181FFEFC689FFD48A4AFFA3400EFF9638
      12FF936149FF707070EF0202022000000000787878FFE5E5E5FFEDEDEDFFEDED
      EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
      EDFFE2E2E2FFDCDCDCFFD3D3D3FF787878FF00000000000204301761E7FF2482
      FFFF1D5FBBEF0316298000000010000000000000000000000010031529801B58
      BBEF217CFFFF135CE7FF0002043000000000000000000000001013133D9F3538
      94EF464AB1FF777CD8FF9196EBFF9196EBFF4548B1FF6265C7FF6467C7FF4144
      ADFF4B4FB8FF6266CCFF3A3DA9FF0000000000000000545454CF95614AFF9331
      08FFC4590CFFEF9929FFF7BB46FFFBCF5CFFFBD161FFF8C04CFFF09D2FFFC255
      0AFF973309FF95634BFF545454CF00000000787878FFE5E5E5FF787878FF7878
      78FF787878FF787878FF787878FFEDEDEDFFEDEDEDFF787878FF787878FF7878
      78FF787878FF787878FFD3D3D3FF787878FF0000000000000000083C7CCF2197
      FFFF24A6FFFF309CF7FF185D9BDF010C1660010C1660185AAEEF297AF7FF1C8A
      FFFF197AFFFF05367CCF000000000000000000000010202169CF666AC9FF999F
      EBFF9CA3EBFF9EA5EBFF969CEAFF9CA3EBFF474BB1FF6E74D3FF6F74D4FF6A6D
      D1FF4043AFFF6F74D8FF474AB5FF06071660121212608C7468FF90330EFFBF51
      09FFCB6512FF933714FF933714FF933714FF933714FF933714FF933714FFCE67
      11FFBB4705FF963712FF886E64FF12121260787878FFE5E5E5FF787878FF1B1A
      18FF17202EFF468E96FF787878FFFAFAFAFFFAFAFAFF787878FF9A4A83FFB480
      55FF5B5082FF787878FFD5D5D5FF787878FF0000000000000000000C166027AA
      F7FF29BCFFFF2BBDFFFF2FBBFFFF32AAF7FF2EA1F7FF27A3FFFF1E9AFFFF1A90
      FFFF1364F7FF000A166000000000000000001B1D58BF5155BAFF5C61C0FFA1AA
      EBFFACB5EEFFAFB8EEFF9DA4EBFFA1AAEBFF4F53B6FF8990E0FF8A90E2FF8388
      E1FF4346B0FF7C81E1FF676BD1FF252779DF484747BF955539FF9F3404FFC557
      0BFF933714FFD8C0B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8C0B5FF9337
      14FFC55108FF9C2D02FF9A5D42FF484747BF787878FFE7E7E7FF787878FF5B93
      95FF24373EFF42878BFF787878FFFAFAFAFFFAFAFAFF787878FFC09A79FF978B
      69FF887166FF787878FFD8D8D8FF787878FF0000000000000000000000101E7F
      B5EF3DC6FFFF3DC6FFFF3BC6FFFF35C4FFFF2EC0FFFF27BBFFFF22ACFFFF1B91
      FFFF0647B5EF0000001000000000000000003D40AAFF8C92E2FFA4ACEBFFB0BB
      EBFFB0BBEBFFB2BFEBFFA4ACEBFF9CA4EAFFA9B4EAFFA7B1EBFFA1AAEBFF99A0
      EBFF9196EBFF888BE9FF7477DCFF3B3EAAFF818080FF903713FFC15208FF9E37
      07FF933714FFFFFFFFFFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFFFFFFFFF9337
      14FFA43C08FFB53800FF923915FF818080FF787878FFEAEAEAFF787878FF7878
      78FF787878FF787878FF787878FFFAFAFAFFFAFAFAFF787878FF787878FF7878
      78FF787878FF787878FFDCDCDCFF787878FF0000000000000000000000000426
      3D9F69D8FFFF53D0FFFF52D0FFFF4ACCFFFF40C9FFFF32C2FFFF27BBFFFF1288
      FFFF001D3D9F0000000000000000000000001B1D58BF5458B7FFBBC2EFFF3031
      40FFB6C2EBFF848CD5FF7981CCFFB0BAEDFFB7C4EDFFB1BDEBFFAAB4EBFFA1A9
      EBFF989EEBFF8F93EBFF7D82E3FF28297DDF818080FF8E2C06FFC2550AFF8723
      03FF933714FFFFFFFFFFBDBDBDFFBDBDBDFFBDBDBDFFBDBDBDFFFFFFFFFF9337
      14FF8B2703FFB23500FF8E2B06FF818080FF787878FFEDEDEDFFEDEDEDFFEDED
      EDFFEDEDEDFFEDEDEDFFEDEDEDFFFAFAFAFFFAFAFAFFE9E9E9FFE9E9E9FFE9E9
      E9FFE6E6E6FFE6E6E6FFE0E0E0FF787878FF0000000000000000000408406AA1
      BBEF92E5FFFF68DAFFFF67D9FFFF5ED5FFFF51CFFFFF40C7FFFF2FC0FFFF179F
      FFFF0453BBEF00040840000000000000000000000000090A1E705B5FBAFFCCD5
      F3FFCCD5F3FFA7B0EBFF555ABFFFC0CCF0FFBCC9EFFFB7C4EDFFB0BCEBFFA7B0
      EBFF9EA5EBFF9599EBFF6E72D5FF13133D9F818080FF8E2C07FFE3AD7DFFB161
      36FF933714FFFFFFFFFFEEEEEEFFEEEEEEFFEEEEEEFFEEEEEEFFFFFFFFFF9337
      14FFB16237FFDC9A69FF8E2B06FF818080FF787878FFF0F0F0FF787878FF7878
      78FF787878FF787878FF787878FFFAFAFAFFFAFAFAFF787878FF787878FF7878
      78FF787878FF787878FFE1E1E1FF787878FF00000000030D166093C7E0FFB1F0
      FFFFA1EFFFFF9CEEFFFF7EE6FFFF6CDDFFFF5FD5FFFF4CCCFFFF37C4FFFF29BC
      FFFF1691FFFF0455E0FF000A16600000000000000000000000000F10318F4E53
      B2FFADB6E3FF6367CAFF8489E0FFDAE2F8FFD7DEF8FFC9D3F4FFB6C2EDFFABB5
      EBFFA0A9EBFF9299EAFF4F52BCFF04050F50818080FF923815FFD79F74FFB873
      4DFF933714FFFFFFFFFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFFFFFFF9337
      14FFBA7551FFD39065FF913714FF818080FF787878FFF3F3F3FF787878FF0063
      9FFF004571FF003069FF787878FFFAFAFAFFFAFAFAFF787878FF347243FF3C78
      5CFF4C8F77FF787878FFE3E3E3FF787878FF091D2A7FA1D1E7FFA4EBFFFFA5EE
      FFFFB1F2FFFFB5F7FFFFADF6FFFF9EEFFFFF83E3FFFF62D4FFFF3EC6FFFF2CBD
      FFFF23ADFFFF178AFFFF044DE7FF001C429F0000000000000000000000000101
      05302D2F7EDF3639A4FFA1A7E2FFE2E9FBFFE1E7FBFFDAE2FBFFCED7F6FFACB6
      EBFFA1ABEBFF7C82DAFF3437A3FF01010530484747BF995C41FFA65129FFD5A3
      80FF933714FFD8C0B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8C0B5FF9337
      14FFD39872FFA54C24FF985B40FF484747BF787878FFF6F6F6FF787878FF007D
      F8FF006DE2FF002C33FF787878FFFAFAFAFFFAFAFAFF787878FF5FA152FF5991
      47FF56833FFF787878FFE7E7E7FF787878FF416981CC89C4E0FF8CC4E0FF92C6
      E0FF93C7E0FFB8E2EFFFBCF6FFFFA0F0FFFF88EBFFFF7AE2FFFF54C1EFFF229F
      E0FF1592E0FF0C72E0FF0A64E0FF0A64E0FF0000000000000000000000000000
      000001010530303290EF7D86CEFFB6C1EBFFC5D0F2FFC1CCF0FFB5C0EDFFAAB4
      EBFF7379CEFF393CA6FF3335A1FF2D2F8DEF12121260876E64FF973C17FFD098
      75FFBF805EFF933714FF933714FF933714FF933714FF933714FF933714FFBC7C
      59FFCC8B62FF913612FF8E7569FF12121260787878FFFAFAFAFF787878FF7878
      78FF787878FF787878FF787878FFFAFAFAFFFAFAFAFF787878FF787878FF7878
      78FF787878FF787878FFEAEAEAFF787878FF0000000000000000000000000000
      000000000000071A2880D4F7FFFFA1EEFFFF83EAFFFF73E1FFFF08283F9F0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000100C0D2880142F71DE324292FF3E4F98FF3250A1FF1B1D
      58BF2A2D8CEF3B3FA7FF5B61BFFF3F41ABFF00000000545454CF95624BFF993E
      18FFD09C7AFFDCB59DFFC99781FFC6957CFFC6957CFFC99882FFDAAF93FFCE90
      68FF963A15FF95614AFF545454CF00000000787878FFFAFAFAFFFAFAFAFFFAFA
      FAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFA
      FAFFF7F7F7FFF2F2F2FFEAEAEAFF787878FF0000000000000000000000000000
      000000000000000102209CC7E0FF9EEBFFFF7AE7FFFF55B7E0FF000102200000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000108FB1FF82C4CBFF82C4CBFF0E80A4FF0000
      0000000000101718409F575CB7FF0C0D28800000000002020220707070EF9361
      49FF963B16FFA7532DFFD9AA8BFFE6C5ABFFE6C2A6FFD7A581FFA65129FF9136
      12FF905D46FF707070EF0202022000000000787878FFA0A0A0FFA0A0A0FFA0A0
      A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0
      A0FFA0A0A0FFA0A0A0FFA0A0A0FF787878FF0000000000000000000000000000
      0000000000000000000031556CBF9FEAFFFF76E3FFFF1D4F6CBF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000040634108FB1FF0E80A4FF000406340000
      0000000000000000000000000000000000000000000000000000020202205454
      54CF876D63FF96563AFF913714FF8E2C08FF8E2C08FF8F3612FF93573DFF8971
      65FF545454CF0202022000000000000000002B2B2B99787878FF787878FF7878
      78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7878
      78FF787878FF787878FF787878FF2B2B2B990000000000000000000000000000
      00000000000000000000000A136082D1EFFF6ACEF3FF000A1360000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000012121260484747BF818080FF818080FF818080FF818080FF484747BF1212
      1260000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001A445EB211384FA600000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object ImageList2: TImageList
    DrawingStyle = dsTransparent
    Left = 88
    Top = 472
    Bitmap = {
      494C010102000500040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A3D0CA324802EDB001500610000
      0003000000000000000000000000000000000000000000000000000000000000
      00000000000000000000030A3780182A92CB2846CAEA183AC0E40D38C2E40A3C
      C3E40F43C4E4124AC7E41554D2EA03185F9E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000349C41F47BE2A6FF37C65EFF064F
      0DB3000500320000000000000000000000000000000000000000000000000000
      000000000000000000001B2B8ECC5E77F2FF5D85FFFF346DFFFF1C69FFFF2078
      FFFF2C8FFFFF36A2FFFF3BAFFFFF1451D2EC0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002A8D35EF5ED185FF3BCF6EFF3BD8
      72FF22A93FF20227038100000012000000000000000000000000000000000000
      00000000000000000000172480C64F69EEFF4972FFFF215CFFFF125DFFFF1D6F
      FFFF2682FFFF2C90FFFF339DFFFF1046C2E60000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000288631ED58CB7BFF30C25EFF33CE
      67FF40DC79FF3BD46BFF106E1DCF000A00470000000000000000000000000000
      0000000000000000000017217BC64F66E9FF466DFFFF1C56FFFF0F57FFFF1968
      FFFF2076FFFF247EFFFF298BFFFF0D3DBEE60000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000298131ED5BC679FF30BB58FF2AC3
      5AFF31CB64FF39D570FF44E483FF117E21E30000000000000000000000000000
      00000000000000000000171F77C65265E4FF496DFEFF1F52FFFF0B4CFFFF125B
      FFFF1867FFFF1A6CFFFF1E75FFFF0A35B9E60000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002B7E32ED66C47EFF3AB65AFF27B6
      4FFF2BC15AFF30C963FF22AF44FD022503870000000000000000000000000000
      00000000000000000000181E73C65969DEFF5573F7FF2954FDFF0C45FFFF094A
      FFFF1056FFFF125BFFFF1462FFFF072CB4E60000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000317C35EC78C58AFF4FB565FF3EB8
      5FFF24AB44FF085811CA00090046000000000000000000000000000000000000
      000000000000000000001B1E6DC66670D8FF677EF0FF3D5EF4FF1D4AFDFF083F
      FFFF0441FFFF0745FFFF084CFFFF0321B0E60000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000408542F0A1D6ACFF6ABB79FF2883
      32EF001A01790000000E00000000000000000000000000000000000000000000
      00000000000000000000242672CB8187DBFF8B9BF0FF5E76EFFF4061F6FF2751
      FDFF1445FFFF0C41FFFF0F48FFFF0620B4EB0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002A622AD782BA86FF0C370DAD0003
      002C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010104DAD5E61BCF97A82D8FF5965D5FF4556D7FF354B
      DAFF2A43DEFF223DDFFF2443E3FF08127CCF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000822088B19491ABF000600420000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010118670F104BAB222372CB171B6BC614176CC61014
      6CC60D136DC60C116DC60C1375CB01022A810000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object SaveDialogLookAndFeel: TSaveDialog
    DefaultExt = '.ctlf'
    Filter = 'Chrome Tabs Look and Feel (*.ctlf)|*.ctlf|All Files (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Save Look and Feel'
    Left = 128
    Top = 376
  end
  object OpenDialogLookAndFeel: TOpenDialog
    DefaultExt = '.ctlf'
    Filter = 'Chrome Tabs Look and Feel (*.ctlf)|*.ctlf|All Files (*.*)|*.*'
    Title = 'Load Look and Feel'
    Left = 48
    Top = 376
  end
  object ActionList: TActionList
    Left = 48
    Top = 328
    object ActionLoadLookAndFeel: TAction
      Caption = 'Load Look and Feel'
      OnExecute = ActionLoadLookAndFeelExecute
    end
    object ActionSaveLookandFeel: TAction
      Caption = 'Save Look and Feel'
      OnExecute = ActionSaveLookandFeelExecute
    end
    object ActionLoadOptions: TAction
      Caption = 'Load Options'
      OnExecute = ActionLoadOptionsExecute
    end
    object ActionSaveOptions: TAction
      Caption = 'Save Options'
      OnExecute = ActionSaveOptionsExecute
    end
    object ActionCopyOptionsAsCode: TAction
      Caption = 'Copy Options as Code'
      OnExecute = ActionCopyOptionsAsCodeExecute
    end
    object ActionCopyLookAndFeelAsCode: TAction
      Caption = 'Copy Look and Feel as Code'
      OnExecute = ActionCopyLookAndFeelAsCodeExecute
    end
  end
  object OpenDialogTabOptions: TOpenDialog
    DefaultExt = '.ctop'
    Filter = 'Chrome Tabs Options (*.ctop)|*.ctop|All Files (*.*)|*.*'
    Title = 'Load Look and Feel'
    Left = 48
    Top = 424
  end
  object SaveDialogTabOptions: TSaveDialog
    DefaultExt = '.ctop'
    Filter = 'Chrome Tabs Options (*.ctop)|*.ctop|All Files (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Save Look and Feel'
    Left = 128
    Top = 424
  end
  object ApplicationEvents: TApplicationEvents
    OnDeactivate = ApplicationEventsDeactivate
    OnMessage = ApplicationEventsMessage
    Left = 128
    Top = 328
  end
  object ImageList3: TImageList
    DrawingStyle = dsTransparent
    Left = 128
    Top = 472
    Bitmap = {
      494C01010B000D00040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000B0B0B0C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000050505060B0B0B0C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000121212140101010200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001919191C2C2C2C380000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000002D2D2D3A1414141600000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000010101023434344800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000343434483232324400000000000000000000
      0000000000000707070800000000000000000000000000000000000000000000
      0000000000000000000000000000000000004343438300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000313131422B2B2B38000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003A3A3AB500000000000000000000
      0000000000002222222800000000000000000000000000000000000000000000
      000000000000000000000000000000000000404040702E2E2E3C000000000000
      0000000000001414141600000000000000000000000000000000000000000000
      000000000000000000000000000000000000070707083E3E3E9F000000000000
      0000000000000000000005050506000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      030403030304000000000000000000000000363636B715151518000000000000
      0000202020262525252E000000000000000000000000030303042B2B2B383D3D
      3D643B3B3B5C1717171A00000000000000003D3D3D623F3F3F6C000000000000
      0000000000002F2F2F3E000000000000000000000000141414162D2D2D3A3F3F
      3F664040409B4040407205050506000000000B0B0B0C333333BF000000000000
      0000000000001010101214141416000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000050505062424242C393939544242
      4281393939B5383838B32323232A000000002A2A2ACF1717171A000000000101
      010241414195010101020000000000000000030303041A1A1A1E0F0F0F101010
      10123636364E2C2C2CCD4040406E00000000404040913B3B3B5C000000000000
      00002525252E3535354A00000000000000000000000000000000000000000000
      00000101010241414178333333C10909090A3636364E3E3E3E9F000000000000
      0000000000003C3C3C5C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000101010200000000000000000000
      000000000000323232441D1D1DE13D3D3D60161616ED010101022525252E3737
      37B5373737500000000000000000000000000000000000000000000000000000
      0000000000000D0D0D0E2E2E2EC74141417C1C1C1CE31C1C1C20010101023636
      364E3C3C3CAB0101010200000000000000000000000000000000000000000000
      000000000000000000004040408D3C3C3CA7323232C13636364E000000000303
      03044141417C3131314200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003B3B3B5A000000FF0F0F0FF1242424D92C2C2CCD3232
      3244000000000000000000000000000000000000000000000000000000000000
      0000000000000F0F0F103E3E3E64000000FF0B0B0BF5383838B1212121DF3E3E
      3E9F0F0F0F100000000000000000000000000000000000000000000000000000
      00000909090A3333334641414178010101FD030303FB4040408F3B3B3BA52A2A
      2AD33B3B3B5C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000313131422D2D2DCB232323DB0F0F0FF1000000FF3D3D3D60000000000000
      0000000000000000000000000000000000000000000000000000000000000F0F
      0F103E3E3E9F212121DF373737B30B0B0BF5000000FF3F3F3F68101010120000
      0000000000000000000000000000000000000000000000000000000000003B3B
      3B5C2A2A2AD33B3B3BA54040408F040404FB010101FD4141417A343434480909
      090A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003737
      3750373737B52525252E01010102161616EB3C3C3C5E1E1E1EE1333333460000
      0000000000000000000000000000010101020000000000000000030303043C3C
      3CAB3636364C010101021A1A1A1E1A1A1AE5424242782D2D2DC90D0D0D0E0000
      0000000000000000000000000000000000000000000000000000323232444141
      417803030304000000003636364C313131C33E3E3EA140404091000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010101024141
      4195010101020000000015151518292929D10000000021212128393939B13939
      39B54141417E393939542424242C0505050600000000000000003636364C2424
      242C00000000000000003A3A3A5840404093000000003F3F3F6A2C2C2CCD3737
      37500F0F0F100D0D0D0E1A1A1A1E0303030400000000000000003C3C3C5A0000
      000000000000000000003E3E3E9D373737500909090A343434BD4141417C0101
      0102000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000272727301E1E
      1E24000000000000000014141416353535B90000000000000000000000000303
      03040303030400000000000000000000000000000000000000002F2F2F3E0000
      000000000000000000003E3E3E6A3D3D3D640000000000000000151515183B3B
      3B5C3D3D3D642D2D2D3A030303040000000000000000151515180F0F0F100000
      00000000000000000000343434BD0D0D0D0E0000000005050506404040704040
      409B3E3E3E642D2D2D3A14141416000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000222222280000
      00000000000000000000000000003B3B3BB30000000000000000000000000000
      0000000000000000000000000000000000000000000000000000141414160000
      000000000000000000002E2E2E3C404040700000000000000000000000000000
      0000000000000000000000000000000000000000000003030304000000000000
      000000000000000000003E3E3E9F070707080000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000070707080000
      0000000000000000000000000000333333463434344800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000434343830000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002D2D2D3A303030400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2D2D3A1717171A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000141414162D2D2D3A00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000343434480101010200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0B0B0C010101020000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000B0B0B0C05050506000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000010101021010101200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010101020000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000505050600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000707
      0708000000000000000000000000000000000000000000000000000000001919
      191C000000000000000000000000000000000000000000000000000000000101
      01021A1A1A1E0D0D0D0E00000000000000000000000000000000000000000F0F
      0F10000000000000000000000000000000000000000000000000000000000000
      000007070708272727300F0F0F10000000000000000000000000000000000000
      0000050505060000000000000000000000000000000000000000000000000000
      0000000000000D0D0D0E31313142030303040000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000505
      0506292929343D3D3D6014141416000000000000000000000000000000003131
      3142000000000000000000000000000000000000000000000000000000000000
      000000000000303030403F3F3F68010101020000000000000000000000002929
      2934000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3F662D2D2D3A0000000000000000000000000000
      0000202020260000000000000000000000000000000000000000000000000000
      000000000000000000000B0B0B0C424242870303030400000000000000000000
      0000151515180000000000000000000000000000000000000000000000000000
      0000000000000B0B0B0C3C3C3CAB2424242C0000000000000000000000004040
      406C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000030303040414141910000000000000000000000003B3B
      3B5A030303040000000000000000000000000000000000000000000000000000
      00000000000000000000000000003A3A3AAF1414141600000000000000000000
      00003636364C0000000000000000000000000000000000000000000000000000
      00000000000000000000000000003636364C4040407000000000000000000000
      00002D2D2D3A0000000000000000000000000000000000000000000000000000
      000000000000000000001D1D1D22313131C500000000000000001818181C4141
      4189000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000343434BD1D1D1D2200000000000000004242
      4293000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003D3D3D644040407200000000000000002323
      232A393939560000000000000000000000000000000000000000000000000000
      00000000000000000000000000000F0F0F10303030C500000000000000000000
      00004040406C0000000000000000000000000000000000000000000000000000
      00000000000000000000000000002E2E2EC721212128010101023A3A3AAF3030
      3040000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000404040893D3D3D6400000000323232443E3E
      3EA1000000000000000000000000000000000000000000000000010101022929
      29343131314210101012000000003535354A3D3D3D9F00000000070707083838
      38B5121212140000000000000000000000000000000003030304383838524242
      428F3D3D3D9F3C3C3C5E050505060D0D0D0E232323DB00000000000000003333
      33464040407200000000000000000000000000000000000000000F0F0F103F3F
      3F6C404040934141417A2A2A2A363E3E3E9F4040406E3A3A3AAD3F3F3F990000
      00000000000000000000000000000000000000000000030303043E3E3E663F3F
      3FA3313131CB323232C13E3E3E6642424281414141874040406E252525D71515
      151800000000000000000000000000000000000000002C2C2C383F3F3F683E3E
      3E6640404085252525D93E3E3E9D4040406C3A3A3AA92B2B2B382D2D2DC93E3E
      3E64000000000000000000000000000000000D0D0D0E272727300D0D0D0E0000
      00001D1D1D223F3F3F99282828D33D3D3D602B2B2BCD0F0F0F104141417A3232
      32C30909090A0000000000000000000000000000000028282832404040702F2F
      2F3E2D2D2D3A40404072262626D5070707F9010101FD41414191010101020000
      000000000000000000001717171A121212140D0D0D0E313131420F0F0F100000
      0000000000002525252E3A3A3AAF010101FD040404FB363636B9151515180000
      0000000000000000000000000000050505060F0F0F1005050506000000000000
      0000000000000505050641414189000000FF0B0B0BF5222222DB343434480000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003E3E3E66000000FF0F0F0FF1161616EB4040408D0B0B
      0B0C00000000000000000000000000000000121212141818181C000000000000
      000000000000010101024141418F010101FD090909F7252525D7404040742E2E
      2E3C2F2F2F3E4040407028282832000000000505050600000000000000000000
      00000000000014141416373737B7040404FB010101FD373737B3282828320000
      0000000000000D0D0D0E313131420D0D0D0E0000000000000000000000000000
      00000000000033333346232323D90B0B0BF5000000FF4040408D070707080000
      0000000000000000000003030304101010120000000000000000000000000000
      00000B0B0B0C4141418B161616EB0F0F0FF1000000FF3F3F3F6A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3F97393939AF4040406C3D3D3DA128282832414141784040
      40913F3F3F6C0F0F0F1000000000000000000000000000000000000000000000
      000015151518272727D54040407042424283424242833D3D3D62333333BF3131
      31CB3F3F3FA33F3F3F6803030304000000000000000000000000000000000000
      00003E3E3E642E2E2EC92B2B2B383B3B3BA54040406C3F3F3F99232323DB4040
      40853E3E3E663F3F3F682D2D2D3A000000000000000000000000000000000909
      090A323232C34141417A0F0F0F102D2D2DC93D3D3D602A2A2ACF3E3E3E9B1E1E
      1E24000000000D0D0D0E272727300B0B0B0C0000000000000000000000000000
      0000303030403A3A3AAF01010102202020262D2D2DC900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003E3E3EA132323244000000003C3C3C604040408B00000000000000000000
      0000000000000000000000000000000000000000000000000000000000001414
      1416383838B507070708000000003D3D3D9D3636364C000000000F0F0F103131
      3142292929340303030400000000000000000000000000000000000000004141
      4174323232440000000000000000242424D90F0F0F10030303043B3B3B5A3D3D
      3D9D4242428D3838385203030304000000000000000000000000000000000000
      00004141418B1818181C0000000000000000323232C31D1D1D22000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      01024242429300000000000000001C1C1C20343434BD00000000000000000000
      0000000000000000000000000000000000000000000000000000000000003A3A
      3A58212121280000000000000000404040723E3E3E6600000000000000000000
      0000000000000000000000000000000000000000000000000000000000004040
      406A000000000000000000000000313131C30F0F0F1000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004040406C0000000000000000000000002323232A3C3C3CA90909090A0000
      0000000000000000000000000000000000000000000000000000000000000505
      05063A3A3A58000000000000000000000000414141912F2F2F3E000000000000
      0000000000000000000000000000000000000000000000000000000000003636
      364C000000000000000000000000141414163B3B3BAD00000000000000000000
      0000000000000000000000000000000000000000000000000000000000002E2E
      2E3C000000000000000000000000404040703636364C00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003131314200000000000000000000000000000000141414163D3D3D602929
      2934030303040000000000000000000000000000000000000000000000000000
      000029292934000000000000000000000000010101023F3F3F682F2F2F3E0000
      0000000000000000000000000000000000000000000000000000000000002020
      2026000000000000000000000000000000002D2D2D3A3E3E3E64000000000000
      0000000000000000000000000000000000000000000000000000000000001515
      151800000000000000000000000003030304424242870B0B0B0C000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001919191C0000000000000000000000000000000000000000000000000000
      0000070707080000000000000000000000000000000000000000000000000000
      00000F0F0F1000000000000000000000000000000000000000000D0D0D0E1919
      191C000000000000000000000000000000000000000000000000000000000505
      050600000000000000000000000000000000000000000F0F0F10272727300707
      0708000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000003030304313131420D0D0D0E0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000010101020000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000050505060000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001010101200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000030303040B0B0B0C000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000909090A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000050505060000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F1F1F241A1A1A1E000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002D2D2D3A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000F0F0F101C1C1C200000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020260000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000041414170000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003535354A1A1A1A1E0000
      00000000000000000000000000000000000000000000000000000F0F0F101212
      12140101010200000000000000000000000000000000000000003B3B3B5A0000
      0000000000000000000000000000000000000000000000000000030303041C1C
      1C20333333461717171A00000000000000000000000000000000333333460707
      07080000000000000000000000000000000000000000030303041C1C1C202727
      27301C1C1C200000000000000000000000000000000040404095070707080000
      00000000000000000000000000000000000000000000010101021A1A1A1E3232
      3244414141702E2E2E3C000000000000000000000000272727303D3D3D640000
      0000000000000000000000000000000000000000000000000000000000001A1A
      1A1E3C3C3C5E4141418F1D1D1D22000000000000000000000000424242890000
      0000000000000000000000000000000000000000000000000000000000000000
      00000303030440404070424242830101010200000000000000003636364E2525
      252E0000000000000000000000000000000000000000070707080D0D0D0E1E1E
      1E243F3F3F6C363636BB292929340000000000000000373737B5121212140000
      0000000000000000000010101012000000000000000000000000000000000000
      0000070707084141418B3F3F3F970101010200000000393939544040406E0000
      0000000000000000000000000000010101020000000000000000000000000000
      0000000000001818181C2C2C2CCD1C1C1C200000000005050506383838B70000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000414141874040406E0000000000000000404040892323
      232A000000000000000000000000000000000000000000000000000000000000
      0000000000001C1C1C20232323DB2323232A14141416242424DB010101020000
      0000000000001414141621212128000000000000000000000000000000000000
      000000000000000000003C3C3CA93E3E3E6600000000323232C1292929340000
      000000000000000000001D1D1D22000000000000000000000000000000000000
      00000000000000000000393939563A3A3AAB0000000040404070404040870000
      0000000000000000000000000000070707080000000000000000000000000000
      00000000000000000000101010121F1F1FE1030303041E1E1E242C2C2CCF0101
      0102000000000000000000000000000000000000000000000000000000000000
      00000000000000000000393939542C2C2CCB3E3E3E9D41414181000000000000
      0000121212144242427C00000000000000000000000000000000000000000000
      000000000000000000001D1D1D22191919E741414178363636B9000000000000
      0000000000002A2A2A362424242C000000000000000000000000000000000000
      0000000000000000000003030304181818E93C3C3C5E202020DF121212140000
      000000000000000000002D2D2D3A010101020000000000000000000000000F0F
      0F10303030402B2B2B380D0D0D0E2F2F2FC53D3D3D60222222DB333333460000
      00000000000000000000050505060F0F0F100000000000000000000000000101
      0102343434484141418140404095070707F9010101FD4141417A3F3F3F6C3F3F
      3F973A3A3AB31212121400000000000000000000000000000000000000002D2D
      2D3A3E3E3E9B343434BB363636B70D0D0DF3000000FF3F3F3F68272727302F2F
      2F3E414141873E3E3E6600000000000000000000000000000000151515183E3E
      3E9F2B2B2BD51E1E1EE7202020DF0F0F0FF1000000FF3D3D3D60000000000000
      00001717171A424242781717171A000000000000000001010102404040703E3E
      3EA140404091373737B3151515ED0D0D0DF3000000FF3F3F3F6C000000000000
      000000000000151515183636364C000000000000000000000000101010123A3A
      3AB33F3F3F953E3E3E6A41414176010101FD060606F9414141914040407C3232
      32440101010200000000000000000000000000000000000000003E3E3E644141
      41872E2E2E3C2525252E3E3E3E64000000FF0D0D0DF3373737B5363636B73F3F
      3F992B2B2B38000000000000000000000000000000001717171A4242427A1717
      171A00000000000000003B3B3B5A000000FF0F0F0FF1222222DD1F1F1FE72C2C
      2CD33E3E3E9F1717171A0000000000000000000000003535354A151515180000
      000000000000000000003F3F3F68000000FF0D0D0DF3151515ED373737B54040
      40913E3E3EA140404070010101020000000000000000000000004242427A1212
      121400000000000000004141417C3E3E3E9F2E2E2EC739393956000000000000
      000000000000000000000000000000000000000000002424242C2A2A2A360000
      00000000000000000000373737B7414141781A1A1AE51E1E1E24000000000000
      000000000000000000000000000000000000010101022D2D2D3A000000000000
      00000000000010101012202020DF3C3C3C5E181818E905050506000000000000
      0000000000000000000000000000000000000F0F0F1005050506000000000000
      00000000000032323244222222DB3C3C3C5E2D2D2DC90B0B0B0C2A2A2A362E2E
      2E3C0F0F0F100000000000000000000000000000000021212128151515180000
      00000000000000000000262626D91414141621212128242424D91D1D1D220000
      000000000000000000000000000000000000000000001F1F1F24000000000000
      00000000000028282832313131C3010101023E3E3E643B3B3BA9000000000000
      0000000000000000000000000000000000000707070800000000000000000000
      0000000000004040408540404072000000003B3B3BA93A3A3A58000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000010101022C2C2CCF1E1E1E2403030304212121DF12121214000000000000
      0000000000000000000000000000000000000000000010101012000000000000
      00000000000012121214373737B5000000000000000029292934363636BB3E3E
      3E6A1D1D1D220B0B0B0C05050506000000000101010200000000000000000000
      0000000000004040406E393939540000000000000000404040954141418B0505
      0506000000000000000000000000000000000000000000000000000000000000
      000000000000383838B705050506000000001A1A1A1E2C2C2CCD1717171A0000
      0000000000000000000000000000000000000000000000000000000000000000
      00002424242C4040408700000000000000003F3F3F6C41414187000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000707070840404095000000000000000000000000000000001D1D
      1D22282828321D1D1D2205050506000000000000000000000000000000000000
      0000000000003E3E3E662525252E0000000000000000000000002E2E2E3C4141
      4170323232441A1A1A1E01010102000000000000000000000000000000000000
      000000000000424242890000000000000000000000001D1D1D22414141913C3C
      3C5E1717171A0000000000000000000000000000000000000000000000000000
      0000272727303636364C000000000000000001010102424242834040406E0303
      0304000000000000000000000000000000000000000000000000000000000000
      0000000000000000000041414170000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001C1C1C2033333346000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003C3C3C5C00000000000000000000000000000000000000000101
      0102151515180F0F0F1000000000000000000000000000000000000000000000
      00000909090A33333346000000000000000000000000000000001818181C3333
      33461C1C1C200101010200000000000000000000000000000000000000000000
      000000000000000000001C1C1C201D1D1D220000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002D2D2D3A000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001D1D1D220D0D0D0E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002020202600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010120000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000B0B0B0C030303040000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000909090A000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000505050600000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FDFFFCFFFE7F0000FCFFFE7FFE7F0000
      FE7BFF7FFF3F0000FF7BFF3BFF3D0000E733833B8139000001230133F03B0000
      7807F803FC230000FC0FF807F0070000F03FE01FE00F0000E01EC01FC43F0000
      C480CC80DC0F0000CCE7DCC19C810000DEFFDCFFBCFF0000DE7FFEFFFCFF0000
      FF3FFE7FFE7F0000FF9FFF3FFE7F0000FFDFFFFFFFFFFBFFEFEFE3EFF1F7F8FF
      E1EFF8EFFCF7FC77F8EFFCE7FE77FE77FCCFFE6FFE67FE77FE0FFE4FC2478067
      C01F800F800F1007801C181E381FFC0F38017818F81CF03FF803F001F001E008
      F07FF27FE243E601F33FE67FE67FEE7FF71FE73FEE7FEE7FF787F71FEF3FEE3F
      F7F7F7CFEF8FFF1FF7FFFFFFFFFFFFDFFF7FFF3FFFBFFFDFFF3FFFBFFF9FFFDF
      FFBFFF9FC7DFC3CF879F839FE1DFF0CF819DF09EF89FFCCFF819FC9DFC9EFC0F
      FC33FC39FC1CE01CE003E003C0318039C007C0078C039C01CC3F9C3F383F3807
      9C1FB83F793FF03FB981798FF91FF33FF9E1F9C1FB87F30FFDFFF9FFFBE3F3C3
      FCFFFDFFF9FFFBFFFEFFFCFFFDFFFBFF00000000000000000000000000000000
      000000000000}
  end
  object ImageList4: TImageList
    DrawingStyle = dsTransparent
    Left = 168
    Top = 472
    Bitmap = {
      494C01010A000D00040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      00001F1F1F24505050895F5F5FCB656565EB656565EB5F5F5FCB505050891F1F
      1F24000000000000000000000000000000000000000000000000000000000000
      0000202020264848488B464646CD3E3E3EED3E3E3EED464646CD4848488B2020
      2026000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000030303045050
      5089666666FB686868FF686868FF686868FF686868FF686868FF686868FF6666
      66FB505050890303030400000000000000000000000000000000030303044949
      498B373737FB363636FF363636FF363636FF363636FF363636FF363636FF3737
      37FB4949498B0303030400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000030303045A5A5AB36868
      68FF686868FF686868F9595959B14C4C4C7E4B4B4B7A575757A5666666F36868
      68FF686868FF5A5A5AB3030303040000000000000000030303044A4A4AB33636
      36FF363636FF3A3A3AF9494949B14747477E4747477C4A4A4AA73B3B3BF33636
      36FF363636FF4A4A4AB303030304000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005050508B686868FF6868
      68FF5C5C5CC11C1C1C2000000000000000000000000000000000101010125858
      58A7686868FF686868FF5050508B00000000000000004949498B363636FF3636
      36FF474747C11C1C1C2000000000000000000000000000000000101010124A4A
      4AA7363636FF363636FF4949498B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F1F1F24666666FB686868FF5D5D
      5DC5070707080000000000000000000000000000000000000000000000000000
      0000575757A3686868FF666666FB2020202620202026373737FB363636FF4747
      47C5070707080000000000000000000000000000000000000000000000000000
      00004A4A4AA5363636FF373737FB202020260000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005050508B686868FF676767FD2222
      2228000000000000000000000000000000000000000000000000000000000000
      00000D0D0D0E646464ED686868FF5050508B4949498B363636FF393939FD2121
      2128000000000000000000000000000000000000000000000000000000000000
      00000F0F0F103E3E3EED363636FF4949498B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005F5F5FCD686868FF5C5C5CC10000
      0000000000000000000001010102444444624444446201010102000000000000
      00000000000054545499686868FF5F5F5FCD464646CD363636FF474747C10000
      0000000000000000000001010102464646604646466001010102000000000000
      0000000000004949499B363636FF464646CD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000656565ED686868FF535353930000
      00000000000000000000444444629B9B9BFF9B9B9BFF44444462000000000000
      0000000000004545456A686868FF656565ED3F3F3FEF363636FF494949950000
      0000000000000000000046464660CDCDCDFFCDCDCDFF46464660000000000000
      0000000000004242426A363636FF3F3F3FEF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000656565ED686868FF535353950000
      00000000000000000000444444629B9B9BFF9B9B9BFF44444462000000000000
      0000000000004545456A686868FF656565ED3F3F3FEF363636FF494949950000
      0000000000000000000046464660CDCDCDFFCDCDCDFF46464660000000000000
      0000000000004242426C363636FF3F3F3FEF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005F5F5FCD686868FF5D5D5DC30000
      0000000000000000000001010102444444624444446201010102000000000000
      0000000000005454549B686868FF5F5F5FCD464646CD363636FF474747C50000
      0000000000000000000001010102464646604646466001010102000000000000
      0000000000004A4A4A9D363636FF464646CD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005050508B686868FF676767FD2424
      242C000000000000000000000000000000000000000000000000000000000000
      00000F0F0F10656565EF686868FF5050508B4949498B363636FF383838FD2424
      242C000000000000000000000000000000000000000000000000000000000000
      0000101010123D3D3DEF363636FF4949498B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F1F1F24666666FB686868FF5E5E
      5EC90909090A0000000000000000000000000000000000000000000000000101
      0102585858A9686868FF666666FB1F1F1F241F1F1F24373737FB363636FF4646
      46CB0909090A0000000000000000000000000000000000000000000000000101
      01024A4A4AAB363636FF373737FB202020260000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000050505089686868FF6868
      68FF5E5E5EC72020202600000000000000000000000000000000141414165959
      59AD686868FF686868FF5050508B00000000000000004949498B363636FF3636
      36FF474747C72020202600000000000000000000000000000000151515184949
      49AF363636FF363636FF4949498B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000030303045A5A5AB36868
      68FF686868FF666666FB5B5B5BB94E4E4E854D4D4D81595959AD666666F56868
      68FF686868FF5A5A5AB3030303040000000000000000030303044A4A4AB33636
      36FF363636FF373737FB484848B94848488747474783494949AF3A3A3AF73636
      36FF363636FF494949B303030304000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000030303045050
      5089666666FB686868FF686868FF686868FF686868FF686868FF686868FF6666
      66FB505050890303030400000000000000000000000000000000030303044949
      498B373737FB363636FF363636FF363636FF363636FF363636FF363636FF3737
      37FB4949498B0303030400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001F1F1F24505050895F5F5FCB656565EB656565EB5F5F5FCB505050891F1F
      1F24000000000000000000000000000000000000000000000000000000000000
      00001F1F1F2448484889464646CD3E3E3EED3E3E3EED464646CD484848891F1F
      1F24000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001D1D1D225D5D5D878E8E8EC9B0B0B0E9B0B0B0E98E8E8EC95D5D5D871D1D
      1D22000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001D1D1D225D5D5D878E8E8EC9B0B0B0E9B0B0B0E98E8E8EC95D5D5D871D1D
      1D22000000000000000000000000000000000000000000000000000000000000
      00001F1F1F2456565687777777CB8C8C8CEB8C8C8CEB777777CB565656871F1F
      1F24000000000000000000000000000000000000000000000000030303045D5D
      5D87C8C8C8FBCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFC8C8
      C8FB5D5D5D870303030400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000030303045D5D
      5D87C8C8C8FBCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFC8C8
      C8FB5D5D5D870303030400000000000000000000000000000000030303045757
      5789979797FB9B9B9BFF9B9B9BFF9B9B9BFF9B9B9BFF9B9B9BFF9B9B9BFF9797
      97FB5757578903030304000000000000000000000000030303047A7A7AB1CDCD
      CDFFCDCDCDFFC4C4C4F9797979AF5555557A54545478707070A3BABABAF1CDCD
      CDFFCDCDCDFF7A7A7AB103030304000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000030303047A7A7AB1CDCD
      CDFFCDCDCDFFC4C4C4F9797979AF5555557A54545478707070A3BABABAF1CDCD
      CDFFCDCDCDFF7A7A7AB103030304000000000000000003030304696969B19B9B
      9BFF9B9B9BFF959595F9696969AF5151517C4F4F4F78646464A5909090F19B9B
      9BFF9B9B9BFF696969B10303030400000000000000005D5D5D87CDCDCDFFCDCD
      CDFF868686BF1A1A1A1E000000000000000000000000000000000F0F0F107272
      72A5CDCDCDFFCDCDCDFF5D5D5D87000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005D5D5D87CDCDCDFFCDCD
      CDFF868686BF1A1A1A1E000000000000000000000000000000000F0F0F107272
      72A5CDCDCDFFCDCDCDFF5D5D5D870000000000000000575757899B9B9BFF9B9B
      9BFF717171BF1A1A1A1E00000000000000000000000000000000101010126464
      64A59B9B9BFF9B9B9BFF57575789000000001D1D1D22C8C8C8FBCDCDCDFF8989
      89C3050505060000000000000000000000000000000000000000000000000000
      00006E6E6EA1CDCDCDFFC8C8C8FB1F1F1F240000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001D1D1D22C8C8C8FBCDCDCDFF8989
      89C3050505060000000000000000000000000000000000000000000000000000
      00006E6E6EA1CDCDCDFFC8C8C8FB1F1F1F241F1F1F24979797FB9B9B9BFF7373
      73C3070707080000000000000000000000000000000000000000000000000000
      0000636363A39B9B9BFF979797FB1F1F1F245E5E5E89CDCDCDFFC9C9C9FD2020
      2026000000000000000000000000000000000000000000000000000000000000
      00000D0D0D0EB3B3B3EBCDCDCDFF5E5E5E890000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005E5E5E89CDCDCDFFC9C9C9FD2020
      2026000000000000000000000000000000000000000000000000000000000000
      00000D0D0D0EB3B3B3EBCDCDCDFF5E5E5E89575757899B9B9BFF9A9A9AFD2020
      2026000000000000000000000000000000000000000000000000000000000000
      00000D0D0D0E8D8D8DED9B9B9BFF57575789919191CBCDCDCDFF868686BF0000
      0000000000000000000001010102404040644040406401010102000000000000
      00000000000067676797CDCDCDFF919191CB0000000000000000000000000000
      00000000000000000000010101023C3C3C603C3C3C6001010102000000000000
      000000000000000000000000000000000000919191CBCDCDCDFF868686BF0000
      0000000000000000000001010102404040644040406401010102000000000000
      00000000000067676797CDCDCDFF919191CB777777CB9B9B9BFF717171BF0000
      0000000000000000000001010102424242624242426201010102000000000000
      0000000000005F5F5F999B9B9BFF777777CBB3B3B3EBCDCDCDFF646464910000
      0000000000000000000040404064363636FF363636FF40404064000000000000
      0000000000004B4B4B68CDCDCDFFB3B3B3EB0000000000000000000000000000
      000000000000000000003C3C3C60050505FF050505FF3C3C3C60000000000000
      000000000000000000000000000000000000B3B3B3EBCDCDCDFF646464910000
      0000000000000000000040404064363636FF363636FF40404064000000000000
      0000000000004B4B4B68CDCDCDFFB3B3B3EB8D8D8DEB9B9B9BFF5B5B5B930000
      0000000000000000000042424262686868FF686868FF42424262000000000000
      000000000000484848689B9B9BFF8D8D8DEBB3B3B3EBCDCDCDFF646464910000
      0000000000000000000040404064363636FF363636FF40404064000000000000
      0000000000004B4B4B68CDCDCDFFB3B3B3EB0000000000000000000000000000
      000000000000000000003C3C3C60050505FF050505FF3C3C3C60000000000000
      000000000000000000000000000000000000B3B3B3EBCDCDCDFF646464910000
      0000000000000000000040404064363636FF363636FF40404064000000000000
      0000000000004B4B4B68CDCDCDFFB3B3B3EB8D8D8DEB9B9B9BFF5B5B5B930000
      0000000000000000000042424262686868FF686868FF42424262000000000000
      0000000000004848486A9B9B9BFF8D8D8DEB919191CBCDCDCDFF878787C10000
      0000000000000000000001010102404040644040406401010102000000000000
      00000000000069696999CDCDCDFF919191CB0000000000000000000000000000
      00000000000000000000010101023C3C3C603C3C3C6001010102000000000000
      000000000000000000000000000000000000919191CBCDCDCDFF878787C10000
      0000000000000000000001010102404040644040406401010102000000000000
      00000000000069696999CDCDCDFF919191CB777777CB9B9B9BFF737373C30000
      0000000000000000000001010102424242624242426201010102000000000000
      0000000000005F5F5F9B9B9B9BFF777777CB5D5D5D87CDCDCDFFC9C9C9FD2323
      232A000000000000000000000000000000000000000000000000000000000000
      00000F0F0F10B5B5B5EDCDCDCDFF5D5D5D870000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005D5D5D87CDCDCDFFC9C9C9FD2323
      232A000000000000000000000000000000000000000000000000000000000000
      00000F0F0F10B5B5B5EDCDCDCDFF5D5D5D87575757899B9B9BFF9A9A9AFD2323
      232A000000000000000000000000000000000000000000000000000000000000
      00000F0F0F108E8E8EEF9B9B9BFF575757891D1D1D22C8C8C8FBCDCDCDFF8D8D
      8DC7070707080000000000000000000000000000000000000000000000000101
      0102737373A7CDCDCDFFC8C8C8FB1F1F1F240000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001D1D1D22C8C8C8FBCDCDCDFF8D8D
      8DC7070707080000000000000000000000000000000000000000000000000101
      0102737373A7CDCDCDFFC8C8C8FB1F1F1F241F1F1F24979797FB9B9B9BFF7676
      76C90909090A0000000000000000000000000000000000000000000000000101
      0102656565A99B9B9BFF979797FB1F1F1F24000000005D5D5D87CDCDCDFFCDCD
      CDFF8B8B8BC51F1F1F2400000000000000000000000000000000141414167676
      76ABCDCDCDFFCDCDCDFF5D5D5D87000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005D5D5D87CDCDCDFFCDCD
      CDFF8B8B8BC51F1F1F2400000000000000000000000000000000141414167676
      76ABCDCDCDFFCDCDCDFF5D5D5D870000000000000000575757899B9B9BFF9B9B
      9BFF747474C51F1F1F2400000000000000000000000000000000141414166868
      68AD9B9B9BFF9B9B9BFF57575789000000000000000003030304797979AFCDCD
      CDFFCDCDCDFFC8C8C8FB7F7F7FB75B5B5B835A5A5A81767676ABBFBFBFF5CDCD
      CDFFCDCDCDFF797979AF03030304000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000003030304797979AFCDCD
      CDFFCDCDCDFFC8C8C8FB7F7F7FB75B5B5B835A5A5A81767676ABBFBFBFF5CDCD
      CDFFCDCDCDFF797979AF03030304000000000000000003030304696969B19B9B
      9BFF9B9B9BFF979797FB6D6D6DB75555558553535381686868AD939393F59B9B
      9BFF9B9B9BFF696969B103030304000000000000000000000000030303045D5D
      5D87C8C8C8FBCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFC8C8
      C8FB5D5D5D870303030400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000030303045D5D
      5D87C8C8C8FBCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFC8C8
      C8FB5D5D5D870303030400000000000000000000000000000000030303045656
      5687979797FB9B9B9BFF9B9B9BFF9B9B9BFF9B9B9BFF9B9B9BFF9B9B9BFF9797
      97FB565656870303030400000000000000000000000000000000000000000000
      00001D1D1D225D5D5D878E8E8EC9B0B0B0E9B0B0B0E98E8E8EC95D5D5D871D1D
      1D22000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001D1D1D225D5D5D878E8E8EC9B0B0B0E9B0B0B0E98E8E8EC95D5D5D871D1D
      1D22000000000000000000000000000000000000000000000000000000000000
      00001F1F1F2456565687777777CB8C8C8CEB8C8C8CEB777777CB565656871F1F
      1F24000000000000000000000000000000000000000000000000000000000000
      0000202020264141418B2E2E2ECD191919ED191919ED2E2E2ECD4141418B2020
      2026000000000000000000000000000000000000000000000000000000000000
      0000202020264848488B464646CD3E3E3EED3E3E3EED464646CD4848488B2020
      2026000000000000000000000000000000000000000000000000000000000000
      00001F1F1F24505050895F5F5FCB656565EB656565EB5F5F5FCB505050891F1F
      1F24000000000000000000000000000000000000000000000000000000000000
      00001F1F1F2456565687777777CB8C8C8CEB8C8C8CEB777777CB565656871F1F
      1F24000000000000000000000000000000000000000000000000050505064141
      418D0A0A0AFB050505FF050505FF050505FF050505FF050505FF050505FF0A0A
      0AFB4141418D0505050600000000000000000000000000000000030303044949
      498B373737FB363636FF363636FF363636FF363636FF363636FF363636FF3737
      37FB4949498B0303030400000000000000000000000000000000030303045050
      5089666666FB686868FF686868FF686868FF686868FF686868FF686868FF6666
      66FB505050890303030400000000000000000000000000000000030303045757
      5789979797FB9B9B9BFF9B9B9BFF9B9B9BFF9B9B9BFF9B9B9BFF9B9B9BFF9797
      97FB575757890303030400000000000000000000000005050506393939B50505
      05FF050505FF0C0C0CF93A3A3AB3424242814141417C3D3D3DA7131313F30505
      05FF050505FF393939B5050505060000000000000000030303044A4A4AB33636
      36FF363636FF3A3A3AF9494949B14747477E4747477C4A4A4AA73B3B3BF33636
      36FF363636FF4A4A4AB3030303040000000000000000030303045A5A5AB36868
      68FF686868FF686868F9595959B14C4C4C7E4B4B4B7A575757A5666666F36868
      68FF686868FF5A5A5AB303030304000000000000000003030304696969B19B9B
      9BFF9B9B9BFF959595F9696969AF5151517C4F4F4F78646464A5909090F19B9B
      9BFF9B9B9BFF696969B10303030400000000000000004141418D050505FF0505
      05FF333333C31D1D1D2200000000000000000000000000000000121212143D3D
      3DA9050505FF050505FF4141418D00000000000000004949498B363636FF3636
      36FF474747C11C1C1C2000000000000000000000000000000000101010124A4A
      4AA7363636FF363636FF4949498B00000000000000005050508B686868FF6868
      68FF5C5C5CC11C1C1C2000000000000000000000000000000000101010125858
      58A7686868FF686868FF5050508B0000000000000000575757899B9B9BFF9B9B
      9BFF717171BF1A1A1A1E00000000000000000000000000000000101010126464
      64A59B9B9BFF9B9B9BFF5757578900000000202020260A0A0AFB050505FF3030
      30C7070707080000000000000000000000000000000000000000000000000000
      00003D3D3DA5050505FF0A0A0AFB2020202620202026373737FB363636FF4747
      47C5070707080000000000000000000000000000000000000000000000000000
      00004A4A4AA5363636FF373737FB202020261F1F1F24666666FB686868FF5D5D
      5DC5070707080000000000000000000000000000000000000000000000000000
      0000575757A3686868FF666666FB202020261F1F1F24979797FB9B9B9BFF7373
      73C3070707080000000000000000000000000000000000000000000000000000
      0000636363A39B9B9BFF979797FB1F1F1F244040408D050505FF080808FD2121
      2128000000000000000000000000000000000000000000000000000000000000
      00000F0F0F10161616EF050505FF4040408D4949498B363636FF393939FD2121
      2128000000000000000000000000000000000000000000000000000000000000
      00000F0F0F103E3E3EED363636FF4949498B5050508B686868FF676767FD2222
      2228000000000000000000000000000000000000000000000000000000000000
      00000D0D0D0E646464ED686868FF5050508B575757899B9B9BFF9A9A9AFD2020
      2026000000000000000000000000000000000000000000000000000000000000
      00000D0D0D0E8D8D8DED9B9B9BFF575757892D2D2DCF050505FF333333C30000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3F9B050505FF2D2D2DCF464646CD363636FF474747C10000
      0000000000000000000001010102464646604646466001010102000000000000
      0000000000004949499B363636FF464646CD5F5F5FCD686868FF5C5C5CC10000
      0000000000000000000001010102444444624444446201010102000000000000
      00000000000054545499686868FF5F5F5FCD777777CB9B9B9BFF717171BF0000
      0000000000000000000001010102424242624242426201010102000000000000
      0000000000005F5F5F999B9B9BFF777777CB191919EF050505FF404040970000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3F6C050505FF191919EF3F3F3FEF363636FF494949950000
      0000000000000000000046464660CDCDCDFFCDCDCDFF46464660000000000000
      0000000000004242426A363636FF3F3F3FEF656565ED686868FF535353930000
      00000000000000000000444444629B9B9BFF9B9B9BFF44444462000000000000
      0000000000004545456A686868FF656565ED8D8D8DEB9B9B9BFF5B5B5B930000
      0000000000000000000042424262686868FF686868FF42424262000000000000
      000000000000484848689B9B9BFF8D8D8DEB191919EF050505FF404040970000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3F6C050505FF191919EF3F3F3FEF363636FF494949950000
      0000000000000000000046464660CDCDCDFFCDCDCDFF46464660000000000000
      0000000000004242426C363636FF3F3F3FEF656565ED686868FF535353950000
      00000000000000000000444444629B9B9BFF9B9B9BFF44444462000000000000
      0000000000004545456A686868FF656565ED8D8D8DEB9B9B9BFF5B5B5B930000
      0000000000000000000042424262686868FF686868FF42424262000000000000
      0000000000004848486A9B9B9BFF8D8D8DEB2D2D2DCF050505FF323232C50000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3F9D050505FF2D2D2DCF464646CD363636FF474747C50000
      0000000000000000000001010102464646604646466001010102000000000000
      0000000000004A4A4A9D363636FF464646CD5F5F5FCD686868FF5D5D5DC30000
      0000000000000000000001010102444444624444446201010102000000000000
      0000000000005454549B686868FF5F5F5FCD777777CB9B9B9BFF737373C30000
      0000000000000000000001010102424242624242426201010102000000000000
      0000000000005F5F5F9B9B9B9BFF777777CB4040408D050505FF080808FD2424
      242C000000000000000000000000000000000000000000000000000000000000
      000010101012141414F1050505FF4040408D4949498B363636FF383838FD2424
      242C000000000000000000000000000000000000000000000000000000000000
      0000101010123D3D3DEF363636FF4949498B5050508B686868FF676767FD2424
      242C000000000000000000000000000000000000000000000000000000000000
      00000F0F0F10656565EF686868FF5050508B575757899B9B9BFF9A9A9AFD2323
      232A000000000000000000000000000000000000000000000000000000000000
      00000F0F0F108E8E8EEF9B9B9BFF57575789202020260A0A0AFB050505FF2E2E
      2ECB0909090A0000000000000000000000000000000000000000000000000101
      01023C3C3CAD050505FF0A0A0AFB202020261F1F1F24373737FB363636FF4646
      46CB0909090A0000000000000000000000000000000000000000000000000101
      01024A4A4AAB363636FF373737FB202020261F1F1F24666666FB686868FF5E5E
      5EC90909090A0000000000000000000000000000000000000000000000000101
      0102585858A9686868FF666666FB1F1F1F241F1F1F24979797FB9B9B9BFF7676
      76C90909090A0000000000000000000000000000000000000000000000000101
      0102656565A99B9B9BFF979797FB1F1F1F24000000004141418D050505FF0505
      05FF2F2F2FC92121212800000000000000000000000000000000151515183A3A
      3AB1050505FF050505FF4141418D00000000000000004949498B363636FF3636
      36FF474747C72020202600000000000000000000000000000000151515184949
      49AF363636FF363636FF4949498B000000000000000050505089686868FF6868
      68FF5E5E5EC72020202600000000000000000000000000000000141414165959
      59AD686868FF686868FF5050508B0000000000000000575757899B9B9BFF9B9B
      9BFF747474C51F1F1F2400000000000000000000000000000000141414166868
      68AD9B9B9BFF9B9B9BFF57575789000000000000000005050506393939B50505
      05FF050505FF0A0A0AFB363636BB40404087404040833A3A3AB10F0F0FF70505
      05FF050505FF393939B5050505060000000000000000030303044A4A4AB33636
      36FF363636FF373737FB484848B94848488747474783494949AF3A3A3AF73636
      36FF363636FF494949B3030303040000000000000000030303045A5A5AB36868
      68FF686868FF666666FB5B5B5BB94E4E4E854D4D4D81595959AD666666F56868
      68FF686868FF5A5A5AB303030304000000000000000003030304696969B19B9B
      9BFF9B9B9BFF979797FB6D6D6DB75555558553535381686868AD939393F59B9B
      9BFF9B9B9BFF696969B103030304000000000000000000000000030303044141
      418B0A0A0AFB050505FF050505FF050505FF050505FF050505FF050505FF0A0A
      0AFB4141418B0303030400000000000000000000000000000000030303044949
      498B373737FB363636FF363636FF363636FF363636FF363636FF363636FF3737
      37FB4949498B0303030400000000000000000000000000000000030303045050
      5089666666FB686868FF686868FF686868FF686868FF686868FF686868FF6666
      66FB505050890303030400000000000000000000000000000000030303045656
      5687979797FB9B9B9BFF9B9B9BFF9B9B9BFF9B9B9BFF9B9B9BFF9B9B9BFF9797
      97FB565656870303030400000000000000000000000000000000000000000000
      0000202020264141418B2E2E2ECD191919ED191919ED2E2E2ECD4141418B2020
      2026000000000000000000000000000000000000000000000000000000000000
      00001F1F1F2448484889464646CD3E3E3EED3E3E3EED464646CD484848891F1F
      1F24000000000000000000000000000000000000000000000000000000000000
      00001F1F1F24505050895F5F5FCB656565EB656565EB5F5F5FCB505050891F1F
      1F24000000000000000000000000000000000000000000000000000000000000
      00001F1F1F2456565687777777CB8C8C8CEB8C8C8CEB777777CB565656871F1F
      1F2400000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00F00FF00F00000000C003C00300000000
      800180010000000083C183C10000000007F007F0000000000FF00FF000000000
      1C381C38000000001C381C38000000001C381C38000000001C381C3800000000
      0FF00FF00000000007E007E00000000083C183C1000000008001800100000000
      C003C00300000000F00FF00F00000000F00FFFFFF00FF00FC003FFFFC003C003
      8001FFFF8001800183C1FFFF83C183C107F0FFFF07F007F00FF0FFFF0FF00FF0
      1C38FC3F1C381C381C38FC3F1C381C381C38FC3F1C381C381C38FC3F1C381C38
      0FF0FFFF0FF00FF007E0FFFF07E007E083C1FFFF83C183C18001FFFF80018001
      C003FFFFC003C003F00FFFFFF00FF00FF00FF00FF00FF00FC003C003C003C003
      800180018001800183C183C183C183C107F007F007F007F00FF00FF00FF00FF0
      1FF81C381C381C381FF81C381C381C381FF81C381C381C381FF81C381C381C38
      0FF00FF00FF00FF007E007E007E007E083C183C183C183C18001800180018001
      C003C003C003C003F00FF00FF00FF00F00000000000000000000000000000000
      000000000000}
  end
end
