module main 

import os
import net
import vweb

const port = 9000

struct App {
    vweb.Context
}

fn main () {
   setting := vweb.RunParams{'0.0.0.0', port, net.AddrFamily.ip} 
   vweb.run_at(&App{}, setting) or { panic(err.msg())}
}

pub fn (mut app App) index() vweb.Result {
    uname := os.uname()
    return app.json(uname)	
}

