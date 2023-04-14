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
      const counter = JSON.parse(xhr.response);
      document.getElementById("contador").textContent = counter.value;
    }
  };
  xhr.send();
}
