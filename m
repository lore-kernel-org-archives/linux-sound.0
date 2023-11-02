Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8459AC4167B
	for <linux-sound@archiver.kernel.org>; Thu,  2 Nov 2023 12:47:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234955AbjKBMrk (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 2 Nov 2023 08:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234905AbjKBMri (ORCPT
        <rfc822;linux-sound@vger.kernel.org>); Thu, 2 Nov 2023 08:47:38 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED50F112
        for <linux-sound@vger.kernel.org>; Thu,  2 Nov 2023 05:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929253; x=1730465253;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m9bBmWjH7tlH5KyGptu10AMFDBuYlNU/Vpgu4ghGUPM=;
  b=LcvdEEFCId5mkwDSo5jgRz+f62ggxpKGlqs5WT3tGj8nTX2mQ6RF8g7y
   UFjzU+wUpJHq1d0BlU0jhnADJAaFw3GpjtDtGn6/91/z1/MO0q03M39/C
   OdgjZHwY6ol7p9b80xkQJXodtOs/qKTjDY0ZpcflRhUcTWXZACKO21K8p
   iyP07VrmqjZfkJZD/m++XN1DVQkn3ou+b+vAC2AZSCAUm7q0INx+/4jqt
   SX2VwfOxRna9X7Ee9nMSCFSOu0cWhH4irnUvEOdrwxNaUjC9/9IWFRtoc
   gHbi5kH4vQuwbIKocxe7XqALELkmWcf5rvK7IuW62I/cawJN8kq1K/Qi2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343565"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="7343565"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:47:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454795"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1008454795"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:30 -0700
From:   =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 15/17] ASoC: Intel: avs: rt5663: Add proper id_table
Date:   Thu,  2 Nov 2023 13:47:10 +0100
Message-Id: <20231102124712.2549327-16-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/intel/avs/boards/rt5663.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index 3effd789a45e..b4762c2a7bf2 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -246,15 +246,23 @@ static int avs_rt5663_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct platform_device_id avs_rt5663_driver_ids[] = {
+	{
+		.name = "avs_rt5663",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, avs_rt5663_driver_ids);
+
 static struct platform_driver avs_rt5663_driver = {
 	.probe = avs_rt5663_probe,
 	.driver = {
 		.name = "avs_rt5663",
 		.pm = &snd_soc_pm_ops,
 	},
+	.id_table = avs_rt5663_driver_ids,
 };
 
 module_platform_driver(avs_rt5663_driver);
 
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_rt5663");
-- 
2.34.1

