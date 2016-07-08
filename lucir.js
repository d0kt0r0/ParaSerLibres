// ...para ser libres...

$(document).ready(function() {
  $(document.body).append('<div id="outer"><div id="popup"></div><div id="code">...esperando...</div></div>');
  $(document.body).css({
    backgroundColor: "black"
  });
  $('#code').css({
    fontSize: "0.95vh",
    color: "green",
    columnCount: "4",
    columnGap: "5px"
  });
  $('#popup').css({
    zIndex: "1000",
    color: "white",
    position: "absolute",
    fontSize: "5vh",
    opacity: "0",
    width: "75%",
    left: "12.5%",
    top: "20%"
  });
});

function apertWebSocketOpened() {
  edit();
}

function edit() {
  apertGlobalRead('pslText');
}

function apertReceivedRead(key,value) {
  if(key == 'pslText') {
    // console.log("received pslText");
    pslText = value;
    var value = (value + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1'+ '<br/>' +'$2');
    $('#code').html(value);
  }
}

var focusState = 0; // 0 = nothing, 1 = fade-in, 2 = hold, 3 = fade-out

function changeFocusState(n) {
  focusState = n;
  if(n == 0) {
    $('#popup').animate({ opacity: "0"}, 100, function() {});
  }
  else if(n == 1) {
    $('#popup').stop(true); // so that reattack before fade is finished starts right away
    $('#popup').animate({ opacity: "1" }, 5000, function() {
      changeFocusState(2);
    });
  }
  else if(n == 2) {
    $('#popup').stop(true); // so that repeated changes to state 2 don't accumulate time
    $('#popup').animate({ opacity: "1"}, 20000, function() {
      changeFocusState(3);
    });
  }
  else if(n == 3) {
    $('#popup').animate({ opacity: "0"}, 20000, function() {
      changeFocusState(0);
    });
  }
}

var lastFocusEvent = (new Date()).getTime();

setInterval(function() {
  if(lastFocusEvent == null || pslText == null) return;
  var d = new Date();
  var now = d.getTime();
  if(now - lastFocusEvent > 46000) {
    // if no events in last 46 seconds
    // simulate a cursor event at a random position in the code
    cursor(Math.floor(Math.random()*pslText.length));
  }
},10000);

function focusEvent() {
  var d = new Date();
  var lastFocusEvent = d.getTime();
  if(focusState == 0) changeFocusState(1);
  else if(focusState == 1) return;
  else if(focusState == 2) changeFocusState(2);
  else if(focusState == 3) changeFocusState(1);
}

function cursor(pos) {
  var focus = focusNLinesAround(1,pos,pslText);
  if(focus == null) return;
  $('#popup').html(focus);
  focusEvent();
}

function focusNLinesAround(width,pos,t) {
  if(pos >= t.length) {
    console.log("ERROR: cursor position beyond length of text");
    return null;
  }
  var lines = t.split("\n");
  var nlines = lines.length;
  var i,ii=0;
  var targetLine;
  for (i in lines) {
    var endOfLinePos = ii + lines[i].length;
    if(ii < pos && pos < endOfLinePos) {
      targetLine = i;
      break;
    }
    ii = endOfLinePos;
  }
  if(targetLine != null) {
    targetLine = parseInt(targetLine);
    var output = "";
    var startLine = targetLine - width;
    if(startLine<0)startLine = 0;
    var endL = targetLine + width + 1;
    if(endL>=nlines)endL = nlines-1;
    for(var i=startLine;i<endL;i++) {
      var line = lines[i];
      output = output + line;
      if(i!=(endL-1))output = output + "<br/>";
    }
    return output;
  }
}
