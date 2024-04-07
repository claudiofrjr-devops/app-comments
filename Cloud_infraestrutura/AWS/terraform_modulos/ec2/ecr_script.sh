# Obter a data de criação da imagem atualmente em execução
docker inspect --format='{{.Created}}' <container_name> > /tmp/data-imagem-run.txt

# Obter a data da imagem mais recente no Amazon ECR
aws ecr describe-images --repository-name hml-lab-globo --query "sort_by(imageDetails,& imagePushedAt)[-1].imagePushedAt" --output text > /tmp/data-imagem-atualizada.txt

# Ler as datas dos arquivos temporários
RUN_IMAGE=$(cat /tmp/data-imagem-run.txt)
UPDATE_IMAGE=$(cat /tmp/data-imagem-atualizada.txt)

# Comparar as datas das imagens
if [ "$RUN_IMAGE" != "$UPDAYE_IMAGE" ]; then
    echo "Nova versão da imagem disponível. Atualizando contêiner..."

    # Parar e remover o contêiner atual
    docker stop api-comentarios
    docker rm api-comentarios

    # Baixar e executar a nova versão da imagem
    docker pull ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/hml-lab-globo :${LATEST_IMAGE_TAG}
    docker run -dti -p 80:8080 --name <container_name> ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/<repository_name>:${LATEST_IMAGE_TAG}
else
    echo "Nenhuma nova versão da imagem disponível."
fi
