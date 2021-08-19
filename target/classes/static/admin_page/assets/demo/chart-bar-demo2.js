// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Bar Chart Example
var ctx = document.getElementById("myBarChart_2");
var myLineChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ["10일", "11일", "12일", "13일", "14일", "15일", "16일"],
    datasets: [{
      label: "Revenue",
      backgroundColor: "#ff9935",
      borderColor: "#ff9935",
      data: [4215, 5312, 6251, 7841, 9821, 7030, 13000],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'month'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 15000,
          maxTicksLimit: 5
        },
        gridLines: {
          display: true
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
