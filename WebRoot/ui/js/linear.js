var linear_margin = {top: 20, right: 600, bottom: 30, left: 60},
	linear_width = document.getElementById("multilinear").offsetWidth  - linear_margin.left - linear_margin.right,
    linear_height = 300 - linear_margin.top - linear_margin.bottom;

var linear_parseDate = d3.time.format("%Y").parse;

var linear_x = d3.time.scale()
    .range([0, linear_width]);

var linear_y = d3.scale.linear()
    .range([linear_height, 0]);

var linear_color = d3.scale.category20();

var linear_xAxis = d3.svg.axis()
    .scale(linear_x)
    .orient("bottom");

var linear_yAxis = d3.svg.axis()
    .scale(linear_y)
    .orient("left");

var linear_line = d3.svg.line()
    .interpolate("basis")
    .x(function(d) { return linear_x(d.date); })
    .y(function(d) { return linear_y(d.information); });

var linear_svg = d3.select("#multilinear").append("svg")
    .attr("width", linear_width + linear_margin.left + linear_margin.right)
    .attr("height", linear_height + linear_margin.top + linear_margin.bottom)
  .append("g")
    .attr("transform", "translate(" + linear_margin.left + "," + linear_margin.top + ")");
	
		

d3.csv("/ui/data/trends.csv", function(error, data) {
  if (error) throw error;

  linear_color.domain(d3.keys(data[0]).filter(function(key) { return key !== "date"; }));

  data.forEach(function(d) {
    d.date = linear_parseDate(d.date);
  });

  var info = linear_color.domain().map(function(name) {
    return {
      name: name,
      values: data.map(function(d) {
        return {date: d.date, information: +d[name]};
      })
    };
  });

  linear_x.domain(d3.extent(data, function(d) { return d.date; }));

  linear_y.domain([
    d3.min(info, function(c) { return d3.min(c.values, function(v) { return v.information; }); }),
    d3.max(info, function(c) { return d3.max(c.values, function(v) { return v.information; }); })
  ]);

  linear_svg.append("g")
      .attr("class", "linearaxis x")
      .attr("transform", "translate(0," + linear_height + ")")
      .call(linear_xAxis);

  linear_svg.append("g")
      .attr("class", "linearaxis")
      .call(linear_yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("各文献数目");

  var linear_dataset = linear_svg.selectAll(".dataset")
      .data(info)
    .enter().append("g")
      .attr("class", "linear_dataset");

  linear_dataset.append("path")
      .attr("class", "linearline")
      .attr("d", function(d) { return linear_line(d.values); })
      .style("stroke", function(d) { return linear_color(d.name); });

  linear_dataset.append("text")
      .datum(function(d) { return {name: d.name, value: d.values[d.values.length - 1]}; })
      .attr("transform", function(d) { return "translate(" + linear_x(d.value.date) + "," + linear_y(d.value.information) + ")"; })
      .attr("x", 3)
      .attr("dy", ".35em")
      .text(function(d) { return d.name; });
	  
});