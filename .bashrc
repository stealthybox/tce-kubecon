# tanzu cli bash completion
command -v tanzu >/dev/null && source <(tanzu completion bash) 2>/dev/null
# kapp cli bash completion
command -v kapp >/dev/null && source <(kapp completion bash) 2>/dev/null
