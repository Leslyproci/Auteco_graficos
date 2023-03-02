view: tabla_grafico_mes {
  sql_table_name: `auteco.Tabla_grafico_mes`
    ;;

  dimension: actual_arrivals {
    type: number
    sql: ${TABLE}.ActualArrivals ;;
  }

  dimension: csoh {
    type: number
    sql: ${TABLE}.CSOH ;;
  }

  dimension: est_requested_arrivals {
    type: number
    sql: ${TABLE}.Est_RequestedArrivals ;;
  }

  dimension: forecast {
    type: number
    sql: ${TABLE}.Forecast ;;
  }

  dimension: lag_forecast {
    type: string
    sql: ${TABLE}.LagForecast ;;
  }

  dimension: lag_forecast_16 {
    type: number
    sql: ${TABLE}.LagForecast_16 ;;
  }

  dimension: max {
    type: number
    sql: ${TABLE}.Max ;;
  }

  dimension: min {
    type: number
    sql: ${TABLE}.Min ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.Month ;;
  }

  dimension: mes {
    type: number
    sql: ${TABLE}.Month ;;
  }

  dimension: number_week {
    type: string
    sql: ${TABLE}.Number_week ;;
  }

  dimension: psoh {
    type: number
    sql: ${TABLE}.PSOH ;;
  }

  dimension: requested_arrivals {
    type: number
    sql: ${TABLE}.RequestedArrivals ;;
  }

  dimension: sales_forecast {
    type: number
    sql: ${TABLE}.SalesForecast ;;
  }

  dimension: sales_forecast_15 {
    type: number
    sql: ${TABLE}.SalesForecast_15 ;;
  }

  dimension: sell_in {
    type: number
    sql: ${TABLE}.Sell_In ;;
  }

  dimension: sell_out {
    type: number
    sql: ${TABLE}.Sell_Out ;;
  }

  dimension: target {
    type: number
    sql: ${TABLE}.Target ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
