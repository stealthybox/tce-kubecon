Let's monitor the app we deployed using Prometheus and Grafana.
Remember that Prometheus collects the metrics, and Grafana provides dashboards to visualize them.

Let's login to Grafana.
Get the service URL for Grafana Dashboard.

```execute
kubectl get svc -n grafana | awk '{print $4}'
```
Copy the URL and paste it in a new browser tab. The user name to logon to is `tce` and password is `TCEuser@Grafana`

Go to the `TCE Swag` dashboard.

You will see Prometheus is already scraping metrics from your application.
Our cluster admins have created this dashboard so that we can monitor the request-rate and connections.

If these numbers got too high, we might need to scale the application.
