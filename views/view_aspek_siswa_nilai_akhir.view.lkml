
view: view_aspek_siswa_nilai_akhir {
  derived_table: {
    sql: WITH aspek_siswa_permadrasah AS (select tahun,kode_provinsi,provinsi,concat(left(cast(kode_kabkota as string) ,2),'.',right(cast(kode_kabkota as string),2)) kode_kabkota,kabkota,literasi,nsm,nama,jenjang,skor,ck,capaian,deskripsi,rekomendasi
            from bi-dashboard-dev.report_kinerja_madrasah.aspek_siswa_permadrasah )
      SELECT
          aspek_siswa_permadrasah.nsm  AS aspek_siswa_permadrasah_nsm,
          SUM(aspek_siswa_permadrasah.skor) / COUNT (aspek_siswa_permadrasah.nsm)  AS Nilai_akhir_siswa
      FROM aspek_siswa_permadrasah
      GROUP BY
          1
      ORDER BY
          1
      LIMIT 5000 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: aspek_siswa_permadrasah_nsm {
    type: number
    sql: ${TABLE}.aspek_siswa_permadrasah_nsm ;;
  }

  dimension: nilai_akhir_siswa {
    type: number
    sql: ${TABLE}.Nilai_akhir_siswa ;;
  }

  set: detail {
    fields: [
        aspek_siswa_permadrasah_nsm,
	nilai_akhir_siswa
    ]
  }
}
