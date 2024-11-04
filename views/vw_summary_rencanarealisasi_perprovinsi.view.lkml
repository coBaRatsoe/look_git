# The name of this view in Looker is "Vw Summary Rencanarealisasi Perprovinsi"
view: vw_summary_rencanarealisasi_perprovinsi {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `erkam.vw_summary_rencanarealisasi_perprovinsi` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Kode Sumber Dana" in Explore.

  dimension: kode_sumber_dana {
    type: string
    sql: ${TABLE}.kode_sumber_dana ;;
  }

  dimension: provinsi {
    type: string
    sql: ${TABLE}.provinsi ;;
  }

  dimension: tahun_realisasi {
    type: number
    sql: ${TABLE}.tahun_realisasi ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_tahun_realisasi {
    type: sum
    sql: ${tahun_realisasi} ;;  }
  measure: average_tahun_realisasi {
    type: average
    sql: ${tahun_realisasi} ;;  }

  dimension: tahun_rencana {
    type: number
    sql: ${TABLE}.tahun_rencana ;;
  }

  dimension: total_dana_bantuan {
    type: number
    sql: ${TABLE}.total_dana_bantuan ;;
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
