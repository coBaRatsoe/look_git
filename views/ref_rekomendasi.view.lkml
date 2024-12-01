view: ref_rekomendasi {
  sql_table_name: `bi-dashboard-dev.report_kinerja_madrasah.ref_rekomendasi` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: predikat {
    type: string
    sql: ${TABLE}.predikat ;;
  }
  dimension: range_skor {
    type: string
    sql: ${TABLE}.range_skor ;;
  }
  dimension: rekomendasi {
    type: string
    sql: ${TABLE}.rekomendasi ;;
  }
  dimension: simpulan {
    type: string
    sql: ${TABLE}.simpulan ;;
  }
  dimension: source_aspek {
    type: string
    sql: ${TABLE}.source_aspek ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
