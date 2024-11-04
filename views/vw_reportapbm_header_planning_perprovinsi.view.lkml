# The name of this view in Looker is "Vw Reportapbm Header Planning Perprovinsi"
view: vw_reportapbm_header_planning_perprovinsi {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `erkam.vw_reportapbm_header_planning_perprovinsi` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Anggaran Belanja" in Explore.

  dimension: anggaran_belanja {
    type: number
    sql: ${TABLE}.anggaran_belanja ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_anggaran_belanja {
    type: sum
    sql: ${anggaran_belanja} ;;  }
  measure: average_anggaran_belanja {
    type: average
    sql: ${anggaran_belanja} ;;  }

  dimension: anggaran_pendapatan {
    type: number
    sql: ${TABLE}.anggaran_pendapatan ;;
  }

  dimension: anggaran_sisa {
    type: number
    sql: ${TABLE}.anggaran_sisa ;;
  }

  dimension: anggaran_usagepercent {
    type: number
    sql: ${TABLE}.anggaran_usagepercent ;;
  }

  dimension: kode_provinsi {
    type: string
    sql: ${TABLE}.kode_provinsi ;;
  }

  dimension: nama_provinsi {
    type: string
    sql: ${TABLE}.nama_provinsi ;;
  }

  dimension: tahun {
    type: number
    sql: ${TABLE}.tahun ;;
  }
  measure: count {
    type: count
  }
}
