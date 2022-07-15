# SPDX-FileCopyrightText: Copyright 2022 SK TELECOM CO., LTD.
# SPDX-License-Identifier: Apache-2.0

require_relative "jekyll-potion/models/favicon"
require_relative "jekyll-potion/models/page-potion"
require_relative "jekyll-potion/models/potion-page"
require_relative "jekyll-potion/models/potion-static-file"
require_relative "jekyll-potion/models/potion-source-map-page"

require_relative "jekyll-potion/util"
require_relative "jekyll-potion/logger"
require_relative "jekyll-potion/processor"
require_relative "jekyll-potion/tag"
require_relative "jekyll-potion/site"
require_relative "jekyll-potion/theme"
require_relative "jekyll-potion/potion"

module Jekyll::Potion
  potion_base_dir = File.join(File.dirname(__FILE__), "jekyll-potion")
  Potion.load(potion_base_dir)
end

require_relative "jekyll-potion/tags/alerts"
require_relative "jekyll-potion/tags/api"
require_relative "jekyll-potion/tags/code"
require_relative "jekyll-potion/tags/empty"
require_relative "jekyll-potion/tags/file"
require_relative "jekyll-potion/tags/link"
require_relative "jekyll-potion/tags/logo"
require_relative "jekyll-potion/tags/navigation"
require_relative "jekyll-potion/tags/pagination"
require_relative "jekyll-potion/tags/tabs"
