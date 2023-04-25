function togglePopup(containerId, displayValue) {
  let container = document.getElementById(containerId);
  container.style.display = displayValue;
}

function setupPopupListeners(popupId, containerId) {
  document.getElementById(`open-popup-${popupId}`).addEventListener('click', function() {
    togglePopup(`popup-container-${containerId}`, 'flex');
  });
  document.getElementById(`close-popup-${popupId}-x`).addEventListener('click', function() {
    togglePopup(`popup-container-${containerId}`, 'none');
  });
  document.getElementById(`close-popup-${popupId}-button`).addEventListener('click', function() {
    togglePopup(`popup-container-${containerId}`, 'none');
  });
}

setupPopupListeners('pago', 'pago');

setupPopupListeners('limpiar', 'limpiar');

