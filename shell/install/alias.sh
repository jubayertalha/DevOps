alias k="kubectl"
alias kg="k get"
alias kp="kg pods"
alias kn="kg nodes"
alias kname="kg namespace"
alias ks="kg services"
alias kc="kg configmaps"
alias ksec="kg secrets"
alias kj="kg jobs"
alias kr="kg replicasets"
alias kd="kg deployments"
alias kst="kg statefulsets"
alias ki="kg ingress"
alias ka="kg all"

alias kdel="k delete"
alias kdelp="kdel pods"
alias kdeln="kdel nodes"
alias kdelname="kdel namespace"
alias kdels="kdel services"
alias kdelc="kdel configmaps"
alias kdelsec="kdel secrets"
alias kdelj="kdel jobs"
alias kdelr="kdel replicasets"
alias kdeld="kdel deployments"
alias kdelst="kdel statefulsets"
alias kdeli="kdel ingress"
alias kdela="kdel all"

alias kd="k describe"
alias kdp="kd pods"
alias kdn="kd nodes"
alias kdname="kd namespace"
alias kds="kd services"
alias kdc="kd configmaps"
alias kdsec="kd secrets"
alias kdj="kd jobs"
alias kdr="kd replicasets"
alias kdd="kd deployments"
alias kdst="kd statefulsets"
alias kdi="kd ingress"
alias kda="kd all"

alias kl="k logs"

alias kr="k rollout restart"
alias krs="kr statefulset"
alias krd="kr deployment"

alias ka="k apply"

alias kx="k exec --stdin --tty"


alias h="helm"
alias hls="h list"
alias hlsall="hls --all"
alias hlsallns="hlsall --all-namespaces"
alias hlsns="hls --namespace"

alias hdel="h delete"
alias hdelall="hdel --purge"
alias hdelallns="hdelall --all-namespaces"
alias hdelns="hdel --namespace"

alias hup="h upgrade"
alias hupns="hup --namespace"

alias hget="h get"
alias hgetall="hget all"
alias hgetallns="hgetall --all-namespaces"
alias hgetns="hget --namespace"

alias hdep="h dependency"
alias hdepup="hdep update"

alias hi="h install"
alias hu="h uninstall"

alias hst="h status"
alias hstns="hst --namespace"

alias hhi="h history"
alias hhiall="hhi --all"
alias hhiallns="hhiall --all-namespaces"
alias hhis="hhi --namespace"

alias hres="h rollback"
alias hresns="hres --namespace"

alias htest="h test"
alias htestns="htest --namespace"

alias hlint="h lint"

alias hrepo="h repo"
alias hrepoup="hrepo update"

alias hse="h search"
alias hseall="hse all"
alias hseallns="hseall --all-namespaces"
alias hsen="hse --namespace"

alias hsh="h show"
alias hshall="hsh all"
alias hshallns="hshall --all-namespaces"
alias hshns="hsh --namespace"

alias htem="h template"
alias htemns="htem --namespace"

alias hver="h version"

alias hhelp="h help"



alias t="terraform"
alias ti="t init"
alias tp="t plan"
alias ta="t apply"
alias td="t destroy"
alias tsh="t show"
alias tval="t validate"
alias tver="t version"
alias thelp="t help"