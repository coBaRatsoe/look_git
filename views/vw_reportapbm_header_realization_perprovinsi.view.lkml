# The name of this view in Looker is "Vw Reportapbm Header Realization Perprovinsi"
view: vw_reportapbm_header_realization_perprovinsi {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `erkam.vw_reportapbm_header_realization_perprovinsi` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Kode Provinsi" in Explore.

  dimension: kode_provinsi {
    type: string
    sql: ${TABLE}.kode_provinsi ;;
  }

  dimension: nama_provinsi {
    type: string
    sql: ${TABLE}.nama_provinsi ;;
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

  dimension: realisasi_pendapatan {
    type: number
    sql: ${TABLE}.realisasi_pendapatan ;;
  }

  dimension: realisasi_sisa {
    type: number
    sql: ${TABLE}.realisasi_sisa ;;
  }

  dimension: realisasi_usagepercent {
    type: number
    sql: ${TABLE}.realisasi_usagepercent ;;
  }

  dimension: tahun {
    type: number
    sql: ${TABLE}.tahun ;;
  }
  measure: count {
    type: count
  }
}
