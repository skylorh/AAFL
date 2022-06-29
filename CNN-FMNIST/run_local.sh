rank=("01" "02" "03" "04" "05" "06" "07" "08" "09" "10")
# rank=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")

port='21110'
epoch='10000'
alpha='0.0'
datanum_idx='0'
pattern_idx='2'

# python /root/AAFL/client.py --world_size 10 --dataset_type FashionMNIST --model_type CNN --lr 0.0001 --datanum_idx 0 --pattern_idx 2 --alpha 0.0 --epochs 10000 --rank 1 --port 21110

# python /root/AAFL/server_thread.py --world_size 10 --dataset_type FashionMNIST --model_type CNN --lr 0.0001 --datanum_idx 0 --pattern_idx 2 --alpha 0.0 --epochs 10000 --rank 0 --port 21110


# python /root/AAFL/client.py --world_size 10 --dataset_type FashionMNIST --model_type CNN --lr 0.0001 --datanum_idx $datanum_idx --pattern_idx $pattern_idx --alpha $alpha --epochs $epoch --rank 1 --port $port > ./log/client1_log.txt &

for i in 0 1 2 3 4 5 6 7 8 9
do
python ../client.py --world_size 10 --dataset_type FashionMNIST --model_type CNN --lr 0.0001 --datanum_idx $datanum_idx --pattern_idx $pattern_idx --alpha $alpha --epochs $epoch --rank ${rank[$i]} --port $port > ./log/client${rank[$i]}_log.txt &
done
python /root/AAFL/server_thread.py --world_size 10 --dataset_type FashionMNIST --model_type CNN --alpha $alpha --lr 0.0001 --datanum_idx $datanum_idx --pattern_idx $pattern_idx --epochs $epoch --rank 0 --port $port

