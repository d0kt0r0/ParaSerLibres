var WebSocket = require('ws');
var osc = require('osc');

var url = process.argv[2];
var ws = new WebSocket(url);
ws.on('open', function() { console.log("websocket connection opened"); });

var udp = new osc.UDPPort( { localAddress: "127.0.0.1", localPort: 8001 });
if(udp!=null) udp.open();

function request(x) {
  try { ws.send(JSON.stringify(x)); }
  catch(e) { console.log("ERROR: exception in websocket send for request"); }
}

udp.on('message', function(m) {
  if(m.address == "/read") {
    if(m.args.length != 0) { console.log("ERROR: /read must have 0 arguments"); return; }
    if(ready) request({ request: 'read', key: 'paraSerLibres' });
  }
  else console.log("ERROR: received unrecognized OSC message");
});

ws.on('message', function(m) {
  var n = JSON.parse(m);
  if(n.type == "all") {
    if(n.name == "eval") {
      if(n.args.length != 1) {
        console.log("ERROR: received all:eval with args != 1");
        return;
      }
      clumpAndSend("/eval",n.args[0]);
    }
    else console.log("ERROR: received 'all' with unrecognized name");
  }
  else if(n.type == "read") {
    if(n.key == 'paraSerLibres') {
      clumpAndSend("/edit",n.value);
    }
    else console.log("ERROR: received 'read' with unrecognized key");
  }
  else console.log("ERROR: received unrecognized/unexpected message type from apert server");
});

function clumpAndSend(address,text) {
  var i = 0;
  var count = Math.floor(text.length / 500);
  if(text.length % 500 != 0) count = count + 1;
  for(var n=0;n<count;n++) {
    var start = n*500;
    var end = start + 500;
    if(end > text.length) end = text.length;
    var toSend = text.slice(start,end);
    udp.send( { address: address, args: [n,count,toSend] },"127.0.0.1",57120);
  }
}
