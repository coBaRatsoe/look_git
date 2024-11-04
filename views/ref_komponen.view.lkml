# The name of this view in Looker is "Ref Komponen"
view: ref_komponen {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `erkam.ref_komponen` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Created By" in Explore.

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension: kode {
    type: number
    sql: ${TABLE}.kode ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_kode {
    type: sum
    sql: ${kode} ;;  }
  measure: average_kode {
    type: average
    sql: ${kode} ;;  }

  dimension: nama {
    type: string
    sql: ${TABLE}.nama ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: updated_by {
    type: string
    sql: ${TABLE}.updated_by ;;
  }
  measure: count {
    type: count
  }
}
