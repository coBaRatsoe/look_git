
view: view_nilai_guru_detail_pusat {
  derived_table: {
    sql: select tahun,jenjang,status_madrasah,status_tugas,kompetensi_utama,
            CASE WHEN COUNT (Nsm_satminkal) = 0 THEN 0 ELSE ROUND (SUM (avg_skor) / COUNT (Nsm_satminkal),2) END  AS avg_skor from (
            SELECT
                aspek_guru_permadrasah.tahun AS tahun,
                LOWER (aspek_pendataan_permadrasah.jenjang)  AS jenjang,
                aspek_guru_permadrasah.status_madrasah  AS status_madrasah,
                case when mapel ='Guru RA' then 'Guru' else
                case when mapel = 'Kepala Madrasah'  then mapel else
                case when mapel ='Pengawas Madrasah' then mapel else
                case when mapel ='Bimbingan & Konseling' then mapel else
                'Guru' end end end end status_tugas,
                aspek_guru_permadrasah.kompetensi_utama  AS kompetensi_utama,
                aspek_guru_permadrasah.avg_skor,
                aspek_guru_permadrasah.Nsm_satminkal


            FROM bi-dashboard-dev.report_kinerja_madrasah.aspek_guru_permadrasah  AS aspek_guru_permadrasah
            LEFT JOIN bi-dashboard-dev.report_kinerja_madrasah.aspek_pendataan_permadrasah  AS aspek_pendataan_permadrasah ON CAST (aspek_guru_permadrasah.Nsm_Satminkal AS STRING) = aspek_pendataan_permadrasah.nsm
            ) as aspek_guru
            WHERE jenjang != "RA" AND jenjang != "Pengawas Madrasah"
            GROUP BY
                1,
                2,
                3,
                4,
                5;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: jenjang {
    type: string
    sql: ${TABLE}.jenjang ;;
  }

  dimension: status_madrasah {
    type: string
    sql: ${TABLE}.status_madrasah ;;
  }

  dimension: status_tugas {
    type: string
    sql: ${TABLE}.status_tugas ;;
  }

  dimension: kompetensi_utama {
    type: string
    sql: ${TABLE}.kompetensi_utama ;;
  }

  dimension: avg_skor {
    type: number
    sql: ${TABLE}.avg_skor ;;
  }
  dimension: tahun {
    type: number
    sql: ${TABLE}.tahun ;;
  }

  set: detail {
    fields: [
        jenjang,
  status_madrasah,
  status_tugas,
  kompetensi_utama,
  avg_skor
    ]
  }
}
