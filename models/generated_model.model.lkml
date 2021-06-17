connection: "looker-demos"
include: "*.view.lkml"
include: "/views/*.view.lkml"

datagroup: generated_model_default_datagroup {
  sql_trigger:  SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*6)/(60*60*24));;
  max_cache_age: "1 hour"
}

persist_with: generated_model_default_datagroup

explore: events_20201008 {

  join: events_20201008__items {
    view_label: "Events 20201008: Items"
    sql: LEFT JOIN UNNEST(${events_20201008.items}) as events_20201008__items ;;
    relationship: one_to_many
  }

  join: events_20201008__event_params {
    view_label: "Events 20201008: Event Params"
    sql: LEFT JOIN UNNEST(${events_20201008.event_params}) as events_20201008__event_params ;;
    relationship: one_to_many
  }

  join: events_20201008__user_properties {
    view_label: "Events 20201008: User Properties"
    sql: LEFT JOIN UNNEST(${events_20201008.user_properties}) as events_20201008__user_properties ;;
    relationship: one_to_many
  }
}

explore: ga4_sessions {}