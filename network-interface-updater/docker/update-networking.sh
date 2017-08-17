while [[ $# -gt 1 ]]
do
    key="$1"

    case $key in
        -i|--image)
        IMAGE="$2"
        shift # past argument
        ;;
        -a|--ip-address)
        IP_ADDRESS="$2"
        shift # past argument
        ;;
        -s|--subnet-mask)
        SUBNET_MASK="$2"
        shift # past argument
        ;;
        -d|--ssid)
        SSID="$2"
        shift # past argument
        ;;
        -p|--passphrase)
        PASSPHRASE="$2"
        shift # past argument
        ;;
        *)
        # unknown option
        echo "unknown option $key $2"
        exit 1
        ;;
    esac
    shift
done

if [[ -z $IMAGE || -z $IP_ADDRESS || -z $SUBNET_MASK || -z $SSID || -z $PASSPHRASE ]]
then
    echo `date`" - "
    echo `date`" - Usage: ./update-networking.sh "
    exit 1
fi
MOUNT_DIR=`dirname $IMAGE`
IMAGE_NAME=`basename $IMAGE`

docker run --privileged -it -v $MOUNT_DIR/:'/images' \
-e IMAGE_NAME=$IMAGE_NAME \
-e IP_ADDRESS=$IP_ADDRESS \
-e SUBNET_MASK=$SUBNET_MASK \
-e SSID=$SSID \
-e PASSPHRASE=$PASSPHRASE \
update-networking