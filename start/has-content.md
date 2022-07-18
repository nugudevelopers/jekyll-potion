---
depth_order: 2
---

# 문서가 존재하는 경우

구성된 문서 구조가 `디렉토리 구조`에 적합한지 입니다. 만일 이 구조에 맞지 않는 문서라면 `jekyll-potion` 을 적용할 수 없습니다.

또한 준비된 markdown 문서는 반드시 markdown 문법 구조에 맞아야 합니다.

## 디렉토리 구조로 변경하기

`jekyll-potion` 의 반드시  하위 문서 디렉토리 명과 상위 문서의 파일명이 같아야 합니다. 따라서 이 구조에 맞지 않다면, 이를 일치시키는 작업이 필요합니다.

## 계층 구조 내 순서 정하기

`jekyll-potion` 은 기본적으로 동일 레벨의 파일간의 우선순위를 결정하고, 이 순서를 기반으로 navigation 영역을 구성합니다.

동일 레벨간의 우선순위는 [Front Matter](https://jekyllrb.com/docs/front-matter/) 를 사용하여, 아래와 같이 `depth_order` 를 추가해야 합니다.

{% code title="depth_order Front Matter" %}
```yaml
---
depth_order: 1
---
```
{% endcode %}

{% alerts style="info" %}
`depth_order` 는 작은 숫자를 가질수록 우선순위가 높습니다.
{% endalerts %}

## `jekyll-potion` 적용하기

[처음 사용자](./first) 과정을 진행합니다.

## Site 구성하기

[사이트 설정](../config/site) 를 통해 Site 의 기본 정보를 설정합니다.

이후, 서버를 구동하여 문서들이 정상적으로 노출되는 것을 확인합니다.
