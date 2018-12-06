import Chart from 'chart.js';

const chartQuality = (acidity, clean, sweetness, myLabels) => {
  var ctx = document.getElementById("show-sample-historic-chart");
  var myLabel = 'Quality test';

  var myChart = new Chart(ctx, {
      type: 'line',
      data: {
          labels: myLabels,
          datasets: [
          {
            label: 'Acidity',
            data: acidity,
            borderColor: ['#D6C9BE'],
            fill: false
          },
          {
            label: 'Clean',
            data: clean,
            borderColor: ['#004A66'],
            fill: false,
          },
          {
            label: 'Sweetness',
            data: sweetness,
            borderColor: ['#00A2FF'],
            fill: false
          }
          ]
      },
      options: {
          scales: {
              yAxes: [{
                  ticks: {
                      beginAtZero:true
                  }
              }]
          }
      }
  });
};

export { chartQuality };
