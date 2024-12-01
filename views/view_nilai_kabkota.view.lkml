
view: view_nilai_kabkota {
  derived_table: {
    sql: WITH view_nilai_provinsi AS (WITH view_aspek_pendataan_nilai_akhir AS (
                SELECT
                    aspek_pendataan_permadrasah.nsm,
                    aspek_pendataan_permadrasah.province,
                    aspek_pendataan_permadrasah.kode_provinsi,
                    aspek_pendataan_permadrasah.kode_kabkota,
                    aspek_pendataan_permadrasah.city,
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
            )
            SELECT
                aspek_pendataan_permadrasah.kode_provinsi,
                aspek_pendataan_permadrasah.province,
                view_nilai_akhir_tata_kelola.aspek_tatakelola_jenjang AS jenjang,
                SUM(view_aspek_pendataan_nilai_akhir.NilaiAkhir) / COUNT (view_aspek_pendataan_nilai_akhir.nsm) AS total_nilai_akhir,
                SUM(view_aspek_guru_nilaiakhir.nilai_akhir_guru) / COUNT (view_aspek_pendataan_nilai_akhir.nsm) AS total_nilai_guru,
                SUM(view_nilai_akhir_tata_kelola.nilai_akhir_tata_kelola) / COUNT (view_aspek_pendataan_nilai_akhir.nsm) AS total_nilai_tata_kelola
            FROM view_aspek_pendataan_nilai_akhir
            LEFT JOIN view_nilai_akhir_tata_kelola
                ON view_aspek_pendataan_nilai_akhir.nsm = view_nilai_akhir_tata_kelola.aspek_tatakelola_nsm
            LEFT JOIN view_aspek_guru_nilaiakhir
                ON view_aspek_pendataan_nilai_akhir.nsm = view_aspek_guru_nilaiakhir.aspek_guru_permadrasah_nsm_satminkal
            LEFT JOIN `bi-dashboard-dev.report_kinerja_madrasah.aspek_pendataan_permadrasah` AS aspek_pendataan_permadrasah
                ON aspek_pendataan_permadrasah.nsm = view_aspek_pendataan_nilai_akhir.nsm
            WHERE aspek_pendataan_permadrasah.jenjang IN ("mi","ma","mts","ra")
            GROUP BY
            1,
            2,
            3
            LIMIT 5000 )
      SELECT
          aspek_pendataan_permadrasah.kode_kabkota,
          aspek_pendataan_permadrasah.city,
          view_nilai_provinsi.jenjang  AS view_nilai_provinsi_jenjang,
          view_nilai_provinsi.kode_provinsi  AS view_nilai_provinsi_kode_provinsi,
          view_nilai_provinsi.province  AS view_nilai_provinsi_province,
          view_nilai_provinsi.total_nilai_akhir  AS view_nilai_provinsi_total_nilai_akhir,
          view_nilai_provinsi.total_nilai_guru  AS view_nilai_provinsi_total_nilai_guru,
          view_nilai_provinsi.total_nilai_tata_kelola  AS view_nilai_provinsi_total_nilai_tata_kelola
      FROM view_nilai_provinsi
      LEFT JOIN `bi-dashboard-dev.report_kinerja_madrasah.aspek_pendataan_permadrasah` AS aspek_pendataan_permadrasah
          ON aspek_pendataan_permadrasah.kode_provinsi = view_nilai_provinsi.kode_provinsi
      GROUP BY
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8
      ORDER BY
          1
      LIMIT 5000 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: kode_kabkota {
    type: string
    sql: ${TABLE}.kode_kabkota ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: view_nilai_provinsi_jenjang {
    type: string
    sql: ${TABLE}.view_nilai_provinsi_jenjang ;;
  }

  dimension: view_nilai_provinsi_kode_provinsi {
    type: string
    sql: ${TABLE}.view_nilai_provinsi_kode_provinsi ;;
  }

  dimension: view_nilai_provinsi_province {
    type: string
    sql: ${TABLE}.view_nilai_provinsi_province ;;
  }

  dimension: view_nilai_provinsi_total_nilai_akhir {
    type: number
    sql: ${TABLE}.view_nilai_provinsi_total_nilai_akhir ;;
  }

  dimension: view_nilai_provinsi_total_nilai_guru {
    type: number
    sql: ${TABLE}.view_nilai_provinsi_total_nilai_guru ;;
  }

  dimension: view_nilai_provinsi_total_nilai_tata_kelola {
    type: number
    sql: ${TABLE}.view_nilai_provinsi_total_nilai_tata_kelola ;;
  }

  set: detail {
    fields: [
        kode_kabkota,
	city,
	view_nilai_provinsi_jenjang,
	view_nilai_provinsi_kode_provinsi,
	view_nilai_provinsi_province,
	view_nilai_provinsi_total_nilai_akhir,
	view_nilai_provinsi_total_nilai_guru,
	view_nilai_provinsi_total_nilai_tata_kelola
    ]
  }
}
