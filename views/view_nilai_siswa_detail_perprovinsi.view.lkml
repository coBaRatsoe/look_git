
view: view_nilai_siswa_detail_perprovinsi {
  derived_table: {
    sql: WITH aspek_siswa_permadrasah AS (select tahun,kode_provinsi,provinsi,concat(left(cast(kode_kabkota as string) ,2),'.',right(cast(kode_kabkota as string),2)) kode_kabkota,kabkota,literasi,nsm,nama,jenjang,(case when jenjang = 'mts' then skor-40 else
                          case when jenjang = 'ma' then skor-80 else round(skor,2) end end) AS skor ,ck,capaian,deskripsi,rekomendasi
            from bi-dashboard-dev.report_kinerja_madrasah.aspek_siswa_permadrasah )
      SELECT
          aspek_siswa_permadrasah.tahun AS tahun,
          aspek_siswa_permadrasah.kode_provinsi  AS kode_provinsi,
          aspek_siswa_permadrasah.provinsi  AS provinsi,
          LOWER (aspek_siswa_permadrasah.jenjang)  AS jenjang,
          aspek_siswa_permadrasah.literasi  AS literasi,
          aspek_siswa_permadrasah.rekomendasi AS rekomendasi,
          ROUND (SUM (skor) / COUNT (nsm),2)  AS skor
      FROM aspek_siswa_permadrasah
      WHERE literasi !="profil"
      GROUP BY
          1,
          2,
          3,
          4,
          5,
          6
      ORDER BY
          1
      LIMIT 5000 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: kode_provinsi {
    type: number
    sql: ${TABLE}.kode_provinsi ;;
  }

  dimension: provinsi {
    type: string
    sql: ${TABLE}.provinsi ;;
  }

  dimension: jenjang {
    type: string
    sql: ${TABLE}.jenjang ;;
  }

  dimension: literasi {
    type: string
    sql: ${TABLE}.literasi ;;
  }

  dimension: rekomendasi {
    type: string
    sql: ${TABLE}.rekomendasi ;;
  }

  dimension: skor {
    type: number
    sql: ${TABLE}.skor ;;
  }
  dimension: tahun {
    type: number
    sql: ${TABLE}.tahun ;;
  }


  set: detail {
    fields: [
        kode_provinsi,
  provinsi,
  jenjang,
  literasi,
  rekomendasi,
  skor
    ]
  }
}
