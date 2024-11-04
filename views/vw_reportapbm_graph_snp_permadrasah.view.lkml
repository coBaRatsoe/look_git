# The name of this view in Looker is "Vw Reportapbm Graph Snp Permadrasah"
view: vw_reportapbm_graph_snp_permadrasah {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `erkam.vw_reportapbm_graphSNP_permadrasah` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Kode Kabkota" in Explore.

  dimension: kode_kabkota {
    type: string
    sql: ${TABLE}.kode_kabkota ;;
  }

  dimension: kode_provinsi {
    type: string
    sql: ${TABLE}.kode_provinsi ;;
  }

  dimension: kode_snp {
    type: string
    sql: ${TABLE}.kode_snp ;;
  }

  dimension: kode_sumber_dana {
    type: string
    sql: ${TABLE}.kode_sumber_dana ;;
  }

  dimension: madrasah_id {
    type: string
    sql: ${TABLE}.madrasah_id ;;
  }

  dimension: nama_kabkota {
    type: string
    sql: ${TABLE}.nama_kabkota ;;
  }

  dimension: nama_madrasah {
    type: string
    sql: ${TABLE}.nama_madrasah ;;
  }

  dimension: nama_provinsi {
    type: string
    sql: ${TABLE}.nama_provinsi ;;
  }

  dimension: nama_snp {
    type: string
    sql: ${TABLE}.nama_snp ;;
  }

  dimension: nama_sumber_dana {
    type: string
    sql: ${TABLE}.nama_sumber_dana ;;
  }

  dimension: nsm {
    type: string
    sql: ${TABLE}.nsm ;;
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

  dimension: saldo {
    type: number
    sql: ${TABLE}.saldo ;;
  }

  dimension: tahun {
    type: number
    sql: ${TABLE}.tahun ;;
  }
  measure: count {
    type: count
  }
}
