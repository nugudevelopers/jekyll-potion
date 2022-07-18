---
depth_order: 2
---

# 시작하기

## 사전 준비

### 참여 인원에 대한 준비

\1. 참여하는 인원은 사이트 관리자, 문서 작성자 로 구분되어 있음을 간주합니다.

* 사이트 관리자는 문서의 형상관리가 가능해야 하며, 이를 통해 문서의 배포 주기를 관리합니다.
* 문서 작성자는 markdown 문서를 제작하고, `jekyll-potion` 에서 제공하는 다양한 기능을 사용할 수 있습니다.

{% alerts style="info" %}
참여하는 모든 인원은 공동작업을 위해 GitHub 에 대한 기본 사용법을 숙지하고 있어야 합니다.

또한 로컬 PC 에서 문서 작성을 한다면, 서버 구동을 위해 최소한 [Quickstart](https://jekyllrb.com/docs/) 정도는 숙지해야 합니다.
{% endalerts %}

\2. 참여하는 인원은 [Jekyll](https://jekyllrb.com/) 이 가능하면 설치되어야 합니다. [설치 가이드](https://jekyllrb.com/docs/installation/) 를 참고하여 시스템 환경에 맞게 설치합니다.

{% alerts style="info" %}
반드시 모든 인원이 반드시 [Jekyll](https://jekyllrb.com/) 이 설치되어야 하는 것은 아닙니다. [GitHub Pages](https://pages.github.com/) 로 개발환경을 갖추었다면, 설치하지 않고 GitHub 를 통해 간단한 편집이 가능합니다.

하지만 어떤 이 경우도 최소한의 GitHub 의 사용법은 숙지하고 있어야 합니다.
{% endalerts %}

\3. 사이트 운영자는 반드시 [Jekyll](https://jekyllrb.com/) 의 운영관리에 대한 사용법을 숙지해야 합니다.

{% alerts style="info" %}
`jekyll-potion` 은 개인 호스팅도 가능하지만, 기본 목표는 [GitHub Pages](https://pages.github.com/) 의 적용입니다. 따라서 반드시 구성원은 GitHub 저장소에 대한 `commit`, `pull-request` 방법을 익혀야 하며, 사이트 관리자는 이를 통해 코드 형상을 관리해야 하기 때문에 Git 을 통한 형상관리가 가능해야 합니다.
{% endalerts %}

\4. Jekyll-Potion 은 기본적으로 세팅된 theme 를 통해 설치만으로도 충분히 사이트 요소를 표현할 수 있습니다. 하지만, 만일 사이트를 서비스에 맞도록 꾸미기 위해서는 반드시 마크업, 디자인이 필요하며 `마크업 개발자`, `디자이너` 인력에 대한 고려가 이뤄져야 합니다.

### 구성 환경 준비

jekyll-potion 은 아래의 버전을 기준으로 작업이 되었습니다. 이미 다른 버전을 사용한 경우라면 버전의 조정이나 호환성 검증이 필요합니다.

|                                라이브러리                                |   버전   |
|:-------------------------------------------------------------------:|:------:|
|                   [Jekyll](https://jekyllrb.com/)                   | 4.2.2  |
| [Jekyll Spaceship](https://github.com/jeffreytse/jekyll-spaceship)  | 0.10.2 |
|        [Nokogiri](https://github.com/sparklemotion/nokogiri)        | 1.13.6 |

## 설치

위와 같은 환경이 구성이 준비되었다면, 이제 `jekyll-potion` 을 설치할 수 있습니다. 설치 방법은 상황에 맞게 아래와 같이 구분합니다.

* [처음 사용자](./start/first) : 이미 작성한 컨텐츠가 없으며, [Jekyll](https://jekyllrb.com/) 을 통해 문서 사이트를 최초 구축하는데 적합합니다.
* [문서가 존재하는 경우](./start/has-content) : markdown 문서를 가지고 있고 [Jekyll](https://jekyllrb.com/) 을 통해 문서 사이트를 새로 구축하는데 적합합니다.
* [마이그레이션](./start/migration) : [Jekyll](https://jekyllrb.com/) 로 작성한 사이트를 개인 호스팅, [GitHub Pages](https://pages.github.com/) 를 통해 운영하고 있고, `jekyll-potion` 을 전체 적용하고자 할 경우 적합합니다.
