var Pie_margin = {top: 10, right: 20, bottom: 20, left: 20},
Pie_width = document.getElementById("pie").offsetWidth  - Pie_margin.left - Pie_margin.right,
Pie_height = 300 - Pie_margin.top - Pie_margin.bottom;
Pie_radius = Math.min(Pie_width, Pie_height) / 2;

var 	Pie_color = d3.scale.ordinal()
					.range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56","#EE9572","#FFAEB9", "#d0743c", "#ff8c00","#6CA6CD","#8B658B","#FF8247","#FFEC8B"," 	#A2CD5A","#FF7256","#9370DB","#FFC1C1"]);

var 	Pie_arc = d3.svg.arc()
					.outerRadius(Pie_radius - 10)
					.innerRadius(0);

var pie = d3.layout.pie()
    .sort(null)
    .value(function(d) { return d.amount; });

var Pie_svg = d3.select("#pie")
				.append("svg")
					.attr("width", Pie_width)
					.attr("height", Pie_height)
				.append("g")
					.attr("transform", "translate(" + Pie_width / 2 + "," + Pie_height / 2 + ")");
					
					
d3.csv("/ui/data/source.csv", function(error, data) {

		 data.forEach(function(d) {
			d.amount = +d.amount;
		  });

		  var g = Pie_svg.selectAll(".piearc")
			  .data(pie(data))
			.enter().append("g")
			  .attr("class", "piearc");
		  
		  var pieText = Pie_svg.append("g")
		  										.style("display","none");
		  
				  pieText.append("text")
				  	.attr("class","pie_tooltips")
				  	.attr("font-size","15px");

		  g.append("path")
			  .attr("d", Pie_arc)
			  .style("fill", function(d) { return Pie_color(d.data.Title); })
			  .on("mouseover", function(d) {
								//Get this bar's x/y values, then augment for the tooltip
								var xPosition = parseFloat(d3.select(this).attr("x")) ;
								var yPosition = parseFloat(d3.select(this).attr("y")) ;
								//Update the tooltip position and value
								pieText.style("display",null);
								pieText.attr("transform", "translate( " + xPosition + 20 + "," + yPosition + 10 + ")");
								pieText.select(".pie_tooltips").text(d.data.Title+ ",\n\b数目为：" +d.data.amount);
						   })
				.on("mouseout",function() { pieText.style("display", "none"); })


});

