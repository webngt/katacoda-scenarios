Для успешного прохождения упражнения убедитесь, что учебный кластер Kubernetes и Istio Service Mesh готовы к работе

## Kubernetes

Дождитесь подтверждения запуска кластера в терминале, должно появиться такое сообщение

> **master $** launch.sh
> Waiting for Kubernetes to start...
> Kubernetes started

Убедитесь, что все поды находятстя в состоянии Running прежде чем двигаться дальше `kubectl get pods --all-namespaces`{{execute T1}}

Исключение может быть сделано для katacoda-cloud-provider он может остаться в статусе CrashLoopBackOff, что никак не влияет на дальнейшие шаги

## Istio

Запустите установку istio `/usr/local/bin/istio-install.sh`{{execute T1}}

Проверьте, что все поды Istio в состоянии Running `kubectl get pods -n istio-system`{{execute T1}}

## TroubleShoot

* если зависла установка istio, запустите `troubleshoot.sh`{{execute interrupt T1}}, после выполнения этой команды повторно запустите `/usr/local/bin/istio-install.sh`{{execute T1}}
* если описанный способ не помог, заново откройте страницу упражнения и начните сценарий заново.
