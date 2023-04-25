function togglePopup(containerId, displayValue) {
  var container = document.getElementById(containerId);
  container.style.display = displayValue;
}

document.getElementById('open-popup-pago').addEventListener('click', function() {
  togglePopup('popup-container-pago', 'flex');
});

document.getElementById('close-popup-pago-x').addEventListener('click', function() {
  togglePopup('popup-container-pago', 'none');
});

document.getElementById('close-popup-pago-button').addEventListener('click', function() {
  togglePopup('popup-container-pago', 'none');
});

document.getElementById('open-popup-limpiar').addEventListener('click', function() {
  togglePopup('popup-container-limpiar', 'flex');
});

document.getElementById('close-popup-limpiar-x').addEventListener('click', function() {
  togglePopup('popup-container-limpiar', 'none');
});

document.getElementById('close-popup-limpiar-button').addEventListener('click', function() {
  togglePopup('popup-container-limpiar', 'none');
});
