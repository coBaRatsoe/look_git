# The name of this view in Looker is "Erkam Planning Summarize Copy"
view: erkam_planning_summarize_copy {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `erkam.erkam_planning_summarize_copy` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "D Rencana Pendapatan ID" in Explore.

  dimension: d_rencana_pendapatan_id {
    type: string
    sql: ${TABLE}.d_rencana_pendapatan_id ;;
  }

  dimension: drap_id {
    type: string
    sql: ${TABLE}.drap_id ;;
  }

  dimension: drap_jumlah {
    type: number
    sql: ${TABLE}.drap_jumlah ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_drap_jumlah {
    type: sum
    sql: ${drap_jumlah} ;;  }
  measure: average_drap_jumlah {
    type: average
    sql: ${drap_jumlah} ;;  }

  dimension: drk_id {
    type: string
    sql: ${TABLE}.drk_id ;;
  }

  dimension: drk_updated_at {
    type: string
    sql: ${TABLE}.drk_updated_at ;;
  }

  dimension: drp2_id {
    type: string
    sql: ${TABLE}.drp2_id ;;
  }

  dimension: drp_jumlah {
    type: number
    sql: ${TABLE}.drp_jumlah ;;
  }

  dimension: drp_updated_at {
    type: string
    sql: ${TABLE}.drp_updated_at ;;
  }

  dimension: drrk_id {
    type: string
    sql: ${TABLE}.drrk_id ;;
  }

  dimension: drrk_jumlah {
    type: number
    sql: ${TABLE}.drrk_jumlah ;;
  }

  dimension: drrk_updated_at {
    type: string
    sql: ${TABLE}.drrk_updated_at ;;
  }

  dimension: etl_created_at {
    type: string
    sql: ${TABLE}.etl_created_at ;;
  }

  dimension: jumlah {
    type: number
    sql: ${TABLE}.jumlah ;;
  }

  dimension: jumlah_bulan_1 {
    type: number
    sql: ${TABLE}.jumlah_bulan_1 ;;
  }

  dimension: jumlah_bulan_10 {
    type: number
    sql: ${TABLE}.jumlah_bulan_10 ;;
  }

  dimension: jumlah_bulan_11 {
    type: number
    sql: ${TABLE}.jumlah_bulan_11 ;;
  }

  dimension: jumlah_bulan_12 {
    type: number
    sql: ${TABLE}.jumlah_bulan_12 ;;
  }

  dimension: jumlah_bulan_2 {
    type: number
    sql: ${TABLE}.jumlah_bulan_2 ;;
  }

  dimension: jumlah_bulan_3 {
    type: number
    sql: ${TABLE}.jumlah_bulan_3 ;;
  }

  dimension: jumlah_bulan_4 {
    type: number
    sql: ${TABLE}.jumlah_bulan_4 ;;
  }

  dimension: jumlah_bulan_5 {
    type: number
    sql: ${TABLE}.jumlah_bulan_5 ;;
  }

  dimension: jumlah_bulan_6 {
    type: number
    sql: ${TABLE}.jumlah_bulan_6 ;;
  }

  dimension: jumlah_bulan_7 {
    type: number
    sql: ${TABLE}.jumlah_bulan_7 ;;
  }

  dimension: jumlah_bulan_8 {
    type: number
    sql: ${TABLE}.jumlah_bulan_8 ;;
  }

  dimension: jumlah_bulan_9 {
    type: number
    sql: ${TABLE}.jumlah_bulan_9 ;;
  }

  dimension: kode_jenis_belanja {
    type: string
    sql: ${TABLE}.kode_jenis_belanja ;;
  }

  dimension: kode_kabkota {
    type: string
    sql: ${TABLE}.kode_kabkota ;;
  }

  dimension: kode_kegiatan {
    type: string
    sql: ${TABLE}.kode_kegiatan ;;
  }

  dimension: kode_provinsi {
    type: string
    sql: ${TABLE}.kode_provinsi ;;
  }

  dimension: kode_snp {
    type: string
    sql: ${TABLE}.kode_snp ;;
  }

  dimension: kode_sub_kegiatan {
    type: string
    sql: ${TABLE}.kode_sub_kegiatan ;;
  }

  dimension: kode_sumber_dana {
    type: string
    sql: ${TABLE}.kode_sumber_dana ;;
  }

  dimension: komponen {
    type: string
    sql: ${TABLE}.komponen ;;
  }

  dimension: madrasah_id {
    type: string
    sql: ${TABLE}.madrasah_id ;;
  }

  dimension: nama_jenis_belanja {
    type: string
    sql: ${TABLE}.nama_jenis_belanja ;;
  }

  dimension: nama_kabkota {
    type: string
    sql: ${TABLE}.nama_kabkota ;;
  }

  dimension: nama_kategori_biaya {
    type: string
    sql: ${TABLE}.nama_kategori_biaya ;;
  }

  dimension: nama_kegiatan {
    type: string
    sql: ${TABLE}.nama_kegiatan ;;
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

  dimension: nama_sub_kegiatan {
    type: string
    sql: ${TABLE}.nama_sub_kegiatan ;;
  }

  dimension: nama_sumber_dana {
    type: string
    sql: ${TABLE}.nama_sumber_dana ;;
  }

  dimension: nsm {
    type: string
    sql: ${TABLE}.nsm ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: tahun {
    type: number
    sql: ${TABLE}.tahun ;;
  }

  dimension: total_disetujui {
    type: number
    sql: ${TABLE}.total_disetujui ;;
  }

  dimension: total_rincian {
    type: number
    sql: ${TABLE}.total_rincian ;;
  }
  measure: count {
    type: count
  }
}
