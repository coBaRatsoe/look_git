view: aspek_guru_permadrasah {
  sql_table_name: `bi-dashboard-dev.report_kinerja_madrasah.aspek_guru_permadrasah` ;;

  dimension: avg_skor {
    type: number
    sql: ${TABLE}.avg_skor ;;
  }
  dimension: jawaban_bener {
    type: number
    sql: ${TABLE}.jawaban_bener ;;
  }
  dimension: jenjang {
    type: string
    sql: ${TABLE}.jenjang ;;
  }
  dimension: kabkota {
    type: string
    sql: ${TABLE}.kabkota ;;
  }
  dimension: kompetensi_utama {
    type: string
    sql: ${TABLE}.kompetensi_utama ;;
  }
  dimension: mapel {
    type: string
    sql: ${TABLE}.mapel ;;
  }
  dimension: nsm_satminkal {
    type: string
    sql: ${TABLE}.Nsm_Satminkal ;;
  }
  dimension: predikat {
    type: string
    sql: ${TABLE}.predikat ;;
  }
  dimension: provinsi {
    type: string
    sql: ${TABLE}.provinsi ;;
  }
  dimension: status_madrasah {
    type: string
    sql: ${TABLE}.status_madrasah ;;
  }
  dimension: status_tugas {
    type: string
    sql: ${TABLE}.status_tugas ;;
  }
  dimension: tahap {
    type: string
    sql: ${TABLE}.tahap ;;
  }
  dimension: total_soal {
    type: number
    sql: ${TABLE}.total_soal ;;
  }
  measure: count {
    type: count
  }
}
