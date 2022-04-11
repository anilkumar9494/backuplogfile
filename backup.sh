#!/bin/bash
# Save Date and Time of the bash script
# execution inside
echo "I will just append to my custom file" >>/var/log/
cat backup.sh

echo "old file dates logfile"
grep $(date +"%Y-%m-%d") alternatives.log
grep $(date +"%Y-%m-%d") dpkg.log

echo "present date logfile"
grep $(date +"%Y-%m-%d") auth.log
grep $(date +"%Y-%m-%d") cloud-init-output.log
grep $(date +"%Y-%m-%d") kern.log
grep $(date +"%Y-%m-%d") syslog
grep $(date +"%Y-%m-%d") cloud-init.log

echo "new logfile list"
ls

echo " create a backup file "
tar cf alternatives.log.tar alternatives.log
echo "create a backupfile "
tar cf dpkg.log.tar dpkg.log

echo "your directory backup is created successfully"
mkdir backup

echo "file move to folder"
mv dpkg.log.tar backup
echo "file move to folder"
mv alternatives.log.tar backup

echo "file move to folder"
mv kern.log. backup
echo "file move to folder"
mv auth.log backup
echo "file move to folder"
mv cloud-init-output.log backup
echo "file move to folder"
mv cloud-init.log backup

cd  /var/log/backup

echo "create a directory"
mkdir dated

cd /var/log/backup/

echo "file move to folder"
mv dpkg.log.tar dated
echo "file move to folder"
mv alternatives.log.tar dated

echo "go to path "
cd /var/log/backup/dated

echo "check move folder list"
ls -lrt | grep "april 6"
ls -ltr

du -sh alternatives.log.tar
du -sh dpkg.log.tar

echo "aws  cli installation"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
echo "Install unzip the package"
apt install unzip

echo "Run the following command to unzip the download the file"
unzip awscliv2.zip

echo "Now run the installer, using:"
./aws/install
echo "To verify the installation, type"
aws --version
echo "Update system packages"
apt-get update
echo "Once the system packages are updated, run the following command to install AWS CLI"
apt-get install awscli -y
echo "On completion the installation, run the following command to verify"
aws --version
echo "Run the following command to configure access to aws account"
aws configure
echo "Enter the following details accordingly"

AWS Access Key ID [IAM user's Access key] :AKIAYWB26U3DFWWODN6J
AWS Secret Access Key [IAM user's secret key] :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
Default region name [Aws region] ap-south-1
Default output format [JSON format is fine]

echo "Configuring access to aws account"
which aws
echo "Use the following command to check symlink and installation path"
ls -l /usr/local/bin/aws

echo "backuplofile copy push s3 bucket"
 aws s3 cp /var/log/backup/dated/alternatives.log.tar s3://msitsolutionsbackuplogfile/backup/
 aws s3 cp /var/log/backup/dated/dpkg.log.tar s3://msitsolutionsbackuplogfile/backup/

