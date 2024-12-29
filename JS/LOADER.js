document.addEventListener("DOMContentLoaded", () => {
    const loader = document.getElementById('loader');
  
   
    const simulateDelay = () => {
      loader.style.display = 'block'; 
      setTimeout(() => {
        loader.style.display = 'none'; 
      }, 5000); 
    };
  
   
    if (navigator.connection) {
      const connection = navigator.connection;
      if (connection.downlink < 1 || connection.saveData) {
        simulateDelay();
      }
    }
  
   
    const timeout = setTimeout(() => {
      loader.style.display = 'block';
    }, 2000); 
  
    window.onload = () => {
      clearTimeout(timeout);
      loader.style.display = 'none'; 
    };
  });
  