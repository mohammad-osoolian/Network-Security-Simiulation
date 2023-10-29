echo ------------------------------------------
echo building attacker image
echo ------------------------------------------
cd attacker-image
docker build . -t attacker:latest
cd ..

echo ------------------------------------------
echo building target image
echo ------------------------------------------
cd target-image
docker build . -t target:latest
cd ..

echo ------------------------------------------
echo building web image
echo ------------------------------------------
cd web-image
docker build . -t web:latest
cd ..
