let tracking = false;

document.getElementById('trackButton').addEventListener('click', () => {
  if (!tracking) {
    startTracking();
  } else {
    stopTracking();
  }
});

function startTracking() {
  tracking = true;
  chrome.runtime.sendMessage({ action: 'startTracking' });
  document.getElementById('trackButton').innerText = 'Stop Tracking';
}

function stopTracking() {
  tracking = false;
  chrome.runtime.sendMessage({ action: 'stopTracking' });
  document.getElementById('trackButton').innerText = 'Start Tracking';
}

chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
  if (message.action === 'updateTotalTime') {
    document.getElementById('totalTime').innerText = `Total time spent: ${message.totalTime} seconds`;
  }
});
