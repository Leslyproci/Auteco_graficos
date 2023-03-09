view: uom_t {
  derived_table: {
    explore_source: cubo_final {
      column: revenue {}
      column: value {}
      column: gross_profit {}
      column: cog {}
    }
  }
  dimension: revenue {
    type: number
  }
  dimension: value {
    type: number
  }
  dimension: gross_profit {
    type: number
  }
  dimension: cog {
    type: number
  }
}
