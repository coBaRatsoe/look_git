# The name of this view in Looker is "Erkam Realization Summarize"
view: erkam_realization_summarize {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `erkam.erkam_realization_summarize` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Jumlah Rb" in Explore.

  dimension: jumlah_rb {
    type: number
    sql: ${TABLE}.jumlah_rb ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_jumlah_rb {
    type: sum
    sql: ${jumlah_rb} ;;  }
  measure: average_jumlah_rb {
    type: average
    sql: ${jumlah_rb} ;;  }

  dimension: jumlah_rp {
    type: number
    sql: ${TABLE}.jumlah_rp ;;
  }

  dimension: jumlah_rpd {
    type: number
    sql: ${TABLE}.jumlah_rpd ;;
  }

  dimension: jumlah_rpk {
    type: number
    sql: ${TABLE}.jumlah_rpk ;;
  }

  dimension: kode_kabkota {
    type: string
    sql: ${TABLE}.kode_kabkota ;;
  }

  dimension: kode_provinsi {
    type: string
    sql: ${TABLE}.kode_provinsi ;;
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

  dimension: nsm {
    type: string
    sql: ${TABLE}.nsm ;;
  }

  dimension: rb_id {
    type: string
    sql: ${TABLE}.rb_id ;;
  }

  dimension: rb_status {
    type: string
    sql: ${TABLE}.rb_status ;;
  }

  dimension: rb_updated_at {
    type: string
    sql: ${TABLE}.rb_updated_at ;;
  }

  dimension: rencana_pendapatan_id {
    type: string
    sql: ${TABLE}.rencana_pendapatan_id ;;
  }

  dimension: rincian_id {
    type: string
    sql: ${TABLE}.rincian_id ;;
  }

  dimension: rp_id {
    type: string
    sql: ${TABLE}.rp_id ;;
  }

  dimension: rp_status {
    type: string
    sql: ${TABLE}.rp_status ;;
  }

  dimension: rp_updated_at {
    type: string
    sql: ${TABLE}.rp_updated_at ;;
  }

  dimension: rpd_id {
    type: string
    sql: ${TABLE}.rpd_id ;;
  }

  dimension: rpd_status {
    type: string
    sql: ${TABLE}.rpd_status ;;
  }

  dimension: rpd_updated_at {
    type: string
    sql: ${TABLE}.rpd_updated_at ;;
  }

  dimension: rpk_id {
    type: string
    sql: ${TABLE}.rpk_id ;;
  }

  dimension: rpk_status {
    type: string
    sql: ${TABLE}.rpk_status ;;
  }

  dimension: rpk_updated_at {
    type: string
    sql: ${TABLE}.rpk_updated_at ;;
  }

  dimension: tahun {
    type: number
    sql: ${TABLE}.tahun ;;
  }

  dimension: tanggal_realisasi {
    type: string
    sql: ${TABLE}.tanggal_realisasi ;;
  }
  measure: count {
    type: count
  }
}
