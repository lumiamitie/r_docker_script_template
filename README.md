# R docker script template

R과 Docker를 사용해 배치 스크립트를 작성하기 위한 템플릿 프로젝트. 크게 다음과 같이 구성되어 있다.

- 스크립트를 동작시키기 위해 필요한 환경을 Docker로 구성한다 (R 및 라이브러리)
- `modules` 라이브러리를 통해 스크립트를 모듈화한다

자세한 설명은 [블로그 포스팅](https://lumiamitie.github.io/r/dockerizing-r-batch-script/) 에서 확인!

## How to use

### Batch script 실행

```bash
# 프로젝트 디렉토리로 이동
cd r_docker_script_template

# 도커 빌드 후 지정된 스크립트 실행
docker-compose up --build
```

### 빌드 후 컨테이너 진입

개발/디버깅 작업을 위해 도커 컨테이너 내부로 진입하고 싶을 경우 다음과 같이 실행한다.

```bash
cd r_docker_script_template

# 이미지 빌드
docker-compose build
# 도커 컨테이너 내부로 진입하여 bash 실행
docker run -it --rm r_docker_script_template_svc_r_batch /bin/bash
```

# Resources

- [wahani/modules : Modules in R](https://github.com/wahani/modules)
- [An Introduction to Docker for R Users](https://colinfay.me/docker-r-reproducibility/)
- [Docker 101 for Data Scientists](https://environments.rstudio.com/docker.html)
