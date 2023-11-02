Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F222C4332F
	for <linux-sound@archiver.kernel.org>; Thu,  2 Nov 2023 12:47:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbjKBMr3 (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 2 Nov 2023 08:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234570AbjKBMr1 (ORCPT
        <rfc822;linux-sound@vger.kernel.org>); Thu, 2 Nov 2023 08:47:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8168121
        for <linux-sound@vger.kernel.org>; Thu,  2 Nov 2023 05:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929243; x=1730465243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6EGi9V6cboKw6AotQz4ekyMvQb/rXSF85eucGOf3JYU=;
  b=YK5BBuazMZZw0YiZmWGxIucOnxVHNHpcSpJezG+2iubdZFPo2Hem9FkM
   aajx/ny76Rg+UjZBL3vpfqd5MFIA0V6r2JXr/ETmgn/od4MomAeg4a0iT
   nbZ0t4xrooc++zrIA+IYbNOjNYSi3BrwKp3YNPNXgev2HRN+Y1D7LXPpP
   YLNcv/WJBuC5DBwlCtUbrrR1aZOpEfgU7S6hkRZy+8hgbPwTUCTaP7IZd
   vVBY943rlBkLf9xyqtec+59zpQXJRQjTVC07dTTeuMemco4vhidDAcWJY
   2P5oe0egoPbt/zuOHCpan8a8Umpp1ToEpvAs5IepfgcFY1eLjUFY12v1S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343525"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="7343525"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:47:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454771"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1008454771"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:20 -0700
From:   =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 10/17] ASoC: Intel: avs: probe: Add proper id_table
Date:   Thu,  2 Nov 2023 13:47:05 +0100
Message-Id: <20231102124712.2549327-11-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/intel/avs/boards/probe.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/probe.c b/sound/soc/intel/avs/boards/probe.c
index 411acaee74f9..a9469b5ecb40 100644
--- a/sound/soc/intel/avs/boards/probe.c
+++ b/sound/soc/intel/avs/boards/probe.c
@@ -50,15 +50,23 @@ static int avs_probe_mb_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct platform_device_id avs_probe_mb_driver_ids[] = {
+	{
+		.name = "avs_probe_mb",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, avs_probe_mb_driver_ids);
+
 static struct platform_driver avs_probe_mb_driver = {
 	.probe = avs_probe_mb_probe,
 	.driver = {
 		.name = "avs_probe_mb",
 		.pm = &snd_soc_pm_ops,
 	},
+	.id_table = avs_probe_mb_driver_ids,
 };
 
 module_platform_driver(avs_probe_mb_driver);
 
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_probe_mb");
-- 
2.34.1

