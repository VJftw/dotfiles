echo "Exporting AWS credentials from $1"
cat $1
export AWS_ACCESS_KEY_ID=$(tail -n1 $1 | cut -d ',' -f1 | sed 's/[^0-9A-Z]*//g');
export AWS_SECRET_ACCESS_KEY=$(tail -n1 $1 | cut -d ',' -f2 | sed 's/[^0-9A-Za-z/+=]*//g');
