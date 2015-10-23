getRandomInt = (min, max) ->
  Math.floor(Math.random() * (max - min + 1)) + min

People = new (Meteor.Collection)('people')

Template.GroupsShow.helpers
  documents: ->
    Documents.find()

# GroupsShow: Lifecycle Hooks
Template.GroupsShow.created = ->
  console.log "created", Template.GroupsShow

Template.GroupsShow.rendered = ->
  console.log "pge data", d3.csv.parse("/pge.csv")
  nv.addGraph ->
    chart = nv.models.multiBarChart()
    chart.xAxis
        .tickFormat(d3.format(',f'))
    chart.yAxis
        .tickFormat(d3.format(',.1f'))

    d3.select('#chart svg')
        .transition().duration(500)
        .call(chart)
        ;

    nv.utils.windowResize(chart.update);

    return chart;

  # chart = nv.models.multiBarChart().margin(left: 100).useInteractiveGuideline(true).transitionDuration(350).showLegend(true).showYAxis(true).showXAxis(true)
  # nv.addGraph ->
  #   chart.xAxis.axisLabel('Amount').tickFormat d3.format('d')
  #   chart.yAxis.axisLabel('Months').tickFormat d3.format('d')
  #   d3.select('#chart svg').datum([ {
  #     values: People.find().fetch()
  #     key: 'Age'
  #   } ]).call chart
  #   nv.utils.windowResize ->
  #     chart.update()
  #     return
  #   chart
  # @autorun ->
  #   d3.select('#chart svg').datum([ {
  #     values: People.find().fetch()
  #     key: 'Age'
  #   } ]).call chart
  #   chart.update()
  #   return
  # nv.utils.windowResize(chart.update);
  # return

Template.GroupsShow.destroyed = ->
