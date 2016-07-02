var WebSocket = require('ws');
var osc = require('osc');

var url = process.argv[2];
console.log("opening websocket connection to " + url);
var ws = new WebSocket(url);
var wsReady = false;
ws.on('open', function() {
  wsReady = true;
  console.log("websocket connection opened");
});

var udp = new osc.UDPPort( { localAddress: "127.0.0.1", localPort: 8001 });
if(udp!=null) udp.open();

function request(x) {
  if(wsReady) {
    try { ws.send(JSON.stringify(x)); }
    catch(e) { console.log("ERROR: exception in websocket send for request"); }
  }
}

var scLangPort = 57120;

udp.on('message', function(m) {
  if(m.address == "/read") {
    scLangPort = m.args[0];
    request({ request: 'read', key: 'pslText' });
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
    else if (n.name == "edit") {
      request({ request: 'read', key: 'pslText' });
    }
    else if (n.name == "cursor") {
      if(n.args.length != 1) {
        console.log("ERROR: received cursor with args != 1");
        return;
      }
      udp.send( { address: "/cursor", args: [n.args[0]] },"127.0.0.1",scLangPort);
    }
    else console.log("ERROR: received 'all' with unrecognized name");
  }
  else if(n.type == "read") {
    if(n.key == 'pslText') {
      clumpAndSend("/edit",n.value);
    }
    if(n.key == 'pslCursor') {
      // silently ignore pslCursor values
      // not that they would be received anyway
      // since they haven't been requested
    }
    else console.log("ERROR: received 'read' with unrecognized key");
  }
  else if(n.type == "clientCount" || n.type == "refreshCount") {
    // silently ignore these apert messages
  }
  else {
    console.log("ERROR: received unrecognized/unexpected message type (" + n.type + ") from apert server");
  }
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
    udp.send( { address: address, args: [n,count,toSend] },"127.0.0.1",scLangPort);
  }
}
