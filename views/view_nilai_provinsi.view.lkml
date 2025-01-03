
view: view_nilai_provinsi {
  derived_table: {
    sql: WITH view_aspek_pendataan_nilai_akhir AS (
          SELECT
              aspek_pendataan_permadrasah.nsm,
              aspek_pendataan_permadrasah.province,
              aspek_pendataan_permadrasah.kode_provinsi,
              (
                  (CASE WHEN aspek_pendataan_permadrasah.student_graduation = 0 THEN 0 ELSE 1 END) +
                  (CASE WHEN aspek_pendataan_permadrasah.avg_student = 0 THEN 0 ELSE 1 END) +
                  (CASE WHEN aspek_pendataan_permadrasah.rasioguru = 0 THEN 0 ELSE 1 END) +
                  (CASE WHEN aspek_pendataan_permadrasah.gurubersertifikat = 0 THEN 0 ELSE 1 END) +
                  (CASE WHEN aspek_pendataan_permadrasah.guruS1 = 0 THEN 0 ELSE 1 END) +
                  (CASE WHEN aspek_pendataan_permadrasah.rasio_rombelkelas = 0 THEN 0 ELSE 1 END) +
                  (CASE WHEN aspek_pendataan_permadrasah.rasiotoiletsiswa = 0 THEN 0 ELSE 1 END) +
                  (CASE WHEN aspek_pendataan_permadrasah.rasio_lab = 0 THEN 0 ELSE 1 END)
              ) * 10 AS NilaiAkhir
          FROM `bi-dashboard-dev.report_kinerja_madrasah.aspek_pendataan_permadrasah` AS aspek_pendataan_permadrasah
          ORDER BY 1
      ),
      view_nilai_akhir_tata_kelola AS (
          SELECT
              aspek_tatakelola.nsm AS aspek_tatakelola_nsm,
              aspek_tatakelola.jenjang AS aspek_tatakelola_jenjang,
              aspek_tatakelola.tahun AS aspek_tatakelola_tahun,
              aspek_tatakelola.avg_lpj AS aspek_tatakelola_avg_lpj,
              aspek_tatakelola.skor_akhir AS aspek_tatakelola_skor_akhir,
              ((aspek_tatakelola.avg_lpj + aspek_tatakelola.skor_akhir) / 2) AS nilai_akhir_tata_kelola
          FROM `bi-dashboard-dev.report_kinerja_madrasah.aspek_tatakelola` AS aspek_tatakelola
          WHERE aspek_tatakelola.tahun = "2024"
          GROUP BY 1, 2, 3, 4 , 5
      ),
      view_aspek_guru_nilaiakhir AS (
          SELECT
              CAST(aspek_guru_permadrasah.Nsm_Satminkal AS STRING) AS aspek_guru_permadrasah_nsm_satminkal,
              CASE
                  WHEN COUNT(aspek_guru_permadrasah.Nsm_Satminkal) = 0 THEN 0
                  ELSE SUM(aspek_guru_permadrasah.avg_skor) / COUNT(aspek_guru_permadrasah.Nsm_Satminkal)
              END AS nilai_akhir_guru
          FROM `bi-dashboard-dev.report_kinerja_madrasah.aspek_guru_permadrasah` AS aspek_guru_permadrasah
          GROUP BY 1
      ),
      view_aspek_siswa_nilai_akhir AS (
          SELECT
              CAST(aspek_siswa_permadrasah.nsm AS STRING) AS aspek_siswa_nilai_akhir_nsm,
              CASE
                  WHEN COUNT(aspek_siswa_permadrasah.nsm) = 0 THEN 0
                  ELSE SUM(aspek_siswa_permadrasah.skor_rkm) / COUNT(aspek_siswa_permadrasah.nsm)
              END AS nilai_akhir_siswa
          FROM `bi-dashboard-dev.report_kinerja_madrasah.aspek_siswa_permadrasah` AS aspek_siswa_permadrasah
          GROUP BY 1
      )
      SELECT
          aspek_pendataan_permadrasah.kode_provinsi,
          aspek_pendataan_permadrasah.province,
          view_nilai_akhir_tata_kelola.aspek_tatakelola_jenjang AS jenjang,
          ROUND (SUM(view_aspek_pendataan_nilai_akhir.NilaiAkhir) / COUNT (view_aspek_pendataan_nilai_akhir.nsm),2) AS total_nilai_akhir,
          ROUND (SUM(view_aspek_guru_nilaiakhir.nilai_akhir_guru) / COUNT (view_aspek_pendataan_nilai_akhir.nsm),2) AS total_nilai_guru,
          ROUND (SUM(view_nilai_akhir_tata_kelola.nilai_akhir_tata_kelola) / COUNT (view_aspek_pendataan_nilai_akhir.nsm),2) AS total_nilai_tata_kelola,
          ROUND (SUM(view_aspek_siswa_nilai_akhir.skor_rkm) / COUNT (view_aspek_siswa_nilai_akhir.nsm),2) AS total_nilai_siswa
      FROM view_aspek_pendataan_nilai_akhir
      LEFT JOIN view_nilai_akhir_tata_kelola
          ON view_aspek_pendataan_nilai_akhir.nsm = view_nilai_akhir_tata_kelola.aspek_tatakelola_nsm
      LEFT JOIN view_aspek_guru_nilaiakhir
          ON view_aspek_pendataan_nilai_akhir.nsm = view_aspek_guru_nilaiakhir.aspek_guru_permadrasah_nsm_satminkal
      LEFT JOIN `bi-dashboard-dev.report_kinerja_madrasah.aspek_pendataan_permadrasah` AS aspek_pendataan_permadrasah
          ON aspek_pendataan_permadrasah.nsm = view_aspek_pendataan_nilai_akhir.nsm
      LEFT JOIN `bi-dashboard-dev.report_kinerja_madrasah.aspek_siswa_permadrasah` AS view_aspek_siswa_nilai_akhir
          ON CAST(view_aspek_siswa_nilai_akhir.nsm AS STRING) = view_aspek_pendataan_nilai_akhir.nsm
      WHERE aspek_pendataan_permadrasah.jenjang IN ("mi","ma","mts","ra")
      GROUP BY
      1,
      2,
      3
      LIMIT 5000 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: kode_provinsi {
    type: string
    sql: ${TABLE}.kode_provinsi ;;
  }

  dimension: province {
    type: string
    sql: ${TABLE}.province ;;
  }

  dimension: jenjang {
    type: string
    sql: ${TABLE}.jenjang ;;
  }

  dimension: total_nilai_akhir {
    type: number
    sql: ${TABLE}.total_nilai_akhir ;;
  }

  dimension: total_nilai_guru {
    type: number
    sql: ${TABLE}.total_nilai_guru ;;
  }

  dimension: total_nilai_tata_kelola {
    type: number
    sql: ${TABLE}.total_nilai_tata_kelola ;;
  }
  dimension: total_nilai_siswa {
    type: number
    sql: ${TABLE}.total_nilai_siswa ;;
  }

  set: detail {
    fields: [
        province,
  jenjang,
  total_nilai_akhir,
  total_nilai_guru,
  total_nilai_tata_kelola,
  total_nilai_siswa

    ]
  }
}
