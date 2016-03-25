var star_margin = {top: 20, right: 600, bottom: 30, left: 50},
	   star_width = document.getElementById("starchart").offsetWidth  - star_margin.left - star_margin.right,
       star_height = 500;  
      
    var star_color = d3.scale.category20(); 
	
    //(1)平方根比例尺  
    var radius = d3.scale.sqrt()  
        .range([0, 6]);//值域  
      
    var star_svg = d3.select("#starchart").append("svg")  
        .attr("width", star_width)  
        .attr("height", star_height)
        .attr("transform", "translate(0," + star_margin.top +")");
      
    var force = d3.layout.force()  
        .size([star_width, star_height])  
        .charge(-600)  
        .linkDistance(function(d) {
		//(2)连线是 两个圆半径之和+60+随机数 那么长   
            return radius(d.source.size) //数据源里的size就是半径  
            + radius(d.target.size) + 60 + Math.random() * 70;   
        });  
      
    d3.json("/ui/data/starchart.json", function(graph) {  
      force  
          .nodes(graph.nodes)  
          .links(graph.links)  
          .on("tick", tick)  
          .start();  
      
      var link = star_svg.selectAll(".link")  
          .data(graph.links)  
        .enter().append("g")  
        .attr("transform", "translate(0," + star_margin.top +")")
          .attr("class", "starlink");  
      
      link.append("line")  
          .style("stroke-width", function(d) { return (d.bond * 2 - 1) * 2 + "px"; });  
    //(3)只要连线大于2就加一条分隔线  
    //怎么添加多条分隔线呢？  
      link.filter(function(d) {//基于数据过滤的选择。  
            return d.bond > 1;   
       }).append("line")  
          .attr("class", "separator");//添加一条分隔线  
    //常规的添加节点  
      var node = star_svg.selectAll(".node")  
          .data(graph.nodes)  
        .enter().append("g")  
          .attr("class", "starnode")  
          .call(force.drag);  
    //常规的添加圆点  
      node.append("circle")  
          .attr("r", function(d) {   
                return radius(d.size); //(4)根据圆圈的种类的大小设置大小   
                })  
          .style("fill", function(d) {   
                return star_color(d.atom); //根据圆圈的种类设置颜色  
          });
      
      node.append("text")  
          .attr("dy", ".70em") 
          .attr("text-anchor", "middle")//在圆圈中加上数据  
          .text(function(d) { return d.atom; });  
    //常规的打点  
      function tick() {  
    	  link.selectAll("line")  
            .attr("x1", function(d) { return d.source.x; })  
            .attr("y1", function(d) { return d.source.y; })  
            .attr("x2", function(d) { return d.target.x; })  
            .attr("y2", function(d) { return d.target.y; });  
      
        node.attr("transform", function(d) {  
         return "translate(" + d.x + "," + d.y + ")";  
          });  
      }  
    });  