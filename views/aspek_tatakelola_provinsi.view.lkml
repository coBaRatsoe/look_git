# The name of this view in Looker is "Aspek Tatakelola Provinsi"
view: aspek_tatakelola_provinsi {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi-dashboard-dev.report_kinerja_madrasah.aspek_tatakelola_provinsi` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Avg Aspek A" in Explore.

  dimension: avg_aspek_a {
    type: number
    sql: ${TABLE}.avg_aspek_a ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_avg_aspek_a {
    type: sum
    sql: ${avg_aspek_a} ;;  }
  measure: average_avg_aspek_a {
    type: average
    sql: ${avg_aspek_a} ;;  }

  dimension: avg_aspek_b {
    type: number
    sql: ${TABLE}.avg_aspek_b ;;
  }

  dimension: avg_aspek_c {
    type: number
    sql: ${TABLE}.avg_aspek_c ;;
  }

  dimension: avg_aspek_d {
    type: number
    sql: ${TABLE}.avg_aspek_d ;;
  }

  dimension: avg_aspek_e {
    type: number
    sql: ${TABLE}.avg_aspek_e ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: kode_provinsi {
    type: string
    sql: ${TABLE}.kode_provinsi ;;
  }

  dimension: provinsi {
    type: string
    sql: ${TABLE}.provinsi ;;
  }

  dimension: tahun {
    type: string
    sql: ${TABLE}.tahun ;;
  }
  measure: count {
    type: count
  }
}
