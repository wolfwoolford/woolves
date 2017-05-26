program CharacterMoving;
uses SwinGame, sgTypes;


procedure Main();
const
	CIRCLE_RADIUS = 150;

var
	x, y: Single;

begin
	OpenGraphicsWindow('Character Moving', 800, 600);
	x :=400;
	y :=300;

	repeat
		begin
			ProcessEvents();
			if KeyDown(LeftKey) and (x - CIRCLE_RADIUS  > 0) then
				x := x-1;
			if KeyDown(RightKey) and (x + CIRCLE_RADIUS < ScreenWidth()) then
				x := x+1;
			if KeyDown(UpKey) and (y - CIRCLE_RADIUS > 0) then
				y := y-1;
			if KeyDown(DownKey) and (y + CIRCLE_RADIUS < ScreenHeight()) then
				y := y+1;
			ClearScreen(ColorWhite);
			FillCircle(ColorGreen, x, y, CIRCLE_RADIUS);
			RefreshScreen(60);
		end;
	until (WindowCloseRequested() = true);
end;
// ProcessEvents (); //Listens for user input
// MouseX(): Single; //X Location of the mouse.
// MouseY(): Single; //Y Location of the mouse
// MouseClicked(LeftButton/RightButton): Boolean; //
// WindowCloseRequested(): Boolean; //Allows user to close window
// KeyDown(AKey/LeftKey): Boolean; //Is a key being held down?
// KeyTyped(AKey/LeftKey): Boolean; //Was the key typed.



begin
	Main();
end.
