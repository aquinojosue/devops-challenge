# JOIN DevOps Challenge Helm Chart
By Josue Aquino, 2022.
## Installing the Chart
To install the helm chart:
```console
helm install <name of the release> ./acceleration-chart
```
## Uninstalling the Chart
To uninstall the deployment:
```console
helm uninstall <name of the release>
```
## Configuration
Read through the [values.yaml](./values.yaml) file. It has the majority of values with their defaults. Some values are inherited from the initial helm chart template.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install <name of the release> \
    --set containerPort=1337 \
    ./acceleration-chart
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install <name of the release> ./acceleration-chart -f values.yaml
```
## Values
These are the main values added or modified on the helm chart. 

As mentioned before, the chart has inherited values from the initial helm chart template, but these have been noted as the values that can be used for changing the behavior of the helm chart and the containers.
| Key                           | Type   | Default                               | Description                                                                                                                                        |
|-------------------------------|--------|---------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| replicaCount                  | int    | 1                                     | Number of replicas for the calc container.                                                                                                         |
| main.image                    | String | "aquinojosue/join-challenge:acc-calc" | Container image for the calc container.                                                                                                            |
| main.pullPolicy               | String | "Always"                              | Image Pull Policy for the calc container image.                                                                                                    |
| containerPort                 | int    | 3000                                  | Port that the calc container and server will use.                                                                                                  |
| acceleration-a.enabled        | bool   | true                                  | Enables the acceleration-a microservice to be deployed.                                                                                            |
| acceleration-a.containerPort  | int    | 3002                                  | Port that the acceleration-a container and server will use.                                                                                        |
| acceleration-a.image          | String | "aquinojosue/join-challenge:acc-a"    | Container image for the acceleration-a container.                                                                                                  |
| acceleration-dv.enabled       | bool   | true                                  | Enables the acceleration-dv microservice to be deployed.                                                                                           |
| acceleration-dv.containerPort | int    | 3001                                  | Port that both the acceleration-dv container and server will use.                                                                                  |
| acceleration-dv.image         | String | "aquinojosue/join-challenge:acc-dv"   | Container image for the acceleration-dv container.                                                                                                 |
| service.type                  | String | "LoadBalancer"                        | Service type that the calc container will use.                                                                                                     |
| service.port                  | int    | 80                                    | Port that the calc container service will use.                                                                                                     |
| ingress                       | object | See values.yaml                       | Enable and configure ingress settings for the calc chart to use. Default configuration to be used with `join-challenge.local.jaquino.cloud` as host. |