---
depth_order: 13
---

# make_og_tag_processor 

문서내 정보를 분석해 [og tag](https://ogp.me/) 를 생성합니다.

생성되는 태그는 아래와 같습니다.

| tag 명          | 설명                                                                                                                                  |
|----------------|-------------------------------------------------------------------------------------------------------------------------------------|
| og:url         | 페이지의 절대 경로                                                                                                                          |
| og:type        | website                                                                                                                             |
| og:title       | [Front Matter](https://jekyllrb.com/docs/front-matter/)에 정의된, 또는 [make_title_processor](./make-title-processor) 에 의해 분석된 문서의 title  |
| og:description | [Front Matter](https://jekyllrb.com/docs/front-matter/)에 정의된 description                                                            |
| og:image       | [Site 설정](../../config/site) 에 설정중 `site.icon`                                                                                      |

## Hook event

| owner   | event          | 설명                                |
|---------|----------------|-----------------------------------|
| `:page` | `:post_render` | 문서를 분석하여 og tag 를 생성하고 문서에 추가합니다. |
