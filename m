Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A85C4167B
	for <linux-sound@archiver.kernel.org>; Thu,  2 Nov 2023 12:47:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234302AbjKBMrX (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 2 Nov 2023 08:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjKBMrW (ORCPT
        <rfc822;linux-sound@vger.kernel.org>); Thu, 2 Nov 2023 08:47:22 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07EB0121
        for <linux-sound@vger.kernel.org>; Thu,  2 Nov 2023 05:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929237; x=1730465237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=alXNqUY733E20ZP/HwFP93NSgXNWuW+Qa0v32WiZU2Q=;
  b=KOfy7KTZBLr530Ad3OgxXDiGqFeL3Gf/sgIo4GlJlPYx4tNnEA2NTV0/
   6SBh1DCmyv4Jle9IBf6fswArADtY3AAfziVIEBf1VIG3+1J3bCT/9XmNo
   o3db0ue3Wkz5DTANuARvRrSbk5+KYBcmB9UEYDne+zYNqbxhRX5nSVKi0
   R2eddKR6hgJb1ZBJJIousQr2PFNDtYJMDiyr8TY9UfVsHWzesCJiYucoC
   RKACHZ71umWTSoSdorD7V14e6f/QntCEfoEuXHizIrddxqTuIKV9J0Cm2
   5iAhAF8M41eSaxItsDM0YpY3qnT75yJPr/NRMBYD1eIvaTw11u7Q/lszI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343506"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="7343506"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:47:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454757"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1008454757"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:14 -0700
From:   =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 07/17] ASoC: Intel: avs: max98373: Add proper id_table
Date:   Thu,  2 Nov 2023 13:47:02 +0100
Message-Id: <20231102124712.2549327-8-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/intel/avs/boards/max98373.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index cc7dfdf72083..3b980a025e6f 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -192,15 +192,23 @@ static int avs_max98373_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct platform_device_id avs_max98373_driver_ids[] = {
+	{
+		.name = "avs_max98373",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, avs_max98373_driver_ids);
+
 static struct platform_driver avs_max98373_driver = {
 	.probe = avs_max98373_probe,
 	.driver = {
 		.name = "avs_max98373",
 		.pm = &snd_soc_pm_ops,
 	},
+	.id_table = avs_max98373_driver_ids,
 };
 
 module_platform_driver(avs_max98373_driver)
 
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_max98373");
-- 
2.34.1

