{{- define "foobar-api.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "foobar-api.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "foobar-api.labels" -}}
app.kubernetes.io/name: {{ include "foobar-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
{{- end -}}

{{- define "foobar-api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "foobar-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "foobar-api.tlsSecretName" -}}
{{- if .Values.tlsSecret.name -}}
{{- .Values.tlsSecret.name -}}
{{- else -}}
{{- printf "%s-tls" (include "foobar-api.fullname" .) -}}
{{- end -}}
{{- end -}}
