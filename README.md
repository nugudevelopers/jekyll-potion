# jekyll-potion

<p align="left">
  <a href="https://badge.fury.io/rb/jekyll-potion">
    <img src="https://badge.fury.io/rb/jekyll-potion.svg" alt="Gem Version" />
  </a>
  <a href="https://github.com/nugudevelopers/jekyll-potion/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/License-Apache_2.0-brightgreen.svg" alt="License" />
  </a>
</p>

## 소개

`jekyll-potion` 은 [Jekyll](https://jekyllrb.com/) 기반의 NUGU developers 문서 사이트 제작을 위해 작성된 [Jekyll](https://jekyllrb.com/) [Plugins](https://jekyllrb.com/docs/plugins/) 로서, 향후 유사한 형태의 문서 사이트 구축시 빠르고 쉽게 작업할 수 있도록 고려된 도구입니다.

`jekyll-potion` 은 간단한 설정만으로 제공하는 Processor, Tag 를 사용하여 문서 작성자로 하여금 보다 풍부한 문서를 작성할 수 있도록 도와주며 커스터마이징 과정을 통해 동일한 기능을 다른 look & feel 을 가질 수 있도록 합니다.  

## 목표

* 문서 작성자로 하여금 기본 markdown 문법, 제공되는 태그를 활용하여 향상된 문서를 작성할 수 있도록 함
* 제공되는 기본 테마를 커스터마이징하거나 새롭게 만들어, 새로운 look & feel 을 문서 사이트를 구축할 수 있도록 함
* 제공되는 Processor 를 통해, 문서 navigation, favicon, 검색 등의 기능을 지원

## 시스템 요구사항

* jekyll >= 4.3.1

## 설치

`jekyll-potion` 은 사이트의 Gemfile, config 파일(ex> _config.yml)  에 아래의 내용을 추가함으로서 사용이 가능합니다.

```ruby
group :jekyll_plugins do
  gem "jekyll-potion", "1.0.0"
end
```

```yaml
plugins:
  - jekyll-potion
```

## 사용하기

`jekyll-potion` 이 적용된 데모 사이트이자, 설명 사이트인 [jekyll-potion](https://nugudevelopers.github.io/jekyll-potion) 을 통해 자세한 사용법을 확인하실 수 있습니다.
