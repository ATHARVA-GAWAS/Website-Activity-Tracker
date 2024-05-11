let startTime = 0;

chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
  if (message.action === 'startTracking') {
    startTime = new Date().getTime();
    setInterval(() => {
      const currentTime = new Date().getTime();
      const totalTime = (currentTime - startTime) / 1000;
      chrome.runtime.sendMessage({ action: 'updateTotalTime', totalTime });
    }, 1000);
  } else if (message.action === 'stopTracking') {
    startTime = 0;
  }
});
