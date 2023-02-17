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

alreadyexists=true

if [ "$alreadyexists" = true ]; then
  echo "Container $containername does not exist"
  echo "Creating container in $accountname"
  echo "Account Name: $accountname Container Name: $containername Account Key: $accountkey"
  echo "Container $containername created"
  echo "Uploading files to $containername from $folderpath"
  echo "Uploading files to $containername complete"
else
  echo "Container $containername already exists"
  echo "Skipping container creation"
fi