package k8s.replica.count

# Пакет для анализа
apply_replicas_count = {"msg": msg, "status": status, "type": type, "name": name } {
    deployment:=lower(input.kind)
    deployment == "deployment"
    cnt:= input.spec.replicas
    cnt > 1
    status:= 1
    type:="Проверка на количество реплик"
    msg :=  sprintf("Проверка на кол-во реплик пройдена. Реплик: %d", [cnt])
    name:=input.metadata.name
}
else = {"msg": msg, "status": status, "type": type, "name": name  } {
    deployment:=lower(input.kind)
    deployment == "deployment"
    cnt:=input.spec.replicas
    status:= 0
    type:="Проверка на количество реплик"
    msg :=  sprintf("Проверка на кол-во реплик не пройдена. Реплик: %d", [cnt] )
    name:=input.metadata.name
}
else  = {"msg": msg, "status": status, "type": type, "name": name  }{
    deployment:=lower(input.kind)
    deployment != "deployment"
    status:= -1
    type:="Проверка на количество реплик"
    msg :=  sprintf("вид объекта должен быть deployment. У вас он: %s", [deployment] )
    name:=input.metadata.name
}