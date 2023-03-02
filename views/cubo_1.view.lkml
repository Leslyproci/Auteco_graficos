view: cubo_1 {
  sql_table_name: `analitica-demos.auteco.Cubo_1`
    ;;

  dimension: abc {
    type: string
    sql: ${TABLE}.ABC ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;
  }

  dimension: budget_cogs {
    type: string
    sql: ${TABLE}.Budget_COGS ;;
  }

  dimension: cog {
    type: string
    sql: ${TABLE}.COG ;;
  }

  dimension: current_dealer_price {
    type: string
    sql: ${TABLE}.Current_dealer_price ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}.Customer ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }

  dimension: fce1_sd {
    type: number
    sql: ${TABLE}.FCE1SD ;;
  }

  dimension: fob_price {
    type: number
    sql: ${TABLE}.FOB_Price ;;
  }

  dimension: gross_profit {
    type: string
    sql: ${TABLE}.GrossProfit ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.Location ;;
  }

  dimension: material {
    type: number
    sql: ${TABLE}.Material ;;
  }

  dimension: measure {
    type: string
    sql: ${TABLE}.Measure ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.Model ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.Month ;;
  }

  dimension: oem_price {
    type: number
    sql: ${TABLE}.OEM_Price ;;
  }

  dimension: revenue {
    type: string
    sql: ${TABLE}.Revenue ;;
  }

  dimension: ss {
    type: number
    sql: ${TABLE}.SS ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.Value ;;
  }

  dimension: week {
    type: string
    sql: ${TABLE}.Week ;;
  }

  dimension: yr_mth {
    type: number
    sql: ${TABLE}.YrMth ;;
  }

  dimension: yr_wk {
    type: number
    sql: ${TABLE}.YrWk ;;
  }

  dimension: z_score {
    type: string
    sql: ${TABLE}.zScore ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
