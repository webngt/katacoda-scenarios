Архитектор приступает к изучению **текущей** топологии приложения

## Посмотреть топологию приложения в Kiali

Выполните следующую команду, чтобы сделать доступным Kiali в браузере `nohup kubectl port-forward svc/kiali 20001:20001 -n istio-system --address 0.0.0.0 > /tmp/kiali-pf.log 2>&1 </dev/null &`{{execute T1}}

Откройте Kiali в браузере https://[[HOST_SUBDOMAIN]]-20001-[[KATACODA_HOST]].environments.katacoda.com

Логин/пароль для входа в Kiali admin/admin

## Выдержка из чеклиста

## CloudNative проверки объектов приложения

ProductPage `checklist.sh deployment productpage-v1`{{execute T1}}

Ratings `checklist.sh deployment ratings-v1`{{execute T1}}

Reviews `checklist.sh deployment reviews-v3`{{execute T1}}

Details main instance `checklist.sh pod details-main`{{execute T1}}

Details secondary instance `checklist.sh pod details-secondary`{{execute T1}}

На следующем шаге, для того, чтобы понять, как нарушения проверок влияют на работу приложения, архитектор вместе с хаос инженером запускают хаос тест. 
