package rest

import "gitlab.com/sbt-devops/ci-cd/go-metrics/monitoring"

const (
	// Custom metrics
	// .. general
	metricsNamespace = "echoserver"
	metricsSubsystem = "rest"
	// .. opsProcessed
	opsProcessedKey  = "opsProcessed"
	opsProcessedName = "processed_ops_total"
	opsProcessedHelp = "Total number of processed operations"
)

// addCustomMetrics -
func addCustomMetrics(customMetrics monitoring.ICustomMetrics) {

	customMetrics.AddCounter(metricsNamespace, metricsSubsystem, opsProcessedName, opsProcessedHelp, opsProcessedKey)
}
