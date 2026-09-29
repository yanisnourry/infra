{{/*
Labels added to every object's metadata. Selectors and pod template labels
keep the plain `app: <name>` label only, same convention as the pipeline chart.
*/}}
{{- define "backtester.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/part-of: backtester
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "backtester.image" -}}
{{ .Values.image.repository }}:{{ .Values.image.tag }}
{{- end }}
