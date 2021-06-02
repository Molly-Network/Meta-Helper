include("metahelper/modules/default_values.lua")
include("metahelper/modules/mining_esp.lua")
include("metahelper/modules/scoreboard_edit.lua")
include("metahelper/modules/skybox_edit.lua")
include("metahelper/modules/text_bubble_gui.lua")

local frame = vgui.Create( "DFrame" )
frame:SetSize( 1100, 500 )
frame:SetTitle("Meta Helper - Non selected")
frame:Center()
frame:MakePopup()

local selectpanel = vgui.Create("DScrollPanel",frame)



local view = vgui.Create("DPanel",frame)

local div = vgui.Create( "DHorizontalDivider", frame )
div:Dock( FILL )
div:SetLeft( selectpanel )
div:SetRight( view )
div:SetDividerWidth( 4 )
div:SetLeftMin( 100 )
div:SetRightMin( 100 )
div:SetLeftWidth( 190 )

local grid = vgui.Create( "DIconLayout", selectpanel )
grid:Dock(FILL)
grid:SetSpaceY( 5 ) 
grid:SetSpaceX( 10 ) 

local col1 = Color(159,75,163)
local col2 = Color(110,47,109)

local function listbutton(name,text,icon,func)
	local ourMat = Material(icon)
	
	local ListItem = name:Add( "DButton" )
	ListItem:SetSize( 90, 90 )
	ListItem:SetText(" ")
	ListItem.DoClick = func
	function ListItem:Paint( w, h )
		if (self:IsDown()) then
		draw.RoundedBox(5,0,0,w,h,Color(24,24,24))
		draw.DrawText(text,"BudgetLabel",w/2,70,col2,TEXT_ALIGN_CENTER)
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.SetMaterial( ourMat )
			surface.DrawTexturedRect( 23, 17, 44, 44 )
		
		elseif(self:IsHovered()) then
			draw.RoundedBox(5,0,0,w,h,Color(30,30,30))
			draw.DrawText(text,"BudgetLabel",w/2,70,col1,TEXT_ALIGN_CENTER)
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.SetMaterial( ourMat )
			surface.DrawTexturedRect( 20, 15, 50, 50 )
		else
			draw.RoundedBox(5,0,0,w,h,Color(24,24,24))
			draw.DrawText(text,"BudgetLabel",w/2,70,Color(255,255,255),TEXT_ALIGN_CENTER)
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.SetMaterial( ourMat )
			surface.DrawTexturedRect( 20, 15, 50, 50 )
		end
	end
end


listbutton(grid,"Text Bubble","icon16/user_comment.png",function() frame:SetTitle("Meta Helper v0.2 - Text Bubble") view:Clear() TEXT_BUBBLE(view) end)
listbutton(grid,"Skybox","icon16/photos.png",function() view:Clear() end)
listbutton(grid,"Scoreboard","icon16/table_edit.png",function() view:Clear() TEXT_BUBBLE(view) end)
listbutton(grid,"Meta ESP","icon16/mouse_add.png",function() view:Clear() frame:SetTitle("Meta Helper v0.2 - Meta ESP") ESP_Settings(view) end)
listbutton(grid,"Settings","icon16/wrench_orange.png",function() view:Clear() TEXT_BUBBLE(view) end)
listbutton(grid,"Change Logs","icon16/page_white_wrench.png",function() view:Clear() TEXT_BUBBLE(view) end)



