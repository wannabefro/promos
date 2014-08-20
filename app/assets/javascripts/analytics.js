function makeMap(data) {
  var map = new AmCharts.AmMap();
  map.pathToImages = "../assets/am/";
  var dataProvider = {
    map: "worldLow",
    areas: JSON.parse(data)
  }
  map.dataProvider = dataProvider;
  map.areasSettings = {
    autoZoom: true,
    selectedColor: "#CC0000"
  };
  map.write('graphic');
}

function makeDates(data) {
  var chart = new AmCharts.AmStockChart();
  data = JSON.parse(data);
  chart.dataDateFormat = "MM-DD-YYYY"
  chart.pathToImages = "../assets/am";

  var dataSet = new AmCharts.DataSet();
  dataSet.dataProvider = data;
  dataSet.fieldMappings = [{fromField:"val", toField:"value"}];   
  dataSet.categoryField = "date";
  chart.dataSets = [dataSet];

  var stockPanel = new AmCharts.StockPanel();
  chart.panels = [stockPanel];

  var panelsSettings = new AmCharts.PanelsSettings();
  panelsSettings.startDuration = 1;
  chart.panelsSettings = panelsSettings;   

  var graph = new AmCharts.StockGraph();
  graph.valueField = "value";
  graph.type = "column";
  graph.fillAlphas = 1;
  graph.title = "Redemptions by date"; 
  stockPanel.addStockGraph(graph);

  var chartScrollbarSettings = new AmCharts.ChartScrollbarSettings();
  chartScrollbarSettings.graph = graph;
  chartScrollbarSettings.graphType = "line";
  chart.chartScrollbarSettings = chartScrollbarSettings;

  var legend = new AmCharts.StockLegend();
  stockPanel.stockLegend = legend;

  var periodSelector = new AmCharts.PeriodSelector();
  chart.periodSelector = periodSelector;
  periodSelector.periods = [
    {period:"DD", count:1, label:"1 day"}, 
    {period:"DD", selected:true, count:5, label:"5 days"},
    {period:"MM", count:1, label:"1 month"},
    {period:"YYYY", count:1, label:"1 year"},
    {period:"YTD", label:"YTD"},
    {period:"MAX", label:"MAX"}
  ];

  chart.write("graphic");
}
