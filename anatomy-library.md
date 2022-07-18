---
depth_order: 4
---

# Library 구조

## 기본 구조

`jekyll-potion` 은 `_jekyll-potion` 을 프로젝트 root 에 위치함으로서 설치되며, 아래와 같은 구조를 갖습니다.

| 디렉토리            | 설명                                                                  |
|-----------------|---------------------------------------------------------------------|
| `.github`       | [GitHub Pages](https://pages.github.com/) 포팅을 위해 준비된 workflow 들을 보관 |
| `lib`           | `jekyll-potion` Library Root                                        |
| `lib.tags`      | `jekyll-potion` 을 설치함으로서 사용할 수 있는 liquid 태그를 보관                     |
| `lib.theme`     | `jekyll-potion` 을 설치함으로서 사용할 수 있는 기본 theme 정보를 보관                   |
| `lib.processor` | `jekyll-potion` 을 설치함으로서 사용할 수 있는 processor 정보를 보관                  |
| `lib.models`    | `jekyll-potion` 에서 사용할 model 을 보관                                   |

{% alerts style="info" %}
`jekyll-potion` 은 `_jekyll-potion` 내 요소를 구동하기 위해 반드시 `_plugins` 디렉토리에 `jekyll-potion.rb` 파일을 위치해야 합니다.
{% endalerts %}

## Life-Cycle

`jekyll-potion` 은 [Jekyll](https://jekyllrb.com/) 에서 제공하는 Life-Cycle 에 맞춰 Hook 을 통해 수신된 event 를 통해 구동됩니다. [Jekyll](https://jekyllrb.com/) 이 제공하는 Hook 은 아래의 링크를 참고하세요.

{% link url="https://jekyllrb.com/docs/plugins/hooks/" caption="Jekyll Hook" %}

주요 event 에 대한 처리는 다음과 같습니다.

| owner   | event          | `jekyll-potion` 이 하는 일                                                                                           |
|---------|----------------|------------------------------------------------------------------------------------------------------------------|
| `:site` | `:after_init`  | `jekyll-potion` 이 구동되며, 각종 설정을 통해 processor를 로드합니다.<br/>이 때 theme 에 대한 설정을 로드합니다.                                |
| `:site` | `:post_read`   | `jekyll-potion` 에 필요한 정적 파일, theme 에서 필요한 정적 파일을 detect 하거나, navigation 등에서 필요한 기초 데이터를 생성합니다.                   |
| `:page` | `:pre_render`  | `jekyll-potion` 에서 다룰 페이지 내용이 없는 경우 {% raw %}`{% empty %}`{% endraw %} 태그를 생성합니다.                                |
| `:page` | `:post_render` | rendering 이 마친 페이지의 본문을 분석하여, 경로를 조정하거나, 검색 index 를 생성합니다.<br/>또한 이 시점에 HTML `<head>` 에 포함되어야 하는 meta 정보를 추가합니다. |
| `:site` | `:post_render` | (`:site`, `:post_read`) 에서 detect 된 정적 파일, `jekyll-potion` 에 필요한 정적 파일들을 Site 에 포함시킵니다.                          |
