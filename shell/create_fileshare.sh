#!/bin/bash

while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    --account-name)
      accountname="$2"
      shift
      shift
      ;;
    --share-name)
      sharename="$2"
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

alreadyexists=$(az storage share exists --name $sharename --account-name $accountname --account-key $accountkey --output tsv --query exists)

if [ "$alreadyexists" = false ]; then
  echo "Fileshare $sharename does not exist"
  echo "Creating fileshare in $accountname"
  created=$(az storage share create --name $sharename --account-name $accountname --account-key $accountkey --output tsv --query created)
  if [ "$created" = false ]; then
    echo "Fileshare $sharename creation failed"
    exit 1
  fi
  echo "Fileshare $sharename created"
  echo "Uploading files to $sharename from $folderpath"
  az storage file upload-batch --destination $sharename --source $folderpath --account-name $accountname --account-key $accountkey
  status=$(echo $?)
  if [ $status -eq 0 ]; then
    echo "Uploading files to $sharename complete"
  else
    echo "Uploading files to $sharename failed"
  fi
else
  echo "Fileshare $sharename already exists"
  echo "Skipping fileshare creation"
fi

# bash create_fileshare.sh --account-name $accountname --share-name $sharename --folder-path $folderpath --account-key $accountkey