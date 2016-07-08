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
    left: "25%",
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

function cursor(pos) {
  var focus = focusNLinesAround(1,pos,pslText);
  if(focus == null) return;
  $('#popup').html(focus);
  $('#popup').animate({
    opacity: "1",
    left: "12.5%"
  } , 5000, function() {
  }).animate({
    opacity: "0",
    top: "250"
  }, 5000, function() {});
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
    var endL = targetLine + width;
    if(endL>=nlines)endL = nlines-1;
    for(var i=startLine;i<endL;i++) {
      var line = lines[i];
      output = output + line;
      if(i!=(endL-1))output = output + "<br/>";
    }
    return output;
  }
}
