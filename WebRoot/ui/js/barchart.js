			var bar_margin = {top: 20, right: 600, bottom: 30, left: 60},
				bar_width = document.getElementById("barchart").offsetWidth  - bar_margin.left - bar_margin.right,
				bar_height = 300 - bar_margin.top - bar_margin.bottom;

			var bar_x = d3.scale.ordinal()
				.rangeRoundBands([0, bar_width], .1);

			var bar_y = d3.scale.linear()
				.range([bar_height, 0]);

			var bar_xAxis = d3.svg.axis()
				.scale(bar_x)
				.orient("bottom");

			var bar_yAxis = d3.svg.axis()
				.scale(bar_y)
				.orient("left")
				.ticks(10);

			var bar_svg = d3.select("#barchart").append("svg")
				.attr("width", bar_width + bar_margin.left + bar_margin.right)
				.attr("height", bar_height + bar_margin.top + bar_margin.bottom)
			  .append("g")
				.attr("transform", "translate(" + bar_margin.left + "," + bar_margin.top + ")");

			d3.csv("/ui/data/YearNumber.csv", bar_type, function(error, data) {
			  if (error) throw error;

			  bar_x.domain(data.map(function(d) { return d.year; }));
			  bar_y.domain([0, d3.max(data, function(d) { return d.amount; })]);

			  bar_svg.append("g")
				  .attr("class", "x axis")
				  .attr("transform", "translate(0," + bar_height + ")")
				  .call(bar_xAxis);

			  bar_svg.append("g")
				  .attr("class", "y axis")
				  .call(bar_yAxis)
				.append("text")
				  .attr("transform", "rotate(-90)")
				  .attr("y", 6)
				  .attr("dy", ".71em")
				  .style("text-anchor", "end")
				  .text("Frequency");
				  

				bar_svg.selectAll("rect")
								.data(data)
							.enter()
							.append("text")
							.text(function(d) { return d.amount;})
							.attr("font-size", "10px")
							.attr("font-family", "sans-serif")
							.attr("text-anchor", "middle")
							.attr("x", function(d,i) { return i*(bar_width / data.length) + 15; })
							.attr("y", function(d) { return bar_y(d.amount) - 5 ;})

							
			  bar_svg.selectAll(".bar")
				  .data(data)
				.enter().append("rect")
				  .attr("class", "bar")
				  .attr("x", function(d) { return bar_x(d.year); })
				  .attr("width", bar_x.rangeBand())
				  .attr("y", function(d) { return bar_y(d.amount); })
				  .attr("height", function(d) { return bar_height - bar_y(d.amount); })
				  .on("mouseover", function(d) {
								//Get this bar's x/y values, then augment for the tooltip
								var xPosition = parseFloat(d3.select(this).attr("x")) + bar_x.rangeBand() / 2;
								var yPosition = parseFloat(d3.select(this).attr("y")) / 2 + bar_height / 2;
								//Update the tooltip position and value
								d3.select("#tooltip")
									.style("left", xPosition + "px")
									.style("top", yPosition + "px")
									.select("#time").text( + d.year + "年的文章数目为：")
									.select("#value").text( + d.amount + "篇");
								//Show the tooltip
								d3.select("#tooltip").classed("hidden", false);
						   })
					.on("mouseout", function() {
								//Hide the tooltip
								d3.select("#tooltip").classed("hidden", true);
					});
			
			
			
	});
	
	
			function bar_type(d) {
			  d.amount = +d.amount;
			  return d;
			}