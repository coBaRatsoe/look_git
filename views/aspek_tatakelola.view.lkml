view: aspek_tatakelola {
  sql_table_name: `bi-dashboard-dev.report_kinerja_madrasah.aspek_tatakelola` ;;

  dimension: aspek_a {
    type: number
    sql: ${TABLE}.aspek_a ;;
  }
  dimension: aspek_b {
    type: number
    sql: ${TABLE}.aspek_b ;;
  }
  dimension: aspek_c {
    type: number
    sql: ${TABLE}.aspek_c ;;
  }
  dimension: aspek_d {
    type: number
    sql: ${TABLE}.aspek_d ;;
  }
  dimension: aspek_e {
    type: number
    sql: ${TABLE}.aspek_e ;;
  }
  dimension: avg_lpj {
    type: number
    sql: ${TABLE}.avg_lpj ;;
  }
  dimension: jenjang {
    type: string
    sql: ${TABLE}.jenjang ;;
  }
  dimension: kabkota {
    type: string
    sql: ${TABLE}.kabkota ;;
  }
  dimension: kategori_aspek_a {
    type: string
    sql: ${TABLE}.kategori_aspek_a ;;
  }
  dimension: kategori_aspek_b {
    type: string
    sql: ${TABLE}.kategori_aspek_b ;;
  }
  dimension: kategori_aspek_c {
    type: string
    sql: ${TABLE}.kategori_aspek_c ;;
  }
  dimension: kategori_aspek_d {
    type: string
    sql: ${TABLE}.kategori_aspek_d ;;
  }
  dimension: kategori_aspek_e {
    type: string
    sql: ${TABLE}.kategori_aspek_e ;;
  }
  dimension: kode_kabkota {
    type: string
    sql: ${TABLE}.kode_kabkota ;;
  }
  dimension: kode_provinsi {
    type: string
    sql: ${TABLE}.kode_provinsi ;;
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
  dimension: rekomendasi_aspek_a {
    type: string
    sql: ${TABLE}.rekomendasi_aspek_a ;;
  }
  dimension: rekomendasi_aspek_b {
    type: string
    sql: ${TABLE}.rekomendasi_aspek_b ;;
  }
  dimension: rekomendasi_aspek_c {
    type: string
    sql: ${TABLE}.rekomendasi_aspek_c ;;
  }
  dimension: rekomendasi_aspek_d {
    type: string
    sql: ${TABLE}.rekomendasi_aspek_d ;;
  }
  dimension: rekomendasi_aspek_e {
    type: string
    sql: ${TABLE}.rekomendasi_aspek_e ;;
  }
  dimension: skor_akhir {
    type: number
    sql: ${TABLE}.skor_akhir ;;
  }
  dimension: tahun {
    type: string
    sql: ${TABLE}.tahun ;;
  }
  dimension: hasil_penilaian_lpj {
    type: string
    sql:  ${TABLE}.hasil_penilaian_lpj ;;
  }
  measure: count {
    type: count
  }
}
