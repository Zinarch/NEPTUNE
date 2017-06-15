%%% Damn thing doesn't work.... YET!

-module(testReceiver). 

-export([handleConn/1, loop/1, handle/1, response/1]).

handleConn(Port) ->
	spawn(fun () -> {ok, Sock} = gen_tcp:listen(Port, [{active, false}]), 
                    loop(Sock) end).
					
loop(Sock) ->
	{ok, Conn} = gen_tcp:accept(Sock),
	Handler = spawn(fun() -> handle(Conn) end),
	gen_tcp:controlling_process(Conn, Handler),
	loop(Sock).
	
handle(Conn) ->
	gen_tcp:send(Conn, response("Connection Aquired")),
	gen_tcp:close(Conn).
	
response(Str) ->
	B = iolist_to_binary(Str),
	iolist_to_binary(
	io_lib:fwrite(
		"HTTP/1.0.200 OK\nContent-Type: text/html\nContent-Length: ~p\n\n~s",
		[size(B),B])).