# TRMobileScreen
(Project with a MobileScreen subclass, TRMobileScreen, to improve XOJO's default screen layout behavior)

### The Problem
XOJO's native class, MobileScreen, fires Opening, Resized, and OrientationChanged events before the layout engine does it's work.

In the Opening event, controls on the screen will report their default "unpacked" size (100 x 100) and position:

![95fb0e7b5de680381b957e5764a0875a9cac5e49](https://user-images.githubusercontent.com/759144/204836387-cf821017-5cb8-4bdb-a1db-6620ece09adf.png)

In the OrientationChanged event, controls will report their BEFORE dimensions. This means X & Y axis values are swapped:

![5433af81aaf4fa7a8fc49fcd6160c67c0c4d06ec](https://user-images.githubusercontent.com/759144/204836683-794d5f40-6cd0-41e5-9000-0b10d293bf89.png)


### The Fix
This project has a subclass, TRMobileScreen, that works around these layout events inconsistencies.

The Opening event will only fire after the layout engine has unpacked and placed screen controls:

![cbb4eb959df692f9a19474fda85f8bd3f1fa36da](https://user-images.githubusercontent.com/759144/204837235-be35695f-a772-4b8e-b24d-0f8c2dabeca9.png)

The OrientationChanged event will only fire after the layout engine has updated the screen controls:

![cbb4eb959df692f9a19474fda85f8bd3f1fa36da](https://user-images.githubusercontent.com/759144/204837430-1861006e-ee83-4577-8ee2-563c68b49996.png)

![a237e38c45274a836644259b12f1e2edf14aa368](https://user-images.githubusercontent.com/759144/204837467-c857587c-0086-4fed-95ad-c2ec05404e43.png)


### Please Help
Developing this workaround revealed a couple XOJO bugs; upvotes would be great if they affect you:

##### iOS: Incorrect height for MobileScreen.Size
https://tracker.xojo.com/xojoinc/xojo/-/issues/71069

TRMobileScreen relies on getting accurate screen dimensions and uses the workaround described in the feedback report.


##### A MobileScreen subclasses ignore the IDE settings for MobileScreen.HasNavigationBar and MobileScreen.LargeTitleDisplayMode
https://tracker.xojo.com/xojoinc/xojo/-/issues/71070

Using TRMobileScreen will trigger this XOJO bug; I'm currently working on a workaround and will update the repo if I find one. In the meantime, you'll need to set your preferred NavigationBar settings in code:

		  Me.HasNavigationBar = False
		  Me.LargeTitleDisplayMode = MobileScreen.LargeTitleDisplayModes.Never

The repo project uses this workaround.
