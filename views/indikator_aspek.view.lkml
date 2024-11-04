# The name of this view in Looker is "Indikator Aspek"
view: indikator_aspek {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `edm.indikator_aspek` ;;
  drill_fields: [nsm]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: nsm {
    primary_key: yes
    type: string
    sql: ${TABLE}.nsm ;;
  }
  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Aspek A" in Explore.

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

  dimension: create_at_etl {
    type: string
    sql: ${TABLE}.create_at_etl ;;
  }

  dimension: jenjang {
    type: string
    sql: ${TABLE}.jenjang ;;
  }

  dimension: kabkota {
    type: string
    sql: ${TABLE}.kabkota ;;
  }

  dimension: kategori_akhir {
    type: string
    sql: ${TABLE}.kategori_akhir ;;
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

  dimension: nama_madrasah {
    type: string
    sql: ${TABLE}.nama_madrasah ;;
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
  measure: count {
    type: count
    drill_fields: [nsm]
  }
}
