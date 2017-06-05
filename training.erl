-module(training).

-export([add/2, hello/0, greet_and_add_two/1, greet/2, same/2, valid_time/1, old_enough/1, wrong_age/1]).

add(A,B) ->
	 A + B.

%% Shows greetings.
%% io:format/1 is the standard function used to output text.
hello() -> 
	io:format("Hello world!~n").

greet_and_add_two(X) -> % Use of nested functions.
	hello(),
	add(X,2).

greet(male, Name) ->
	io:format("Hello, Mr. ~s!",[Name]);
greet(female, Name) ->
	io:format("Hello, Ms. ~s!",[Name]);
greet(_,Name) ->
	io:format("Hello, ~s!",[Name]).

same(X,X) ->
	true;
same(_,_) ->
	false.

valid_time({Date = {Y,M,D}, Time = {H,Min,S}}) ->
	io:format("The Date tuple (~p) says today is: ~p/~p/~p, ~n",[Date,Y,M,D]),
	io:format("The tme tuple (~p) idicates: ~p:~p:~p.~n", [Time,H,Min,S]);
valid_time(_) ->
	io:format("Stop feeding me wrong data!~n").

old_enough(X) when X >= 18, X =< 105 -> 
	true;
old_enough(_) ->
	false. 

wrong_age(X) when X > 16; X > 105 ->
	true;
wrong_age(_) ->
	false.

