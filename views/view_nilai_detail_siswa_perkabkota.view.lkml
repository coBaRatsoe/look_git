
view: view_nilai_detail_siswa_perkabkota {
  derived_table: {
    sql: WITH aspek_siswa_permadrasah AS (select tahun,kode_provinsi,provinsi,concat(left(cast(kode_kabkota as string) ,2),'.',right(cast(kode_kabkota as string),2)) kode_kabkota,kabkota,literasi,rekomendasi,nsm,nama,jenjang,skor_rkm ,ck,capaian,deskripsi
                  from bi-dashboard-dev.report_kinerja_madrasah.aspek_siswa_permadrasah )
            SELECT
                aspek_siswa_permadrasah.tahun AS tahun,
                aspek_siswa_permadrasah.kode_provinsi  AS kode_provinsi,
                aspek_siswa_permadrasah.provinsi  AS provinsi,
                aspek_siswa_permadrasah.kode_kabkota,
                aspek_siswa_permadrasah.kabkota,
                LOWER(aspek_siswa_permadrasah.jenjang)  AS jenjang,
                aspek_siswa_permadrasah.literasi  AS literasi,
                aspek_siswa_permadrasah.rekomendasi AS rekomendasi,
                ROUND (SUM (skor_rkm) / COUNT (nsm),2)  AS skor
            FROM aspek_siswa_permadrasah
            WHERE literasi != "profil"
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

  dimension: kode_provinsi {
    type: number
    sql: ${TABLE}.kode_provinsi ;;
  }

  dimension: provinsi {
    type: string
    sql: ${TABLE}.provinsi ;;
  }

  dimension: kode_kabkota {
    type: string
    sql: ${TABLE}.kode_kabkota ;;
  }

  dimension: kabkota {
    type: string
    sql: ${TABLE}.kabkota ;;
  }

  dimension: jenjang {
    type: string
    sql: ${TABLE}.jenjang ;;
  }

  dimension: literasi {
    type: string
    sql: ${TABLE}.literasi ;;
  }

  dimension: skor {
    type: number
    sql: ${TABLE}.skor ;;
  }
  dimension: tahun {
    type: number
    sql: ${TABLE}.tahun ;;
  }
  dimension: rekomendasi {
    type: number
    sql: ${TABLE}.rekomendasi ;;
  }
  dimension: skor_rkm {
    type: number
    sql: ${TABLE}.skor_rkm ;;
  }
  dimension: predikat_rkm {
    type: string
    sql: ${TABLE}.predikat_rkm ;;
  }

  set: detail {
    fields: [
        kode_provinsi,
  provinsi,
  kode_kabkota,
  kabkota,
  jenjang,
  literasi,
  skor
    ]
  }
}
