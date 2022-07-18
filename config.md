---
depth_order: 3
---

# 설정

`jekyll-potion` 은 [Jekyll](https://jekyllrb.com/) 의 기본 설정 파일인 `_config.yml` 을 override 하는 `_config.jekyll_potion.yml` 을 통해 설정값을 읽어들입니다.

{% alerts style="info" %}
**`jekyll-potion` 이 설정 파일을 override 하는 이유**

`jekyll-potion`은 구동을 위해 다양한 기본 설정값을 구동시점(`:site`, `:after_init`) 에 변경합니다. 때문에 명시적으로 값을 override 한다는 의미로 기존 설정파일을 건드리지 않고, 추가하는 형태로 구현되었습니다. 
{% endalerts %}

세부 항목은 아래와 같습니다.

| 항목                        | 설명                                                                                        |
|:--------------------------|:------------------------------------------------------------------------------------------|
| `jekyll_potion`           | `jekyll_potion` 설정 Root                                                                   |
| `jekyll_potion.site`      | `jekyll_potion` Site 설정 Root<br/>자세한 설명은 [Site 설정](./config/site) 에서 다룹니다.                |
| `jekyll_potion.theme`     | `jekyll_potion` theme 설정 Root<br/>자세한 설명은 [Theme 설정](./config/theme) 에서 다룹니다.             |
| `jekyll_potion.processor` | `jekyll_potion` processor 설정 Root<br/>자세한 설명은 [Processor 설정](./config/processor) 에서 다룹니다. |
