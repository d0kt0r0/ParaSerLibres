// ...para ser libres...

$(document).ready(function() {
  $(document.body).append('<div id="code">...esperando...</pre></div>');
  $(document.body).css({
    background-color: "black"
  });
  $('#code').css({
    font-size: "0.95vh",
    color: "green",
//    -webkit-column-count: "4",
//    -webkit-column-gap: "5px",
//    -moz-column-count: "4",
//    -moz-column-gap: "5px",
    column-count: "4",
    column-gap: "5px"
});

function apertWebSocketOpened() {
  edit();
}

function edit() {
  apertGlobalRead('pslText');
}

function apertReceivedRead(key,value) {
  console.log("apertReceivedRead");
  if(key == 'pslText') {
    value = (value + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1'+ '<br/>' +'$2');
    $('#code.inner').replaceWith(value);
  }
}

function cursor(position) {
  console.log("cursor");
}
