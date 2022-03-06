document.addEventListener('turbolinks:load', function() {
  var countdown = document.querySelector('.countdown');

  if (countdown) {
    var timeLeft = countdown.dataset.timeLeft

    Timer(timeLeft)

  }

  function Timer(time) {

      let timePassed = 0;
      let timeLeft = time;



    let timeInterval = setInterval(() => {

        timePassed += 1;
        timeLeft = time - timePassed;

        let minutes = Math.floor(timeLeft / 60)
        let seconds = Math.floor(timeLeft % 60)

        document.querySelector('.countdown').innerHTML = minutes + "m " + seconds + "s";

        if (timeLeft <= 0) {
        clearInterval(timeInterval);
        document.getElementById("submit-form").click()
      }
        
      }, 1000);
  }
})