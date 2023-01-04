---
depth_order: 6
---

# make_favicon_processor 

설정된 favicon 정보를 통해 관련된 이미지 파일, `manifest.json` 등을 찾고, HTML meta 태그를 추가합니다. 

favicon 을 페이지에 추가하는 방법은 [favicon 적용](../../start/favicon) 을 참고해주세요.

## Hook event

| owner   | event          | 설명                                                         |
|---------|----------------|------------------------------------------------------------|
| `:site` | `:post_read`   | `site.favicon` 에 설정된 페이지의 내용을 분석하여, 추가되어야 하는 모든 파일을 검색합니다. |
| `:page` | `:post_render` | 분석된 내용을 바탕으로 페이지별 추가되어야 하는 요소를 HTML meta 태그로 추가합니다.        |
| `:site` | `:post_render` | 추가되어야 하는 모든 파일을 빌드 결과물에 추가합니다.                             |

생성되는 meta 태그는 `site.favicon` 에 작성된 모든 meta 태그입니다.

{% alerts style="warning" %}
`site.favicon` 에 등록된 HTML 파일의 경로내 모든 파일이 추가되지 않습니다.

`site.favicon` 에 등록된 HTML 파일 안에 meta 태그, `manifest.json` 내 src 등을 분석하여, 추가가 필요한 파일만을 추가하며, 그 외의 `site.favicon` 에 등록된 HTML 파일의 경로내 파일은 빌드 결과물에서 제외됩니다.  
{% endalerts %}
