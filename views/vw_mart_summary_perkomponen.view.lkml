# The name of this view in Looker is "Vw Mart Summary Perkomponen"
view: vw_mart_summary_perkomponen {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `erkam.vw_mart_summary_perkomponen` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Kode Komponen" in Explore.

  dimension: kode_komponen {
    type: number
    sql: ${TABLE}.kode_komponen ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_kode_komponen {
    type: sum
    sql: ${kode_komponen} ;;  }
  measure: average_kode_komponen {
    type: average
    sql: ${kode_komponen} ;;  }

  dimension: kode_sumber_dana {
    type: string
    sql: ${TABLE}.kode_sumber_dana ;;
  }

  dimension: kotakab {
    type: string
    sql: ${TABLE}.kotakab ;;
  }

  dimension: nama_komponen {
    type: string
    sql: ${TABLE}.nama_komponen ;;
  }

  dimension: nama_madrasah {
    type: string
    sql: ${TABLE}.nama_madrasah ;;
  }

  dimension: nsm {
    type: string
    sql: ${TABLE}.nsm ;;
  }

  dimension: provinsi {
    type: string
    sql: ${TABLE}.provinsi ;;
  }

  dimension: total_dana_realisasi {
    type: number
    sql: ${TABLE}.total_dana_realisasi ;;
  }

  dimension: total_dana_rencana {
    type: number
    sql: ${TABLE}.total_dana_rencana ;;
  }
  measure: count {
    type: count
  }
}
