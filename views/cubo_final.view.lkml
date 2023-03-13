view: cubo_final {
  sql_table_name: `analitica-demos.auteco.cubo_final`
    ;;
############### Filtros dinamicos ##############
  parameter: Dimension_filtro {
    type: unquoted
    allowed_value: {
      value: "Brand"
    }
    allowed_value: {
      value: "Status"
    }
    allowed_value: {
      value: "Model"
    }
    allowed_value: {
      value: "Description"
    }
    allowed_value: {
      value: "Material"
    }
  }
  parameter: UOM_filtro {
    type: unquoted
    allowed_value: {
      value: "Unidades"
    }
    allowed_value: {
      value: "Revenue"
    }
    allowed_value: {
      value: "Profit"
    }
    allowed_value: {
      value: "COGS"
    }
  }
############################Variables liquidas
  dimension: Dimension {
    sql:
    {% if Dimension_filtro._parameter_value == 'Brand' %}
      ${TABLE}.Brand
    {% elsif Dimension_filtro._parameter_value == 'Status' %}
      ${TABLE}.Status
    {% elsif Dimension_filtro._parameter_value == 'Model' %}
      ${TABLE}.Model
    {% elsif Dimension_filtro._parameter_value == 'Description' %}
      ${TABLE}.Description
    {% elsif Dimension_filtro._parameter_value == 'Material' %}
      ${TABLE}.Material
    {% endif %};;
  }

  dimension: UOM {
    sql:
    {% if UOM_filtro._parameter_value == 'Unidades' %}
      ${TABLE}.Value
    {% elsif UOM_filtro._parameter_value == 'Revenue' %}
      ${TABLE}.Revenue
    {% elsif UOM_filtro._parameter_value == 'Profit' %}
      ${TABLE}.GrossProfit
    {% elsif UOM_filtro._parameter_value == 'COGS' %}
      ${TABLE}.COG
    {% endif %};;
    primary_key: yes
  }
#####################################################################
  dimension: abc {
    type: string
    sql: ${TABLE}.ABC ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;
  }

  dimension: budget_cogs {
    type: number
    sql: ${TABLE}.Budget_COGS ;;
  }

  dimension: cog {
    type: number
    sql: ${TABLE}.COG ;;
  }

  dimension: current_dealer_price {
    type: number
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
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
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
    type: number
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
    type: string
    sql: ${TABLE}.Month ;;
  }

  dimension: oem_price {
    type: number
    sql: ${TABLE}.OEM_Price ;;
  }

  dimension: revenue {
    type: number
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
    type: number
    sql: ${TABLE}.Value ;;
  }

  dimension: week {
    type: string
    sql: ${TABLE}.Week ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.Year ;;
  }

  dimension: z_score {
    type: number
    sql: ${TABLE}.zScore ;;
  }
################Dimensiones creadas
  dimension: AbsVar {
    type: number
    sql: CASE
        WHEN ${cubo_final.measure} = 'ActualArrivals' THEN ${UOM}
        ELSE 0
      END ;;
  }
  dimension: Arrivals {
    type: number
    sql: CASE
            WHEN ${cubo_final.measure} = 'ActualArrivals' THEN ${UOM}
            ELSE 0
         END ;;
  }
  dimension: CSOH {
    type: number
    sql: CASE
            WHEN ${cubo_final.measure} = 'CSOH' OR  ${cubo_final.measure} = 'PSOH' THEN ${UOM}
            ELSE 0
         END ;;
  }
  dimension: Dmd_Plan {
    type: number
    sql: CASE
            WHEN ${cubo_final.measure} = 'SalesForecast' THEN ${UOM}
            ELSE 0
         END ;;
  }
  dimension: Max {
    type: number
    sql: CASE
            WHEN ${cubo_final.measure} = 'Max' THEN ${UOM}
            ELSE 0
         END ;;
  }
  dimension: Min {
    type: number
    sql: CASE
            WHEN ${cubo_final.measure} = 'Min' THEN ${UOM}
            ELSE 0
         END ;;
  }
  dimension: Sell_In {
    type: number
    sql: CASE
            WHEN ${cubo_final.measure} = 'Sell_In' THEN ${UOM}
            ELSE 0
         END ;;
  }
  dimension: Sell_Out {
    type: number
    sql: CASE
            WHEN ${cubo_final.measure} = 'Sell_Out' THEN ${UOM}
            ELSE 0
         END ;;
  }
  dimension: Target {
    type: number
    sql: CASE
            WHEN ${cubo_final.measure} = 'Target' THEN ${UOM}
            ELSE 0
         END ;;
  }
  dimension: Stat_FC {
    type: number
    sql: CASE
            WHEN ${cubo_final.measure} = 'Forecast' THEN ${UOM}
            ELSE 0
         END ;;
  }
  ########################### Dimensiones relacionandas al mes
  dimension: LagAbsVar {
    type: number
    sql: CASE
            WHEN ${cubo_final.month} = 'January' THEN IF(${cubo_final.measure} = 'LagAbsVar_January', ${UOM}, 0)
            WHEN ${cubo_final.month} = 'February' THEN IF(${cubo_final.measure} = 'LagAbsVar_February', ${UOM}, 0)
            WHEN ${cubo_final.month} = 'March' THEN IF(${cubo_final.measure}= 'LagAbsVar_March',${UOM}, 0)
            WHEN ${cubo_final.month} = 'April' THEN IF(${cubo_final.measure} = 'LagAbsVar_April', ${UOM}, 0)
            WHEN ${cubo_final.month} = 'May' THEN IF(${cubo_final.measure} = 'LagAbsVar_May', ${UOM}, 0)
            WHEN ${cubo_final.month} = 'June' THEN IF(${cubo_final.measure} = 'LagAbsVar_June', ${UOM}, 0)
            WHEN ${cubo_final.month} = 'July' THEN IF(${cubo_final.measure} = 'LagAbsVar_July', ${UOM}, 0)
            WHEN ${cubo_final.month} = 'August' THEN IF(${cubo_final.measure} = 'LagAbsVar_August', ${UOM}, 0)
            WHEN ${cubo_final.month} = 'September' THEN IF(${cubo_final.measure} = 'LagAbsVar_Septembre', ${UOM}, 0)
            WHEN ${cubo_final.month} = 'October' THEN IF(${cubo_final.measure} = 'LagAbsVar_October', ${UOM}, 0)
            WHEN ${cubo_final.month} = 'November' THEN IF(${cubo_final.measure}= 'LagAbsVar_November', ${UOM}, 0)
            WHEN ${cubo_final.month} = 'December' THEN IF(${cubo_final.measure} = 'LagAbsVar_December', ${UOM}, 0)
          ELSE NULL
         END ;;
  }
  dimension: LagForecast {
    type: number
    sql: CASE
            WHEN ${cubo_final.month} = 'January' THEN IF(${cubo_final.measure} = 'LagForecast_January', ${UOM}, 0)
            WHEN ${cubo_final.month} = 'February' THEN IF(${cubo_final.measure} = 'LagForecast_February', ${UOM}, 0)
            WHEN ${cubo_final.month} = 'March' THEN IF(${cubo_final.measure}= 'LagForecast_March',${UOM}, 0)
            WHEN ${cubo_final.month} = 'April' THEN IF(${cubo_final.measure} = 'LagForecast_April', ${UOM}, 0)
            WHEN ${cubo_final.month} = 'May' THEN IF(${cubo_final.measure} = 'LagForecast_May', ${UOM}, 0)
            WHEN ${cubo_final.month} = 'June' THEN IF(${cubo_final.measure} = 'LagForecast_June', ${UOM}, 0)
            WHEN ${cubo_final.month} = 'July' THEN IF(${cubo_final.measure} = 'LagForecast_July', ${UOM}, 0)
            WHEN ${cubo_final.month} = 'August' THEN IF(${cubo_final.measure} = 'LagForecast_August', ${UOM}, 0)
            WHEN ${cubo_final.month} = 'September' THEN IF(${cubo_final.measure} = 'LagForecast_Septembre', ${UOM}, 0)
            WHEN ${cubo_final.month} = 'October' THEN IF(${cubo_final.measure} = 'LagForecast_October', ${UOM}, 0)
            WHEN ${cubo_final.month} = 'November' THEN IF(${cubo_final.measure}= 'LagForecast_November', ${UOM}, 0)
            WHEN ${cubo_final.month} = 'December' THEN IF(${cubo_final.measure} = 'LagForecast_December', ${UOM}, 0)
          ELSE NULL
         END ;;
  }
######################## Medidas
  measure: count {
    type: count
    drill_fields: []
  }
  measure: Acc_Lag_Forecast {
    type: number
    sql: 1 - (COALESCE(SUM(${LagAbsVar}), 0) / NULLIF(SUM(${LagForecast}), 0));;
  }
  measure: Acc_Zero_Lag {
    type: number
    sql: 1 - (COALESCE(SUM(${LagAbsVar}), 0) / NULLIF(SUM(${Stat_FC}), 0));;
  }
  measure: WOH {
    type: number
    sql: COALESCE(SUM(${CSOH}), 0) / NULLIF(SUM(${Stat_FC}), 0);;
  }
  measure: Var_Zero_Lag {
    type: number
    sql: COALESCE(SUM(${Stat_FC}), 0) - NULLIF(SUM(${Sell_Out}), 0);;
  }
  measure: Var_Lag_Forecast {
    type: number
    sql: COALESCE(SUM(${LagForecast}), 0) - NULLIF(SUM(${Sell_Out}), 0);;
  }
  measure: Mkt_Intel {
    type: number
    sql: COALESCE(SUM(${Dmd_Plan}), 0) - NULLIF(SUM(${Stat_FC}), 0);;
  }
  measure: Bias_Zero_Lag {
    type: number
    sql: COALESCE(${Var_Zero_Lag}, 0) / NULLIF(SUM(${Stat_FC}), 0);;
  }
  measure: Bias_Lag_Forecast {
    type: number
    sql: COALESCE(${Var_Lag_Forecast}, 0) / NULLIF(SUM(${LagForecast}), 0);;
  }
}
