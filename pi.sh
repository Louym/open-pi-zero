export TRANSFORMERS_CACHE=/home/yuming/models/
fractal_beta=/home/yuming/models/open-pi-zero/fractal_beta_step29576_2024-12-29_13-10_42.pt
bridge_beta=/home/yuming/models/open-pi-zero/bridge_beta_step19296_2024-12-26_22-30_42.pt
# SAPIEN_RENDERER=egl /mnt/backup/opt/nvidia/nsight-systems/2023.2.1/bin/nsys profile -c cudaProfilerApi python scripts/try_checkpoint_in_simpler.py \
#     --task google_robot_pick_horizontal_coke_can \
#     --checkpoint_path $fractal_beta \
#     --recording --use_torch_compile
SAPIEN_RENDERER=egl CUDA_LAUNCH_BLOCKING=1 CUDA_VISIBLE_DEVICES=0 python scripts/try_checkpoint_in_simpler.py \
    --task google_robot_pick_horizontal_coke_can \
    --checkpoint_path $fractal_beta \
    --recording --quant_action #--quant_joint_model --use_torch_compile #--quant_VT
    # --use_torch_compile
echo ":)"
# SAPIEN_RENDERER=egl CUDA_VISIBLE_DEVICES=0 python scripts/try_checkpoint_in_simpler.py \
#     --task widowx_carrot_on_plate \
#     --checkpoint_path $bridge_beta \
#     --recording \
#     --use_bf16 
    #--use_torch_compile # first batch will be slow

# /mnt/backup/opt/nvidia/nsight-systems/2023.2.1/bin/nsys profile -c cudaProfilerApi
# export TRANSFORMERS_CACHE=/home/yuming/workspace/models/
# # CUDA_VISIBLE_DEVICES=0 python src/model/vla/pizero.py --text_only --load_pretrained_weights 
# for i in 0
# do  
#     echo "------------------------------------------------------------------------"
#     echo $i
#     echo "text_only"
#     CUDA_VISIBLE_DEVICES=0 python src/model/vla/efficientpizero.py --text_only --load_pretrained_weights 
#     # echo "loss_only"
#     # CUDA_VISIBLE_DEVICES=0 python src/model/vla/efficientpizero.py --loss_only --load_pretrained_weights --quant_VT #--quant_joint_model
#     # echo "all"
#     # CUDA_VISIBLE_DEVICES=0 python src/model/vla/efficientpizero.py --load_pretrained_weights --quant_VT #--quant_joint_model
# done




# /opt/nvidia/nsight-systems/2023.2.1/bin/nsys profile python src/model/vla/pizero.py --loss_only --load_pretrained_weights --quant_VT --quant_joint_model