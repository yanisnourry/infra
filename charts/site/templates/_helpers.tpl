{{/*
Labels added to every object's metadata. Selectors and pod template labels
keep the plain `app: <name>` label only, same convention as the other charts.
*/}}
{{- define "site.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/part-of: site
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "site.image" -}}
{{ .Values.image.repository }}:{{ .Values.image.tag }}
{{- end }}

{{/*
Traefik middleware reference: <namespace>-<name>@kubernetescrd.
*/}}
{{- define "site.middlewareRef" -}}
{{ .root.Release.Namespace }}-{{ .name }}@kubernetescrd
{{- end }}
