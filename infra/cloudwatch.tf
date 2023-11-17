resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = var.dashboard_name
  dashboard_body = <<DASHBOARD
  {
    "widgets": [
      {
        "type": "metric",
        "x": 0,
        "y": 0,
        "width": 12,
        "height": 6,
        "properties": {
          "metrics": [
            [
              "${var.dashboard_name}",
              "violations_total"
            ],
            [
              "${var.dashboard_name}",
              "violations_noMask"
            ],
            [
              "${var.dashboard_name}",
              "violations_noHelmet"
            ],
            [
              "${var.dashboard_name}",
              "violations_noMaskOrGlove"
            ]
          ],
          "period": 300,
          "stat": "Maximum",
          "region": "eu-west-1",
          "title": "Total number of violations"
        }
      }
    ]
  }
  DASHBOARD
}

