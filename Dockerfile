FROM public.ecr.aws/docker/library/node:17-alpine

WORKDIR /usr/src/app

COPY . .

CMD ["echo", "[FAKE] Executing migrations .."]
