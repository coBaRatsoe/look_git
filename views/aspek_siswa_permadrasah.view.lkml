
view: aspek_siswa_permadrasah {
  derived_table: {
    sql: select tahun,kode_provinsi,provinsi,concat(left(cast(kode_kabkota as string) ,2),'.',right(cast(kode_kabkota as string),2)) kode_kabkota,kabkota,literasi,nsm,nama,jenjang,ROUND (skor,2) as skor,ck,capaian,deskripsi,rekomendasi,ROUND (skor_rkm,2) as skor_rkm,predikat_rkm
      from bi-dashboard-dev.report_kinerja_madrasah.aspek_siswa_permadrasah ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: tahun {
    type: number
    sql: ${TABLE}.tahun ;;
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

  dimension: literasi {
    type: string
    sql: ${TABLE}.literasi ;;
  }

  dimension: nsm {
    type: number
    sql: ${TABLE}.nsm ;;
  }

  dimension: nama {
    type: string
    sql: ${TABLE}.nama ;;
  }

  dimension: jenjang {
    type: string
    sql: ${TABLE}.jenjang ;;
  }

  dimension: skor {
    type: number
    sql: ${TABLE}.skor ;;
  }

  dimension: ck {
    type: number
    sql: ${TABLE}.ck ;;
  }

  dimension: capaian {
    type: string
    sql: ${TABLE}.capaian ;;
  }

  dimension: deskripsi {
    type: string
    sql: ${TABLE}.deskripsi ;;
  }

  dimension: rekomendasi {
    type: string
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
        tahun,
  kode_provinsi,
  provinsi,
  kode_kabkota,
  kabkota,
  literasi,
  nsm,
  nama,
  jenjang,
  skor,
  ck,
  capaian,
  deskripsi,
  rekomendasi,
  skor_rkm,
  predikat_rkm
    ]
  }
}
