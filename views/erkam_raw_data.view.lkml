# The name of this view in Looker is "Erkam Raw Data"
view: erkam_raw_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `erkam.erkam_raw_data` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Created ETL" in Explore.

  dimension: created_etl {
    type: string
    sql: ${TABLE}.created_etl ;;
  }

  dimension: d_realisasi_biaya_detail_id {
    type: string
    sql: ${TABLE}.d_realisasi_biaya_detail_id ;;
  }

  dimension: d_realisasi_biaya_id {
    type: string
    sql: ${TABLE}.d_realisasi_biaya_id ;;
  }

  dimension: d_rencana_pendapatan_id {
    type: string
    sql: ${TABLE}.d_rencana_pendapatan_id ;;
  }

  dimension: d_rencana_rincian_kegiatan_id {
    type: string
    sql: ${TABLE}.d_rencana_rincian_kegiatan_id ;;
  }

  dimension: grand_total_detail {
    type: number
    sql: ${TABLE}.grand_total_detail ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_grand_total_detail {
    type: sum
    sql: ${grand_total_detail} ;;  }
  measure: average_grand_total_detail {
    type: average
    sql: ${grand_total_detail} ;;  }

  dimension: harga_satuan_realisasi {
    type: number
    sql: ${TABLE}.harga_satuan_realisasi ;;
  }

  dimension: harga_satuan_rencana {
    type: number
    sql: ${TABLE}.harga_satuan_rencana ;;
  }

  dimension: jenjang {
    type: string
    sql: ${TABLE}.jenjang ;;
  }

  dimension: kepala_madrasah_approved {
    type: string
    sql: ${TABLE}.kepala_madrasah_approved ;;
  }

  dimension: kode_kabkota {
    type: string
    sql: ${TABLE}.kode_kabkota ;;
  }

  dimension: kode_provinsi {
    type: string
    sql: ${TABLE}.kode_provinsi ;;
  }

  dimension: kode_sumber_dana {
    type: string
    sql: ${TABLE}.kode_sumber_dana ;;
  }

  dimension: koef_persen_pajak {
    type: number
    sql: ${TABLE}.koef_persen_pajak ;;
  }

  dimension: kotakab {
    type: string
    sql: ${TABLE}.kotakab ;;
  }

  dimension: kuantitas_realisasi {
    type: number
    sql: ${TABLE}.kuantitas_realisasi ;;
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

  dimension: realisasi_updated_at {
    type: string
    sql: ${TABLE}.realisasi_updated_at ;;
  }

  dimension: rencana_updated_at {
    type: string
    sql: ${TABLE}.rencana_updated_at ;;
  }

  dimension: tahun_realisasi {
    type: number
    sql: ${TABLE}.tahun_realisasi ;;
  }

  dimension: tahun_rencana {
    type: number
    sql: ${TABLE}.tahun_rencana ;;
  }

  dimension: total_kuantitas_rencana {
    type: number
    sql: ${TABLE}.total_kuantitas_rencana ;;
  }

  dimension: total_realisasi {
    type: number
    sql: ${TABLE}.total_realisasi ;;
  }

  dimension: total_realisasi_perkegiatan {
    type: number
    sql: ${TABLE}.total_realisasi_perkegiatan ;;
  }

  dimension: total_rencana {
    type: number
    sql: ${TABLE}.total_rencana ;;
  }

  dimension: total_rincian_rencana {
    type: number
    sql: ${TABLE}.total_rincian_rencana ;;
  }
  measure: count {
    type: count
  }
}
