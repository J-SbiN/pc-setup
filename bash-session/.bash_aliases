#!/bin/bash

# Listing
alias ll="ls -lh"
alias lk="ls -halv --group-directories-first"
alias lm="ls -alv"

# Kubrnetes
alias kubectl="kubectl.exe"
alias kc="kubectl"

function _connect-aks {
    local kluster="aks-mosl-${1}-001"

    local dev_res_group="rg-mosl-devtest-001"
    local dev_subscription="d349c060-a50e-4896-810c-e6087c27092d"

    local supp_res_group="rg-mosl-support-001"
    local prod_res_group="rg-mosl-production-001"
    local prod_subscription="13f37c47-b9f4-4d28-8cad-ab62735aba82"


    case ${1} in
        prod) local subscription="${prod_subscription}"
              local res_group="${prod_res_group}"
              ;;
        supp) local subscription="${prod_subscription}"
              local res_group="${supp_res_group}"
              ;;
        *)    local subscription="${dev_subscription}"
              local res_group="${dev_res_group}"
              ;;
    esac

    az account set --subscription "${subscription}"
    az aks get-credentials --resource-group "${res_group}" --name "${kluster}"
}


# Azure
function _create_az_vargroup {
    # Secret variables should be managed using az pipelines variable-group variable commands
    local var_group_name="${1}"
    local variables="${@:2}"
    local organization_url="${DEVOPS_ORG_URL-https://dev.azure.com/MOServices}"
    local project_name="${DEVOPS_PROJ-Bilaterals}"

    [ -z $variables ] && local variables="dummyVar=delete-me"

    az pipelines variable-group create \
        --org "${organization_url}" \
        --project "${project_name}" \
        --name "${var_group_name}" \
        --variables "${variables}"
}

function _get_az_vargroup_id {
    local organization_url="${DEVOPS_ORG_URL-https://dev.azure.com/MOServices}"
    local project_name="${DEVOPS_PROJ-Bilaterals}"
    local var_group_name="${1}"

    az pipelines variable-group list \
       --query "[?name=='${var_group_name}'].id | [0]" \
       --organization "${organization_url}" \
       --project "${project_name}"
}

function _create_az_vargroup_var {
    local var_group_name="${1}"
    local var_name="${2}"
    local var_value="${3}"
    local secret="${4-false}"
    local organization_url="${DEVOPS_ORG_URL-https://dev.azure.com/MOServices}"
    local project_name="${DEVOPS_PROJ-Bilaterals}"
    local var_group_id=$(_get_az_vargroup_id ${var_group_name})

    az pipelines variable-group variable create \
        --org "${organization_url}" \
        --project "${project_name}" \
        --group-id "${var_group_id}" \
        --name "${var_name}" \
        --value "${var_value}" \
        --secret "${secret}"
}

function _create_az_vargroup_var_in_vargroup {
   local var_group_id="${1}"
   local var_name="${2}"
   local var_value="${3}"
   local secret="${4-false}"
   local organization_url="${DEVOPS_ORG_URL-https://dev.azure.com/MOServices}"
   local project_name="${DEVOPS_PROJ-Bilaterals}"

   az pipelines variable-group variable create \
      --org "${organization_url}" \
      --project "${project_name}" \
      --group-id "${var_group_id}" \
      --name "${var_name}" \
      --value "${var_value}" \
      --secret "${secret}"
}

function _delete_az_vargroup_var {
    local var_group_name="${1}"
    local var_name="${2}"
    local organization_url="${DEVOPS_ORG_URL-https://dev.azure.com/MOServices}"
    local project_name="${DEVOPS_PROJ-Bilaterals}"
    local var_group_id=$(_get_az_vargroup_id "${var_group_name}")

    az pipelines variable-group variable delete \
        --org "${organization_url}" \
        --project "${project_name}" \
        --group-id "${var_group_id}" \
        --name "${var_name}" \
        --yes
}

function _create_az_vargroup_vars {
    local var_group_name="${1}"
    local var_group_id="$(_get_az_vargroup_id "${var_group_name}")"
    local variales_file="${2}"
    local flag=1

    if [[ -z ${var_gourp_id} ]]; then
        local dummyName="dummyVar"
        local dummyVar="${dummyName}=delete-me"
        _create_az_vargroup "${var_group_name}" "${dummyVar}"
        local var_group_id="$(_get_az_vargroup_id "${var_group_name}")"
        local flag=0
    else
        echo "Group '${var_group_name}' already exists with id '${var_group_id}'."
    fi

    old_ifs="${IFS}"
IFS='
' 
    for line in $(<${variales_file}); do
        IFS=" "
        _create_az_vargroup_var_in_vargroup "${var_group_id}" ${line}
    done

    [ ${flag} -eq 0 ] && _delete_az_vargroup_var "${var_group_name}" "${dummyName}"
}

