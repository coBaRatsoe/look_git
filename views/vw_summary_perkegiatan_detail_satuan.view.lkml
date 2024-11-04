# The name of this view in Looker is "Vw Summary Perkegiatan Detail Satuan"
view: vw_summary_perkegiatan_detail_satuan {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `erkam.vw_summary_perkegiatan_detail_satuan` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "D Realisasi Biaya Detail ID" in Explore.

  dimension: d_realisasi_biaya_detail_id {
    type: string
    sql: ${TABLE}.d_realisasi_biaya_detail_id ;;
  }

  dimension: d_rencana_rincian_kegiatan_id {
    type: string
    sql: ${TABLE}.d_rencana_rincian_kegiatan_id ;;
  }

  dimension: harga_satuan_realisasi {
    type: number
    sql: ${TABLE}.harga_satuan_realisasi ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_harga_satuan_realisasi {
    type: sum
    sql: ${harga_satuan_realisasi} ;;  }
  measure: average_harga_satuan_realisasi {
    type: average
    sql: ${harga_satuan_realisasi} ;;  }

  dimension: jenjang {
    type: string
    sql: ${TABLE}.jenjang ;;
  }

  dimension: kode_komponen {
    type: number
    sql: ${TABLE}.kode_komponen ;;
  }

  dimension: kode_subkegiatan {
    type: string
    sql: ${TABLE}.kode_subkegiatan ;;
  }

  dimension: kode_sumber_dana {
    type: string
    sql: ${TABLE}.kode_sumber_dana ;;
  }

  dimension: kotakab {
    type: string
    sql: ${TABLE}.kotakab ;;
  }

  dimension: kuantitas_realisasi {
    type: number
    sql: ${TABLE}.kuantitas_realisasi ;;
  }

  dimension: nama_kategori_biaya {
    type: string
    sql: ${TABLE}.nama_kategori_biaya ;;
  }

  dimension: nama_komponen {
    type: string
    sql: ${TABLE}.nama_komponen ;;
  }

  dimension: nama_komponen_biaya {
    type: string
    sql: ${TABLE}.nama_komponen_biaya ;;
  }

  dimension: nama_madrasah {
    type: string
    sql: ${TABLE}.nama_madrasah ;;
  }

  dimension: nama_subkegiatan {
    type: string
    sql: ${TABLE}.nama_subkegiatan ;;
  }

  dimension: namakegiatan {
    type: string
    sql: ${TABLE}.namakegiatan ;;
  }

  dimension: namakegiatan_juknis {
    type: string
    sql: ${TABLE}.namakegiatan_juknis ;;
  }

  dimension: nsm {
    type: string
    sql: ${TABLE}.nsm ;;
  }

  dimension: provinsi {
    type: string
    sql: ${TABLE}.provinsi ;;
  }

  dimension: status_sekolah {
    type: string
    sql: ${TABLE}.status_sekolah ;;
  }

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
