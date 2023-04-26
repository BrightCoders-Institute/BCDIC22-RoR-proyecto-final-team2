document.getElementById("increment").addEventListener("click", function() {
  updateCounter("increment");
});

document.getElementById("decrement").addEventListener("click", function() {
  updateCounter("decrement");
});

function updateCounter(action) {
  const csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
  const xhr = new XMLHttpRequest();
  xhr.open("POST", `/${action}`);
  xhr.setRequestHeader("Content-Type", "application/json");
  xhr.setRequestHeader("X-CSRF-Token", csrfToken);
  xhr.onload = function() {
    if (xhr.status === 200) {
      const response = JSON.parse(xhr.response);
      document.getElementById("contador").textContent = response.value;
      document.getElementById("total").textContent = response.total_value;
      document.getElementById("total_lateral").textContent = response.total_value;
    }
  };
  xhr.send();
}
