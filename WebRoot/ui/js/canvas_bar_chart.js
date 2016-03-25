var canvas_margin = {top: 20, right: 600, bottom: 30, left: 60},
	canvas_width = document.getElementById("canvaslinear").offsetWidth  - canvas_margin.left - canvas_margin.right,
	canvas_height = 300 - canvas_margin.top - canvas_margin.bottom;

var parseDate = d3.time.format("%d-%b-%y").parse,
    bisectDate = d3.bisector(function(d) { return d.date; }).left,
    formatValue = d3.format(",.2f"),
    formatCurrency = function(d) { return "$" + formatValue(d); };

var canvas_x = d3.time.scale()
    .range([0, canvas_width]);

var canvas_y = d3.scale.linear()
    .range([canvas_height, 0]);

var canvas_xAxis = d3.svg.axis()
    .scale(canvas_x)
    .orient("bottom");

var canvas_yAxis = d3.svg.axis()
    .scale(canvas_y)
    .orient("left");

var canvas_line = d3.svg.line()
    .x(function(d) { return canvas_x(d.date); })
    .y(function(d) { return canvas_y(d.close); });


var canvas_svg = d3.select("#canvaslinear").append("svg")
    .attr("width", canvas_width + canvas_margin.left + canvas_margin.right)
    .attr("height", canvas_height + canvas_margin.top + canvas_margin.bottom)
  .append("g")
    .attr("transform", "translate(" + canvas_margin.left + "," + canvas_margin.top + ")");

d3.tsv("/ui/data/data.tsv", function(error, data) {
  if (error) throw error;

  data.forEach(function(d) {
    d.time = d.date;
    d.date = parseDate(d.date);
    d.close = +d.close;
  });

  data.sort(function(a, b) {
    return a.date - b.date;
  });

  canvas_x.domain([data[0].date, data[data.length - 1].date]);
  canvas_y.domain(d3.extent(data, function(d) { return d.close; }));

  canvas_svg.append("g")
      .attr("class", "canaxis x")
      .attr("transform", "translate(0," + canvas_height + ")")
      .call(canvas_xAxis);

  canvas_svg.append("g")
      .attr("class", "canaxis")
      .call(canvas_yAxis)
    .append("text")
      .attr("class","canvas_text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Price ($)");

  canvas_svg.append("path")
      .datum(data)
      .attr("class", "canline")
      .attr("d", canvas_line);

  var canvas_focus = canvas_svg.append("g")
      .attr("class", "canfocus")
      .style("display", "none");
	
  canvas_focus.append("line")
  			.attr("class","canvas_line");	
	
  canvas_focus.append("text")
	  .attr("class","cantext")
      .attr("x", 9)
	  .attr("font-size","20px")
      .attr("dy", ".35em");
  

  canvas_svg.append("rect")
      .attr("class", "canoverlay")
      .attr("width", canvas_width)
      .attr("height", canvas_height)
      .on("mouseover", function() { canvas_focus.style("display", null); })
      .on("mouseout", function() { canvas_focus.style("display", "none"); })
      .on("mousemove", mousemove);

  function mousemove() {
    var x0 = canvas_x.invert(d3.mouse(this)[0]),
		 i = bisectDate(data, x0, 1),
        d0 = data[i - 1],
        d1 = data[i],
        d = x0 - d0.date > d1.date - x0 ? d1 : d0;
        canvas_focus.attr("transform", "translate(" + canvas_x(d.date)  + "," + 0.3*(2*canvas_height - d.close) + ")");
        canvas_focus.select(".cantext").text(d.time + "：" + formatCurrency(d.close));
        canvas_focus.select(".canvas_line").attr("stroke","rgba(0,0,0,0.2)").attr("stroke-width","2")
	.attr("x1",d.date).attr("x2",d.date).attr("y1","-200").attr("y2","250");
  }
});