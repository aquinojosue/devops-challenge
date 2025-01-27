{{/*
Expand the name of the chart.
*/}}
{{- define "acceleration-a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "acceleration-a.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "acceleration-a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "acceleration-a.labels" -}}
helm.sh/chart: {{ include "acceleration-a.chart" . }}
{{ include "acceleration-a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "acceleration-a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "acceleration-a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
Test if the microservice has been enabled
*/}}
{{- define "acceleration-a.isEnabled" }}
 {{- if eq ( .Values.enabled | toString ) "true"  -}}
  true
 {{- else -}}
  false
 {{- end -}}
{{- end }}

{{/*
Template for service url
*/}}
{{- define "acceleration-a.svcUrl" }}
{{- printf "http://%s:%s/a" (include "acceleration-a.fullname" .) ( .Values.service.port | default 80 | toString) -}}
{{- end }}