# The name of this view in Looker is "Vw Summary Rencanarealisasi Pernsm"
view: vw_summary_rencanarealisasi_pernsm {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `erkam.vw_summary_rencanarealisasi_pernsm` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Kode Sumber Dana" in Explore.

  dimension: kode_sumber_dana {
    type: string
    sql: ${TABLE}.kode_sumber_dana ;;
  }

  dimension: kotakab {
    type: string
    sql: ${TABLE}.kotakab ;;
  }

  dimension: nama_kegiatan {
    type: string
    sql: ${TABLE}.nama_kegiatan ;;
  }

  dimension: nama_madrasah {
    type: string
    sql: ${TABLE}.nama_madrasah ;;
  }

  dimension: nama_snp {
    type: string
    sql: ${TABLE}.nama_snp ;;
  }

  dimension: nama_subkegiatan {
    type: string
    sql: ${TABLE}.nama_subkegiatan ;;
  }

  dimension: nsm {
    type: string
    sql: ${TABLE}.nsm ;;
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
