
view: get_ref_rekomendasi {
  derived_table: {
    sql: select id,source_aspek,jenjang,literasi,predikat,rekomendasi,simpulan from ref_rekomendasi ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: source_aspek {
    type: string
    sql: ${TABLE}.source_aspek ;;
  }

  dimension: jenjang {
    type: string
    sql: ${TABLE}.jenjang ;;
  }

  dimension: literasi {
    type: string
    sql: ${TABLE}.literasi ;;
  }

  dimension: predikat {
    type: string
    sql: ${TABLE}.predikat ;;
  }

  dimension: rekomendasi {
    type: string
    sql: ${TABLE}.rekomendasi ;;
  }

  dimension: simpulan {
    type: string
    sql: ${TABLE}.simpulan ;;
  }

  set: detail {
    fields: [
        id,
	source_aspek,
	jenjang,
	literasi,
	predikat,
	rekomendasi,
	simpulan
    ]
  }
}
