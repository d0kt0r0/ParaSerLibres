// ...para ser libres...

$(document).ready(function() {
  $(document.body).append('<div id="pslText">...esperando...</div>');
});

function edit() {
  console.log("edit");
  apertGlobalRead('pslText');
}

function apertReceivedRead(key,value) {
  console.log("apertReceivedRead");
  if(key == 'pslText') {
    $('#pslText').text(value);
  }
}

function cursor(position) {
  console.log("cursor");
}
