
view: view_aspek_pendataan_nilai_akhir {
  derived_table: {
    sql: SELECT
          aspek_pendataan_permadrasah.nsm,
          ((CASE WHEN aspek_pendataan_permadrasah.student_graduation = 0
          then 0 ELSE 1 END)+
          (CASE WHEN aspek_pendataan_permadrasah.avg_student = 0 then 0 ELSE 1 END)+
          (CASE WHEN aspek_pendataan_permadrasah.rasioguru = 0 then 0 ELSE 1 END )+
          (CASE WHEN aspek_pendataan_permadrasah.gurubersertifikat = 0 then 0 ELSE 1 END)+
          (CASE WHEN aspek_pendataan_permadrasah.guruS1 = 0 then 0 else 1 END)+
          (CASE WHEN aspek_pendataan_permadrasah.rasio_rombelkelas = 0 then 0 else 1 END)+
          (CASE WHEN aspek_pendataan_permadrasah.rasiotoiletsiswa = 0 then 0 else 1 END)+
          (CASE WHEN aspek_pendataan_permadrasah.rasio_lab = 0 then 0 else 1 END))*10
          AS NilaiAkhir
          
      FROM `bi-dashboard-dev.report_kinerja_madrasah.aspek_pendataan_permadrasah`  AS aspek_pendataan_permadrasah
      ORDER BY
          1
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: nsm {
    type: string
    sql: ${TABLE}.nsm ;;
  }

  dimension: nilai_akhir {
    type: number
    sql: ${TABLE}.NilaiAkhir ;;
  }

  set: detail {
    fields: [
        nsm,
	nilai_akhir
    ]
  }
}
