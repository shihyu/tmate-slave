#!/bin/bash
gen_key() {
  keytype=$1
  ks="${keytype}_"
  key="keys/ssh_host_${ks}key"
  if [ ! -e "${key}" ] ; then
    if ssh-keygen --help 2>&1 | grep -e '-E ' > /dev/null; then
      ssh-keygen -t ${keytype} -f "${key}" -N '' -E md5 -C 'shihyu'
    else
      ssh-keygen -t ${keytype} -f "${key}" -N '' -C 'shihyu'
    fi
    return $?
  fi
}

mkdir -p keys
gen_key rsa && gen_key ecdsa || exit 1
