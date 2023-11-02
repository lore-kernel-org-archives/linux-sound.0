Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB8BC4332F
	for <linux-sound@archiver.kernel.org>; Thu,  2 Nov 2023 12:47:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234476AbjKBMrZ (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 2 Nov 2023 08:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjKBMrZ (ORCPT
        <rfc822;linux-sound@vger.kernel.org>); Thu, 2 Nov 2023 08:47:25 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C72912E
        for <linux-sound@vger.kernel.org>; Thu,  2 Nov 2023 05:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929239; x=1730465239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s5Tgqm5Ke6cfCMbynqvLX7TRjId+ANbr1kFf4zGCERA=;
  b=gHqKxWtgy7+g8lUoE8F/OiK4K6HykIWW/w7eqUOcWaTaBIiiIeOIKj7r
   DBpb34os3g3O2UYKs7TSARUDT36qS4H2H795OsA3zBM3zat6qxYimUidT
   9e0b8Mp3s9sSFHHBRs+3z61qCSymzaacAO26At54sWryvVjZv5OCCDJbx
   caQbdXJqsWwZjQk1sVH1fEMuqMcw37XFnwqcDEr20RogebEFxXNEeIBF4
   XOY4sUJsBKlEDAIDizFGAPkCkPnqngyWF/sdkL4jPzaKtkVFtapUHNtII
   mSbc4G0Gxt1k3B03bBDj2p6kV9qUrTBcuWFa5KHPdbrg36hLWfI19JAhu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343511"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="7343511"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:47:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454762"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1008454762"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:16 -0700
From:   =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 08/17] ASoC: Intel: avs: max98927: Add proper id_table
Date:   Thu,  2 Nov 2023 13:47:03 +0100
Message-Id: <20231102124712.2549327-9-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/intel/avs/boards/max98927.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index fb0175f37d61..86dd2b228df3 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -189,15 +189,23 @@ static int avs_max98927_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct platform_device_id avs_max98927_driver_ids[] = {
+	{
+		.name = "avs_max98927",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, avs_max98927_driver_ids);
+
 static struct platform_driver avs_max98927_driver = {
 	.probe = avs_max98927_probe,
 	.driver = {
 		.name = "avs_max98927",
 		.pm = &snd_soc_pm_ops,
 	},
+	.id_table = avs_max98927_driver_ids,
 };
 
 module_platform_driver(avs_max98927_driver)
 
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_max98927");
-- 
2.34.1

