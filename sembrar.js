var WebSocket = require('ws');
var osc = require('osc');

var url = process.argv[2];
var password = process.argv[3];
var ws = new WebSocket(url);
console.log("connecting to " + url + "...");
ws.on('open', function() { console.log("websocket connection opened"); });
ws.on('message', function() {}); // not getting anything back from apert right now

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
  if(n==0) this.text = text;
  else this.text = this.text + text;
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
  x.password = password;
  try { ws.send(JSON.stringify(x)); }
  catch(e) { console.log("ERROR: exception in websocket send for request"); }
}

var scLangPort = 57120;

udp.on('message', function(m) {
  if(m.address == "/edit") {
    if(m.args.length != 4) { console.log("ERROR: /edit must have 4 arguments"); return; }
    var ready = editFragments.cojer(m.args[0],m.args[1],m.args[2]);
    scLangPort = m.args[3];
    if(ready) {
      request({ request: 'write', key: 'pslText', value: editFragments.text });
      request({ request: 'all', name: 'edit', args: [] });
    }
  }
  else if (m.address == "/eval") {
    if(m.args.length != 4) { console.log("ERROR: /eval must have 4 arguments"); return; }
    var ready = evalFragments.cojer(m.args[0],m.args[1],m.args[2]);
    scLangPort = m.args[3];
    if(ready) request({ request: 'all', name: 'eval', args: [evalFragments.text] });
  }
  else if (m.address == "/cursor") {
    if(m.args.length != 2) { console.log("ERROR: /cursor must have 2 arguments"); return; }
    request({request: 'all', name: 'cursor', args: [m.args[0]});
    request({request: 'write', key: 'pslCursor', value: JSON.stringify(m.args[0]) });
    scLangPort = m.args[1];
  }
  else console.log("ERROR: received unrecognized OSC message");
});
