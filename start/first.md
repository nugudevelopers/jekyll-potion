---
depth_order: 1
---

# 처음 사용자

현재 jekyll-potion 은 Gem 으로서 동작하지 않는 Beta 버전입니다. 향후 Gem 으로 설치할 수 있는 작업이 준비가 될 때까지 불편하더라도 아래의 설치과정을 거쳐야 합니다.

\1. Jekyll 사이트를 생성합니다.

{% code %}
```bash
jekyll new {site_name}
```
{% endcode %}

\2. {site_name} 으로 이동한 후 아래의 작업을 진행합니다.
  * _`_posts` 폴더 삭제
    > jekyll-potion 은 post 기반으로 동작하지 않습니다.
  * `Gemfile` 삭제
  * `about.markdown` 삭제
  * `index.markdown` 삭제
  * `_config.yml` 삭제
  * `404.html` 삭제

\3. GitHub 저장소 본문 우측 상단에 `Code` 버튼을 누르고 `Download ZIP` 을 선택하여 zip 파일을 다운로드 합니다.

   ![Download ZIP](../assets/images/download_zip.png)

\4. 압축을 해제한 후, 다음의 작업을 진행합니다.
  * `_jekyll-potion` 폴더 복사
  * `_plugins` 폴더 복사
  * `assets` 폴더 복사
  * `Gemfile` 복사
  * `_config.yml` 복사
  * `_config.jekyll_potion.yml` 복사
  * `404.html` 복사
  * `_index.md` 복사 이후 `index.md` 파일로 이름 변경

\5. Bundle update

{% code %}
```bash
bundle update
```
{% endcode %}
 
\6. 서버 실행

{% code %}
```bash
bundle exec jekyll serve --config _config.yml,_config.jekyll_potion.yml --trace
```
{% endcode %}

\7. 웹브라우저로 `http://127.0.0.1:4000` 주소를 접속하여 아래의 화면 확인

  ![](../assets/images/hello_jekyll_potion.png)
