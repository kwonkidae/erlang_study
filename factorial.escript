#!/usr/bin/env escript
%% -*- erlang -*-
%%! -smp enable -sname factorial -mnesia debug verbose
main([String]) ->
  try
    N = list_to_integer(String),
    F = fac(N),
    io:format("factorial ~w = ~w\n", [N,F])
  catch
    error:Error ->
      io:format("~p", [Error])
  end;
main(_) ->
  usage().

usage() ->
  io:format("usage: factorial integer\n"),
  halt(1).

fac(0) -> 1;
fac(N) -> N * fac(N-1).
