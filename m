Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DF8C0018A
	for <linux-sound@archiver.kernel.org>; Thu,  2 Nov 2023 12:47:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbjKBMrR (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 2 Nov 2023 08:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjKBMrQ (ORCPT
        <rfc822;linux-sound@vger.kernel.org>); Thu, 2 Nov 2023 08:47:16 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E87121
        for <linux-sound@vger.kernel.org>; Thu,  2 Nov 2023 05:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929233; x=1730465233;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2Jk5sSELW2UtGc8oy2c3BEUMoFErB30cR8Wv/CjzPcE=;
  b=SuF6eTe+p7sGtGFgNCT9K4muNg7zoTH5uX/ohXCWd3IDGbUOil092wcR
   gVpQD8uqIszD73xqayC0Tr2snfOWIWRG4A3A6mdB+OVZ78ofCrwl8wWHO
   uMdhQjucSKRBZOyBi0uXiNhUfYe53SetKGGPslqLUfsirmhZfD68Zf6Xp
   fa7jSX8x8p8WAGKrPclGK4w1BOJsGN6quiC49fMxbZc8WeJzFFLpBmuBF
   G08++4pqMKymyC2viMNlOJvHCQbADhk9DD0sDGM4i5RlXe/osCYrcS2hY
   xFoksFRvWP3Txj9KqWy5t95ZsVOqtuAeqp3yrU40PxHc+CuzbnpZP9qgi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343490"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="7343490"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:47:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454744"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1008454744"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:10 -0700
From:   =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 05/17] ASoC: Intel: avs: i2s_test: Add proper id_table
Date:   Thu,  2 Nov 2023 13:47:00 +0100
Message-Id: <20231102124712.2549327-6-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/intel/avs/boards/i2s_test.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 3d03e1eed3a9..28f254eb0d03 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -185,15 +185,23 @@ static int avs_i2s_test_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct platform_device_id avs_i2s_test_driver_ids[] = {
+	{
+		.name = "avs_i2s_test",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, avs_i2s_test_driver_ids);
+
 static struct platform_driver avs_i2s_test_driver = {
 	.probe = avs_i2s_test_probe,
 	.driver = {
 		.name = "avs_i2s_test",
 		.pm = &snd_soc_pm_ops,
 	},
+	.id_table = avs_i2s_test_driver_ids,
 };
 
 module_platform_driver(avs_i2s_test_driver);
 
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_i2s_test");
-- 
2.34.1

