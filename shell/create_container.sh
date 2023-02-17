#!/bin/bash

while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    --account-name)
      accountname="$2"
      shift
      shift
      ;;
    --container-name)
      containername="$2"
      shift
      shift
      ;;
    --folder-path)
      folderpath="$2"
      shift
      shift
      ;;
    --account-key)
      accountkey="$2"
      shift
      shift
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

alreadyexists=$(az storage container exists --name $containername --account-name $accountname --account-key $accountkey --output tsv --query exists)

if [ "$alreadyexists" = false ]; then
  echo "Container $containername does not exist"
  echo "Creating container in $accountname"
  created=$(az storage container create --name $containername --account-name $accountname --account-key $accountkey --output tsv --query created)
  if [ "$created" = false ]; then
    echo "Container $containername creation failed"
    exit 1
  fi
  echo "Container $containername created"
  echo "Uploading files to $containername from $folderpath"
  az storage blob upload-batch --destination $containername --source $folderpath --account-name $accountname --account-key $accountkey
  status=$(echo $?)
  if [ $status -eq 0 ] then
    echo "Uploading files to $containername complete"
  else
    echo "Uploading files to $containername failed"
  fi
else
  echo "Container $containername already exists"
  echo "Skipping container creation"
fi