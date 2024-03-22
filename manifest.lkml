
## Connection Constants:
constant: GA4_CONNECTION {
  value: "google_analytics"
  export: override_required
}

constant: GA4_SCHEMA {
  value: "analytics_303790616"
  export: override_optional
}

constant: GA4_TABLE_VARIABLE {
  value: "events_*"
  export: override_optional
}
