var WebSocket = require('ws');
var osc = require('osc');

var url = process.argv[2];
var ws = new WebSocket(url);
console.log("connecting to " + url + "...");
ws.on('open', function() { console.log("websocket connection opened"); });
ws.on('message', function() { console.log("message received on websocket"); });

var udp = new osc.UDPPort( { localAddress: "127.0.0.1", localPort: 8000 });
if(udp!=null) udp.open();

var FragmentCollector = function() {
  this.expected = 0;
}

FragmentCollector.prototype.cojer = function (n,count,text) {
  if(n != this.expected) {
    console.log("ERROR: received text fragment out of sequence");
    this.expected = 0;
    this.text = null;
    return;
  }
  if(n==0) this.text = t;
  else this.text = this.text + t;
  if(n<(count-1)) {
    // still more fragments to come
    this.expected = n+1;
    return false;
  }
  else {
    // text is completed
    this.expected = 0;
    return true;
  }
}

var editFragments = new FragmentCollector();
var evalFragments = new FragmentCollector();

function request(x) {
  x.password = process.argv[1];
  try { ws.send(JSON.stringify(x)); }
  catch(e) { console.log("ERROR: exception in websocket send for request"); }
}

udp.on('message', function(m) {
  if(m.address == "/edit") {
    if(m.args.length != 3) { console.log("ERROR: /edit must have 3 arguments"); return; }
    var ready = editFragments.cojer(m.args[0],m.args[1],m.args[2]);
    if(ready) request({ request: 'write', key: 'paraSembrarLibres', value: editFragments.text });
  }
  else if (m.address == "/eval") {
    if(m.args.length != 3) { console.log("ERROR: /eval must have 3 arguments"); return; }
    var ready = evalFragments.cojer(m.args[0],m.args[1],m.args[2]);
    if(ready) request({ request: 'all', name: 'eval', args: [evalFragments.text] });
  }
  else console.log("ERROR: received unrecognized OSC message");
});
