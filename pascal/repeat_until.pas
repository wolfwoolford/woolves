Program Lesson6_Program3;
Uses Crt;
Var n1 : String;

{ what is this crazy loop i just copied it from the web hey it compiles!! }
Begin
    Writeln('Enter two numbers: (any number except 0 to exit)');
    Repeat
        Write('No.1: ');
        Readln(n1);
        Write(n1);
        If not(n1 = '0') Then Halt;
    Until not(n1 = '0');
End. 
