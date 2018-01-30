class second ( String $msg = "world" ) {
  notify {"Hello from second $msg":
      loglevel => notice,
    } 
}