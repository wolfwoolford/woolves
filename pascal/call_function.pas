program call_function;
var
    mval, ret: String;


function some_function(input: String): String;
var
	val: String;
begin
    val := 'foobar';
    val := val + input;
	some_function := val;
end;


begin
   mval := 'wef';
   ret := some_function(mval);
   { omg omg omg }
   writeln('called some function and got ', ret);
end.
