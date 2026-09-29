{{/*
Labels added to every object's metadata. Selectors and pod template labels
keep the plain `app: <name>` label only: selectors are immutable, and leaving
pod templates untouched lets Helm adopt the existing objects without a rollout.
*/}}
{{- define "pipeline.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/part-of: pipeline
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "pipeline.image" -}}
{{ .Values.image.repository }}:{{ .Values.image.tag }}
{{- end }}

{{/*
Traefik middleware reference: <namespace>-<name>@kubernetescrd.
*/}}
{{- define "pipeline.middlewareRef" -}}
{{ .root.Release.Namespace }}-{{ .name }}@kubernetescrd
{{- end }}
