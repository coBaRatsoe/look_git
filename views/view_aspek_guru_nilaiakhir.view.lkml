
view: view_aspek_guru_nilaiakhir {
  derived_table: {
    sql: SELECT
          CAST (aspek_guru_permadrasah.Nsm_Satminkal as String)  AS aspek_guru_permadrasah_nsm_satminkal,
         CASE WHEN COUNT (aspek_guru_permadrasah.Nsm_Satminkal) = 0
         THEN 0
         ELSE
         SUM(aspek_guru_permadrasah.avg_skor)  / COUNT (aspek_guru_permadrasah.Nsm_Satminkal) END AS nilai_akhir_guru
      FROM `bi-dashboard-dev.report_kinerja_madrasah.aspek_guru_permadrasah`  AS aspek_guru_permadrasah
      GROUP BY
          1
      ORDER BY
          1 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: aspek_guru_permadrasah_nsm_satminkal {
    type: string
    sql: ${TABLE}.aspek_guru_permadrasah_nsm_satminkal ;;
  }

  dimension: nilai_akhir_guru {
    type: number
    sql: ${TABLE}.nilai_akhir_guru ;;
  }

  set: detail {
    fields: [
        aspek_guru_permadrasah_nsm_satminkal,
  nilai_akhir_guru
    ]
  }
}
