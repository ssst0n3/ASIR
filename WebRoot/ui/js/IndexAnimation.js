var width = 1200,
    height = 550;

var nodes = d3.range(50).map(function() { return {radius: Math.random() * 12 + 4}; }),
    root = nodes[0];

root.radius = 0;
root.fixed = true;

var force = d3.layout.force()
    .gravity(0.03)
    .charge(function(d, i) { return i ? -150 : -2000; })
    .nodes(nodes)
    .size([width, height]);

force.start();

var canvas = d3.select("body").append("canvas")
    .attr("width", width)
    .attr("height", height);

var context = canvas.node().getContext("2d");


force.on("tick", function(e) {
  var q = d3.geom.quadtree(nodes),
      i,
      d,
      n = nodes.length;

  for (i = 1; i < n; ++i) q.visit(collide(nodes[i]));

  context.clearRect(0, 0, width, height);
  context.fillStyle = "rgba(255,218,185,0.5)";
  context.beginPath();
  for (i = 1; i < n; ++i) {
    d = nodes[i];
    context.moveTo(d.x, d.y);
    context.arc(d.x, d.y, d.radius, 0, 2 * Math.PI);
  }
  context.fill();
});

canvas.on("mousemove", function() {
  var p1 = d3.mouse(this);
  root.px = p1[0];
  root.py = p1[1];
  force.resume();
});

function collide(node) {
  var r = node.radius + 160,
      nx1 = node.x - r,
      nx2 = node.x + r,
      ny1 = node.y - r,
      ny2 = node.y + r;
  return function(quad, x1, y1, x2, y2) {
    if (quad.point && (quad.point !== node)) {
      var x = node.x - quad.point.x,
          y = node.y - quad.point.y,
          l = Math.sqrt(x * x + y * y),
          r = node.radius + quad.point.radius;
      if (l < r) {
        l = (l - r) / l * .5;
        node.x -= x *= l;
        node.y -= y *= l;
        quad.point.x += x;
        quad.point.y += y;
      }
    }
    return x1 > nx2 || x2 < nx1 || y1 > ny2 || y2 < ny1;
  };
}