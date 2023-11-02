Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B6AC4167B
	for <linux-sound@archiver.kernel.org>; Thu,  2 Nov 2023 12:47:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbjKBMrL (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 2 Nov 2023 08:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjKBMrK (ORCPT
        <rfc822;linux-sound@vger.kernel.org>); Thu, 2 Nov 2023 08:47:10 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41918112
        for <linux-sound@vger.kernel.org>; Thu,  2 Nov 2023 05:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929225; x=1730465225;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pvx2Tsy/xYO/RWmsBHWxJQY1Zl9TLuaqfX0Rk0bqjOM=;
  b=h5Mn6DnanzKXCowzWQJMmGtVQpg8C1y1mxYoBQr/6JXqud2u9rtjglw4
   qLRf2B1wyHAalzxekydE2Phg3+MW5i3J6yaAE+oYlfZ6Py+TOY80Klef8
   IugcGNH/RK0WNQgUFIkhpVg/IeTQVoZ266EvbzrQ2sIRXFENzFAM9r5Hz
   1WELNhqUxNX9fzBcO/xQrOBziYVNVKu2CA0fbi9W+QaWz9msCfZfHIwny
   T8/TwhtirrSaA3DUUhbFaYM59w0hRlKu3XwFZlSxkep4QgYacwZeIlHL8
   KwWTzYyJzTt0yURfReYc4y5crRqdbVvQ0T7cb2zWPC69a0OPDvhnemQoA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343469"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="7343469"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454725"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1008454725"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:02 -0700
From:   =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 01/17] ASoC: Intel: avs: da7219: Add proper id_table
Date:   Thu,  2 Nov 2023 13:46:56 +0100
Message-Id: <20231102124712.2549327-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
References: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Add id_table and use it instead of alias to load module.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/da7219.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 6060894954df..c018f84fe025 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -277,16 +277,24 @@ static int avs_da7219_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct platform_device_id avs_da7219_driver_ids[] = {
+	{
+		.name = "avs_da7219",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, avs_da7219_driver_ids);
+
 static struct platform_driver avs_da7219_driver = {
 	.probe = avs_da7219_probe,
 	.driver = {
 		.name = "avs_da7219",
 		.pm = &snd_soc_pm_ops,
 	},
+	.id_table = avs_da7219_driver_ids,
 };
 
 module_platform_driver(avs_da7219_driver);
 
 MODULE_AUTHOR("Cezary Rojewski <cezary.rojewski@intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_da7219");
-- 
2.34.1

