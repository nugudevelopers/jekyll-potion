---
depth_order: 1
---

# make_base_javascript_processor 

`jekyll-potion` 에 필요한 정적 파일들을 [processor 설정](../../config/processor), [태그 설정](../../config/theme#태그-설정) 을 통해 로드된 설정을 통해 생성합니다.

## Hook event

| owner   | event          | 설명                                      |
|---------|----------------|-----------------------------------------|
| `:site` | `:post_read`   | 설치해야 할 javascript 파일을 설정에 맞게 생성합니다.     |
| `:page` | `:post_render` | 설치 대상 javascript 를 각 페이지의 HTML 에 추가합니다. |
| `:site` | `:post_render` | 설치 대상 javascript 를 빌드 결과물에 추가합니다.       |

위 과정을 통해 생성되는 파일은 아래와 같습니다.

| 파일명                 | 생성 위치                             | 설명                                                      |
|---------------------|-----------------------------------|---------------------------------------------------------|
| jquery-3.6.0.min.js | `theme[].assets.target_root_path` | `jekyll-potion` 에서 제공하는 태그를 구동시키기 위한 javascript library |
| code.js             | `theme[].assets.target_root_path` | `code` 태그를 구동시키기 위한 javascript library                  |
| navigation.js       | `theme[].assets.target_root_path` | `navigation` 태그를 구동시키기 위한 javascript library            |
| tabs.js             | `theme[].assets.target_root_path` | `tabs` 태그를 구동시키기 위한 javascript library                  |

## javascript 사용

생성된 javascript 중 태그의 동작을 위해 사용되는 javascript는 `code.js`, `navigation.js`, `tabs.js` 입니다.

해당 javascript 의 소스 코드, 사용법 각각의 태그 설명 페이지에서 확인하실 수 있습니다.

| 파일명           | 사용 태그                     |
|---------------|---------------------------|
| code.js       | [code](../tag/code)       |
| navigation.js | [code](../tag/navigation) |
| tabs.js       | [code](../tag/tabs)       |
