sudo apt-get -y update
suod apt-get -y upgrade
sudo apt-get -y install build-essential cmake libopenmpi-dev libopenblas-dev liblapack-dev libarmadillo-dev
sudo apt-get -y install r-base gnuplot
sudo apt-get -y install python-dev
curl "https://bootstrap.pypa.io/pip/2.7/get-pip.py" -o get-pip.py
sudo python get-pip.py
rm get-pip.py
pip2 install numpy scipy pandas sklearn
pip2 install tensorflow==1.14.0
python linux_build.py
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1MlX_3OF3zKLKocFKVWYK5yBOfXHTaDBW' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1MlX_3OF3zKLKocFKVWYK5yBOfXHTaDBW" -O soccer_full_normal.txt && rm -rf /tmp/cookies.txt
mv soccer_full_normal.txt TestingFramework/bin/Debug/data/soccer_full/
