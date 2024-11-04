# The name of this view in Looker is "Ref Kegiatan Mappingjuknis"
view: ref_kegiatan_mappingjuknis {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `erkam.ref_kegiatan_mappingjuknis` ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Created By" in Explore.

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension: item {
    type: string
    sql: ${TABLE}.item ;;
  }

  dimension: kode {
    type: number
    sql: ${TABLE}.kode ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_kode {
    type: sum
    sql: ${kode} ;;  }
  measure: average_kode {
    type: average
    sql: ${kode} ;;  }

  dimension: kode_komponen {
    type: number
    sql: ${TABLE}.kode_komponen ;;
  }

  dimension: kode_subkegiatan {
    type: string
    sql: ${TABLE}.kode_subkegiatan ;;
  }

  dimension: nama_kegiatan {
    type: string
    sql: ${TABLE}.nama_kegiatan ;;
  }

  dimension: rehab_bangun_baru {
    type: string
    sql: ${TABLE}.rehab_bangun_baru ;;
  }

  dimension: sub_kegiatan {
    type: string
    sql: ${TABLE}.sub_kegiatan ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: updated_by {
    type: string
    sql: ${TABLE}.updated_by ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
