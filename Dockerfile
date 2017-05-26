FROM lambci/lambda-base:build

MAINTAINER Diego Moreira

ENV PATH=/var/lang/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LD_LIBRARY_PATH=/var/lang/lib:/lib64:/usr/lib64:/var/runtime:/var/runtime/lib:/var/task:/var/task/lib \
    AWS_EXECUTION_ENV=AWS_Lambda_nodejs6.10 \
    NODE_PATH=/var/runtime:/var/task:/var/runtime/node_modules \
    npm_config_unsafe-perm=true

RUN rm -rf /var/runtime /var/lang && \
  curl https://lambci.s3.amazonaws.com/fs/nodejs6.10.tgz | tar -zx -C /

RUN touch /etc/yum.repos.d/mongodb-org-3.4.repo

COPY mongodb-org-3.4.repo /etc/yum.repos.d/

RUN yum install -y mongodb-org

RUN service mongod start

CMD ["npm", "rebuild"]
