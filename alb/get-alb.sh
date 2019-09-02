#!/usr/bin/env bash

# export LB_ARN="arn:aws:elasticloadbalancing:us-east-1..."

if [[ -z "${LB_ARN}" ]]; then 
   echo -e "Enter LB Arn: \n"
   read  LB_ARN
else
   echo "LB ARN = $LB_ARN"
fi

echo -e "\n### LB $LB_ARN"
aws elbv2 describe-load-balancers --load-balancer-arns  $LB_ARN

echo -e "\n### Listeners $LB_ARN"
aws elbv2 describe-listeners --load-balancer-arn  $LB_ARN

echo -e "\n### Target Groups $LB_ARN"
aws elbv2 describe-target-groups --load-balancer-arn=$LB_ARN

LISTENERS_ARNS=$(aws elbv2 describe-listeners --load-balancer-arn  $LB_ARN  | jq -r '.Listeners | map(.ListenerArn) | join(" ")')

for arn in ${LISTENERS_ARNS}
do
  echo -e "\n### $arn"
  aws elbv2 describe-rules --listener-arn $arn
done

