# The name of this view in Looker is "Nsp Test"
view: nsp_test {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `erkam.NSP_test` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Nsm" in Explore.

  dimension: nsm {
    type: string
    sql: ${TABLE}.NSM ;;
  }

  dimension: realisasi_belanja {
    type: number
    sql: ${TABLE}.realisasi_belanja ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_realisasi_belanja {
    type: sum
    sql: ${realisasi_belanja} ;;  }
  measure: average_realisasi_belanja {
    type: average
    sql: ${realisasi_belanja} ;;  }

  dimension: rencana_belanja {
    type: number
    sql: ${TABLE}.rencana_belanja ;;
  }

  dimension: snp {
    type: string
    sql: ${TABLE}.SNP ;;
  }
  measure: count {
    type: count
  }
}
