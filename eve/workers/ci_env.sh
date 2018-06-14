#!/bin/sh

if [ "$1" == "env" ]; then
  CLI_FLAG="env"
  CI_PREFIX=""
  printf -- "\
--env ZENKO_K8S_NAMESPACE=$ZENKO_K8S_NAMESPACE \
--env ZENKO_HELM_RELEASE=$ZENKO_HELM_RELEASE \
--env NUM_CPUS=1 "
elif [ "$1" == "set" ]; then
  CLI_FLAG="set"
  CI_PREFIX="ci."
else
  echo "usage: ci_env.sh [set|env]"
fi

FLAGS="\
--$CLI_FLAG ${CI_PREFIX}AWS_GCP_BACKEND_ACCESS_KEY=$AWS_GCP_BACKEND_ACCESS_KEY \
--$CLI_FLAG ${CI_PREFIX}AWS_GCP_BACKEND_ACCESS_KEY_2=$AWS_GCP_BACKEND_ACCESS_KEY_2 \
--$CLI_FLAG ${CI_PREFIX}AWS_GCP_BACKEND_SECRET_KEY=$AWS_GCP_BACKEND_SECRET_KEY \
--$CLI_FLAG ${CI_PREFIX}AWS_GCP_BACKEND_SECRET_KEY_2=$AWS_GCP_BACKEND_SECRET_KEY_2 \
--$CLI_FLAG ${CI_PREFIX}AWS_S3_BACKBEAT_ACCESS_KEY=$AWS_S3_BACKBEAT_ACCESS_KEY \
--$CLI_FLAG ${CI_PREFIX}AWS_S3_BACKBEAT_SECRET_KEY=$AWS_S3_BACKBEAT_SECRET_KEY \
--$CLI_FLAG ${CI_PREFIX}AWS_S3_BACKBEAT_BUCKET_NAME=$AWS_S3_BACKBEAT_BUCKET_NAME \
--$CLI_FLAG ${CI_PREFIX}AWS_S3_BACKEND_ACCESS_KEY=$AWS_S3_BACKEND_ACCESS_KEY \
--$CLI_FLAG ${CI_PREFIX}AWS_S3_BACKEND_ACCESS_KEY_2=$AWS_S3_BACKEND_ACCESS_KEY_2 \
--$CLI_FLAG ${CI_PREFIX}AWS_S3_BACKEND_SECRET_KEY=$AWS_S3_BACKEND_SECRET_KEY \
--$CLI_FLAG ${CI_PREFIX}AWS_S3_BACKEND_SECRET_KEY_2=$AWS_S3_BACKEND_SECRET_KEY_2 \
--$CLI_FLAG ${CI_PREFIX}AWS_S3_BUCKET_NAME=$AWS_S3_BUCKET_NAME \
--$CLI_FLAG ${CI_PREFIX}AWS_S3_BUCKET_NAME_2=$AWS_S3_BUCKET_NAME_2 \
--$CLI_FLAG ${CI_PREFIX}AZURE_BACKBEAT_CONTAINER_NAME=$AZURE_BACKBEAT_CONTAINER_NAME \
--$CLI_FLAG ${CI_PREFIX}AZURE_BACKEND_ACCESS_KEY=$AZURE_BACKEND_ACCESS_KEY \
--$CLI_FLAG ${CI_PREFIX}AZURE_BACKEND_ACCESS_KEY_2=$AZURE_BACKEND_ACCESS_KEY_2 \
--$CLI_FLAG ${CI_PREFIX}AZURE_BACKEND_ACCOUNT_NAME=$AZURE_BACKEND_ACCOUNT_NAME \
--$CLI_FLAG ${CI_PREFIX}AZURE_BACKEND_ACCOUNT_NAME_2=$AZURE_BACKEND_ACCOUNT_NAME_2 \
--$CLI_FLAG ${CI_PREFIX}AZURE_BACKEND_CONTAINER_NAME=$AZURE_BACKEND_CONTAINER_NAME \
--$CLI_FLAG ${CI_PREFIX}AZURE_BACKEND_CONTAINER_NAME_2=$AZURE_BACKEND_CONTAINER_NAME_2 \
--$CLI_FLAG ${CI_PREFIX}AZURE_BACKEND_ENDPOINT=$AZURE_BACKEND_ENDPOINT \
--$CLI_FLAG ${CI_PREFIX}AZURE_BACKEND_ENDPOINT_2=$AZURE_BACKEND_ENDPOINT_2 \
--$CLI_FLAG ${CI_PREFIX}GCP_BUCKET_NAME=$GCP_BUCKET_NAME \
--$CLI_FLAG ${CI_PREFIX}GCP_BUCKET_NAME_2=$GCP_BUCKET_NAME_2 \
--$CLI_FLAG ${CI_PREFIX}GCP_CRR_BUCKET_NAME=$GCP_CRR_BUCKET_NAME \
--$CLI_FLAG ${CI_PREFIX}GCP_CRR_MPU_BUCKET_NAME=$GCP_CRR_MPU_BUCKET_NAME \
--$CLI_FLAG ${CI_PREFIX}GCP_MPU_BUCKET_NAME=$GCP_MPU_BUCKET_NAME \
--$CLI_FLAG ${CI_PREFIX}GCP_MPU_BUCKET_NAME_2=$GCP_MPU_BUCKET_NAME_2 \
--$CLI_FLAG ${CI_PREFIX}AWS_S3_BACKBEAT_SRC_BUCKET_NAME=$AWS_S3_BACKBEAT_SRC_BUCKET_NAME \
--$CLI_FLAG ${CI_PREFIX}GCP_CRR_SRC_BUCKET_NAME=$GCP_CRR_SRC_BUCKET_NAME \
--$CLI_FLAG ${CI_PREFIX}AZURE_BACKBEAT_SRC_CONTAINER_NAME=$AZURE_BACKBEAT_SRC_CONTAINER_NAME"

if [ ! -z "$ZENKO_ACCESS_KEY" ]; then
	FLAGS="$FLAGS --$CLI_FLAG ${CI_PREFIX}ZENKO_ACCESS_KEY=$ZENKO_ACCESS_KEY"
fi

if [ ! -z "$ZENKO_SECRET_KEY" ]; then
	FLAGS="$FLAGS --$CLI_FLAG ${CI_PREFIX}ZENKO_SECRET_KEY=$ZENKO_SECRET_KEY"
fi

echo "$FLAGS"