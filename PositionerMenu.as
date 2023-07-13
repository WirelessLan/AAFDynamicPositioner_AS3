package  {
	import UIComponent.View;
	import UIComponent.Label;
	import UIComponent.Slider;
	import UIComponent.Button;
	import UIComponent.UIEvent;
	
	public class PositionerMenu extends View {
		private var _menuWidth:uint = 560;
		private var _menuHeight:uint = 280;
		
		private var _sliderInitComplete:Boolean = false;
		
		private var sliderX:Slider;
		private var sliderY:Slider;
		private var sliderZ:Slider;
		
		private var sliderXLbl:Label;
		private var sliderYLbl:Label;
		private var sliderZLbl:Label;
		
		private var clearBtn:Button;
		private var closeBtn:Button;

		public function PositionerMenu(x:Number, y:Number, z:Number) {
			var titleText = "_$AAFDynamicPositionerMenuTitle";
			if (Shared.Localizations.$AAFDynamicPositionerMenuTitle)
				titleText = Shared.Localizations.$AAFDynamicPositionerMenuTitle;

        	super(this._menuWidth, this._menuHeight, titleText);
			
			this.sliderX.value = x;
			this.sliderY.value = y;
			this.sliderZ.value = z;
			
			this._sliderInitComplete = true;
		}
		
		public function UpdateSlider(x:Number, y:Number, z:Number) : void {
			if (this.focusedComponent) {
				this.focusedComponent.SetFocus(false);
				this.focusedComponent = null;
			}
			
			this.sliderX.value = x;
			this.sliderY.value = y;
			this.sliderZ.value = z;
		}
		
		protected override function InitializeView() : void {
			super.InitializeView();
			
			this.x = 700;
			this.y = 420;
			
			var xAxisText = "_$AAFDynamicPositionerMenuXAxis";
			if (Shared.Localizations.$AAFDynamicPositionerMenuXAxis)
				xAxisText = Shared.Localizations.$AAFDynamicPositionerMenuXAxis;
			var sliderNameLbl:Label = new Label(this._menuWidth - 20, 24, xAxisText, 16);
			sliderNameLbl.x = 15;
			sliderNameLbl.y = 40;
			this.AddComponent(sliderNameLbl);
			
			this.sliderX = new Slider(this._menuWidth - 100, 30, -200, 200, 0.1);
			this.sliderX.x = 15;
			this.sliderX.y = 65;
			this.sliderX.addEventListener(UIEvent.CHANGE, sliderX_change);
			this.AddComponent(this.sliderX);
			
			this.sliderXLbl = new Label(80, 30, "0.0", 24, "center");
			this.sliderXLbl.x = 475;
			this.sliderXLbl.y = 62;
			this.AddComponent(this.sliderXLbl);
			
			var yAxisText = "_$AAFDynamicPositionerMenuYAxis";
			if (Shared.Localizations.$AAFDynamicPositionerMenuYAxis)
				yAxisText = Shared.Localizations.$AAFDynamicPositionerMenuYAxis;
			sliderNameLbl = new Label(this._menuWidth - 20, 24, yAxisText, 16);
			sliderNameLbl.x = 15;
			sliderNameLbl.y = 105;
			this.AddComponent(sliderNameLbl);
			
			this.sliderY = new Slider(this._menuWidth - 100, 30, -200, 200, 0.1);
			this.sliderY.x = 15;
			this.sliderY.y = 130;
			this.sliderY.addEventListener(UIEvent.CHANGE, sliderY_change);
			this.AddComponent(this.sliderY);
			
			this.sliderYLbl = new Label(80, 30, "0.0", 24, "center");
			this.sliderYLbl.x = 475;
			this.sliderYLbl.y = 132;
			this.AddComponent(this.sliderYLbl);
			
			var zAxisText = "_$AAFDynamicPositionerMenuZAxis";
			if (Shared.Localizations.$AAFDynamicPositionerMenuZAxis)
				zAxisText = Shared.Localizations.$AAFDynamicPositionerMenuZAxis;
			sliderNameLbl = new Label(this._menuWidth - 20, 24, zAxisText, 16);
			sliderNameLbl.x = 15;
			sliderNameLbl.y = 170;
			this.AddComponent(sliderNameLbl);
			
			this.sliderZ = new Slider(this._menuWidth - 100, 30, -200, 200, 0.1);
			this.sliderZ.x = 15;
			this.sliderZ.y = 195;
			this.sliderZ.addEventListener(UIEvent.CHANGE, sliderZ_change);
			this.AddComponent(this.sliderZ);
			
			this.sliderZLbl = new Label(80, 30, "0.0", 24, "center");
			this.sliderZLbl.x = 475;
			this.sliderZLbl.y = 197;
			this.AddComponent(this.sliderZLbl);
			
			this.clearBtn = new Button(100, 30);
			this.clearBtn.x = 340;
			this.clearBtn.y = 240;
			var clearBtnText = "_$AAFDynamicPositionerMenuClearBtn";
			if (Shared.Localizations.$AAFDynamicPositionerMenuClearBtn)
				clearBtnText = Shared.Localizations.$AAFDynamicPositionerMenuClearBtn;
			this.clearBtn.text = clearBtnText;
			this.clearBtn.addEventListener(UIEvent.ACTIVATE, clearBtn_activate);
			this.AddComponent(this.clearBtn);
			
			this.closeBtn = new Button(100, 30);
			this.closeBtn.x = 450;
			this.closeBtn.y = 240;
			var closeBtnText = "_$AAFDynamicPositionerMenuCloseBtn";
			if (Shared.Localizations.$AAFDynamicPositionerMenuCloseBtn)
				closeBtnText = Shared.Localizations.$AAFDynamicPositionerMenuCloseBtn;
			this.closeBtn.text = closeBtnText;
			this.closeBtn.addEventListener(UIEvent.ACTIVATE, closeBtn_activate);
			this.AddComponent(this.closeBtn);
		}
		
		private function sliderX_change(evn:UIEvent) : * {
			if (this._sliderInitComplete && Shared.F4SEPlugin)
				Shared.F4SEPlugin.SetPosition("X", evn.value);
			this.sliderXLbl.text = evn.value.toFixed(1);
		}
		
		private function sliderY_change(evn:UIEvent) : * {
			if (this._sliderInitComplete && Shared.F4SEPlugin)
				Shared.F4SEPlugin.SetPosition("Y", evn.value);
			this.sliderYLbl.text = evn.value.toFixed(1);
		}
		
		private function sliderZ_change(evn:UIEvent) : * {
			if (this._sliderInitComplete && Shared.F4SEPlugin)
				Shared.F4SEPlugin.SetPosition("Z", evn.value);
			this.sliderZLbl.text = evn.value.toFixed(1);
		}
		
		private function clearBtn_activate(evn:UIEvent) : * {
			this.sliderX.value = 0.0;
			this.sliderY.value = 0.0;
			this.sliderZ.value = 0.0;
			
			if (Shared.F4SEPlugin)
				Shared.F4SEPlugin.ClearPosition();
		}
		
		private function closeBtn_activate(evn:UIEvent) : * {
			Shared.CloseView(0, true);
		}
	}
}