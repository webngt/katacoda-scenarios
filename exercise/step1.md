Подготовка к тестированию - развертывание кластера

## Kubernetes

Дождитесь подтверждения запуска кластера в терминале

Убедитесь, что все кластеры находятстя в состоянии Running прежде чем двигаться дальше `kubectl get pods --all-namespaces`{{execute T1}} 

![Running](./assets/running.png)

Исключение может быть сделано для katacoda-cloud-provider он может остаться в статусе CrashLoopBackOff, что никак не влияет на дальнейшие шаги

## Установка Istio

Запустите установку istio `/usr/local/bin/istio-install.sh`{{execute T1}}

Проверьте, что все поды находятся в состоянии Running `kubectl get pods --all-namespaces`{{execute T1}}

![Running](./assets/running.png)

## TroubleShoot

Если что-то не работает или зависаает, перезагрузите страницу и начните сценарий заново.
