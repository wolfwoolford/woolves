Program Lesson6_Program3;
Uses Crt;
Var n1 : String;

Begin
    Writeln('Enter two numbers: (any number except 0 to exit)');
    Repeat
        Write('No.1: ');
        Readln(n1);
        Write(n1);
        If not(n1 = '0') Then Halt;
    Until not(n1 = '0');
End. 
