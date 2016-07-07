// ...para ser libres...

$(document).ready(function() {
  $(document.body).append('<div id="code">...esperando...</div>');
  $(document.body).css({
    backgroundColor: "black"
  });
  $('#code').css({
    fontSize: "0.95vh",
    color: "green",
    columnCount: "4",
    columnGap: "5px"
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
    console.log("received pslText");
    value = (value + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1'+ '<br/>' +'$2');
    $('#code.inner').replaceWith(value);
  }
}

function cursor(position) {
  console.log("cursor");
}
