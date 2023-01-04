---
depth_order: 3
---

# make_theme_processor

`_config.jekyll_potion.yml` 을 통해 설정된 정보를 바탕으로 `theme` 를 생성하고 필요한 정적 파일을 빌드 결과물로 포함시킵니다.

## Hook event

| owner   | event          | 설명                                                                      |
|---------|----------------|-------------------------------------------------------------------------|
| `:site` | `:after_init`  | `theme` 정보를 기준으로 [Jekyll](https://jekyllrb.com/) 의 설정을 overwrite 합니다.   |
| `:site` | `:post_read`   | `theme` 정보를 기준으로 필요한 정적 파일을 생성합니다.                                      |
| `:page` | `:post_render` | `theme` 정보를 기준으로 필요한 정적 파일을 HTML meta 태그로 추가합니다.                        |
| `:site` | `:post_render` | [Jekyll](https://jekyllrb.com/) 이 reload 된 경우 기존의 파일이 중복생성되지 않도록 정리합니다. |
