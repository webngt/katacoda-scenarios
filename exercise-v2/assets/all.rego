package k8s.all

allow[msg] {                                                                                                           
  item := input.items[_] 
  item.kind == "Deployment"                   
  item.spec.replicas > 1 
  msg := sprintf("[STD-CN-SI-2] Deployment '%v': Проверка на кол-во реплик пройдена. Реплик: %d", [item.metadata.name, item.spec.replicas])       
}

deny[msg] {
  item := input.items[_]   
  item.kind == "Deployment"                 
  item.spec.replicas == 1 
  msg := sprintf("[STD-CN-SI-2] Deployment '%v': Проверка на кол-во реплик не пройдена. Реплик: %d", [item.metadata.name, item.spec.replicas])       
}


rs_owner_map[name] = owner {
    item := input.items[_] 
    item.kind == "Pod"                   
    name := item.metadata.name
    owner:=item.metadata.ownerReferences[_]
    owner.kind == "ReplicaSet"
}

all_owners_map[name] = owner {
    item := input.items[_] 
    item.kind == "Pod"                   
    name := item.metadata.name
    owner:=item.metadata.ownerReferences[_]
}

allow[msg] {  
    item := input.items[_]                                                                                                         
    item.kind == "Pod"                   
    owner := all_owners_map[item.metadata.name]
    msg := sprintf("[STD-CN-RS-3.1] Pod '%v': входит в %v '%v'", [item.metadata.name, owner.kind, owner.name])       
}

deny[msg] {
  item := input.items[_]   
  item.kind == "Pod"                   
  not rs_owner_map[item.metadata.name]
  msg := sprintf("[STD-CN-RS-3.1] Pod '%v': не использует абстракцию ReplicaSet", [item.metadata.name])       
}

deployment_owner_map[name] = owner {
    item := input.items[_] 
    item.kind == "ReplicaSet"                   
    name := item.metadata.name
    owner:=item.metadata.ownerReferences[_]
    owner.kind == "Deployment"
}

all_owners_map[name] = owner {
    item := input.items[_] 
    item.kind == "ReplicaSet"                   
    name := item.metadata.name
    owner:=item.metadata.ownerReferences[_]
}

allow[msg] {  
    item := input.items[_]                                                                                                         
    item.kind == "ReplicaSet"                   
    owner := all_owners_map[item.metadata.name]
    msg := sprintf("[STD-CN-RS-3.1] ReplicaSet '%v': входит в %v '%v'", [item.metadata.name, owner.kind, owner.name])       
}

deny[msg] {
  item := input.items[_]   
  item.kind == "ReplicaSet"                   
  not deployment_owner_map[item.metadata.name]
  msg := sprintf("[STD-CN-RS-3.1] ReplicaSet '%v': не использует абстракцию Deployment", [item.metadata.name])       
}


error[{"reason": reason, "item": item}] {
    item := input.items[_]
    item.kind != "Deployment"
    item.kind != "Pod"
    item.kind != "ReplicaSet"
    reason:="Unexpected item.kind"
}

policy := { "allow": allow, "deny": deny, "err": error }