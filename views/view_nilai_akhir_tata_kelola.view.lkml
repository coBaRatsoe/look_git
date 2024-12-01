
view: view_nilai_akhir_tata_kelola {
  derived_table: {
    sql: SELECT
          aspek_tatakelola.nsm AS aspek_tatakelola_nsm,
          aspek_tatakelola.tahun AS aspek_tatakelola_tahun,
          aspek_tatakelola.avg_lpj AS aspek_tatakelola_avg_lpj,
          aspek_tatakelola.skor_akhir AS aspek_tatakelola_skor_akhir,
          ((aspek_tatakelola.avg_lpj + aspek_tatakelola.skor_akhir) / 2) AS nilai_akhir_tata_kelola
      FROM `bi-dashboard-dev.report_kinerja_madrasah.aspek_tatakelola` AS aspek_tatakelola
      WHERE aspek_tatakelola.tahun = 2024
      GROUP BY
          1,
          2,
          3,
          4
      ORDER BY
          aspek_tatakelola.avg_lpj DESC ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: aspek_tatakelola_nsm {
    type: string
    sql: ${TABLE}.aspek_tatakelola_nsm ;;
  }

  dimension: aspek_tatakelola_tahun {
    type: string
    sql: ${TABLE}.aspek_tatakelola_tahun ;;
  }

  dimension: aspek_tatakelola_avg_lpj {
    type: number
    sql: ${TABLE}.aspek_tatakelola_avg_lpj ;;
  }

  dimension: aspek_tatakelola_skor_akhir {
    type: number
    sql: ${TABLE}.aspek_tatakelola_skor_akhir ;;
  }

  dimension: nilai_akhir_tata_kelola {
    type: number
    sql: ${TABLE}.nilai_akhir_tata_kelola ;;
  }

  set: detail {
    fields: [
        aspek_tatakelola_nsm,
  aspek_tatakelola_tahun,
  aspek_tatakelola_avg_lpj,
  aspek_tatakelola_skor_akhir,
  nilai_akhir_tata_kelola
    ]
  }
}
