db.orders.mapReduce(
  function () {
    if (this.status === "P" || this.status === "p") {
      emit(this.cusid, this.amt);
    }
  },
  function (key, values) {
    return Array.sum(values);
  },
  {
    out: "output_values",
  }
);
//---------------------------------------------------------------------------------------------------------------------------

//for avg
db.orders.mapReduce(
  function () {
    emit(this.cusid, this.amt);
  },
  function (key, values) {
    return Array.avg(values);
  },
  {
    out: "output_values",
  }
);
//---------------------------------------------------------------------------------------------------------------------------

//min
db.orders.mapReduce(
  function () {
    emit(this.cusid, this.amt);
  },
  function (key, values) {
    return Math.min.apply(null, values);
  },
  {
    out: "output_values",
  }
);

or;

db.orders.mapReduce(
  function () {
    emit(this.cusid, this.amt);
  },
  function (key, values) {
    var s = values[0];
    for (var i = 0; i < values.length; i++) {
      if (values[i] < s) {
        s = values[i];
      }
    }
    return s;
  },
  {
    out: "output_values",
  }
);
//---------------------------------------------------------------------------------------------------------------------------

//max
db.orders.mapReduce(
  function () {
    emit(this.cusid, this.amt);
  },
  function (key, values) {
    return Math.max.apply(null, values);
  },
  {
    out: "output_values",
  }
);

or;

db.orders.mapReduce(
  function () {
    emit(this.cusid, this.amt);
  },
  function (key, values) {
    var s = values[0];
    for (var i = 0; i < values.length; i++) {
      if (values[i] > s) {
        s = values[i];
      }
    }
    return s;
  },
  {
    out: "output_values",
  }
);
