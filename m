Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4404C4332F
	for <linux-sound@archiver.kernel.org>; Thu,  2 Nov 2023 12:47:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234890AbjKBMrg (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 2 Nov 2023 08:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234827AbjKBMrf (ORCPT
        <rfc822;linux-sound@vger.kernel.org>); Thu, 2 Nov 2023 08:47:35 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A56F123
        for <linux-sound@vger.kernel.org>; Thu,  2 Nov 2023 05:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929249; x=1730465249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hhGEiC6MAXSvmtFmSYlFOPAgnBfUa6nmG1/2UD7IdHs=;
  b=E+2ox9SF/iBsm8R2dTP4qrEWGCH+Tlm0wPhMzLmO12oJYHRvfwn1KOyu
   HADvNAfW0R1j/KFDbJrFJw/7/4Epp2Quj87e4LO3PL+Fe369CtHPEY1/+
   SxJDdLKvVhJjy7ukq8q2vixzYXFNVyz50uOTyymgoAoNNHA0t2q/xZGbr
   FyZLxBlAORMh1uRc4EzgzwZ7G+SoF44GSTtMddICn6/dLiMMPCrYk7YIN
   FRgLr2gCb/CiiBZwI4+TJhk/YnBQ9KZoq90iME6k/3LuTc7MLcObxqaGd
   UjWVjdVFCaS8Dh6tSrv5pDd0Twe//dy5XTjWkQjBTJHtITcREMApjQiN8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343545"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="7343545"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:47:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454782"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1008454782"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:26 -0700
From:   =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 13/17] ASoC: Intel: avs: rt298: Add proper id_table
Date:   Thu,  2 Nov 2023 13:47:08 +0100
Message-Id: <20231102124712.2549327-14-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/intel/avs/boards/rt298.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index ea32a7690c8a..80f490b9e118 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -247,15 +247,23 @@ static int avs_rt298_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct platform_device_id avs_rt298_driver_ids[] = {
+	{
+		.name = "avs_rt298",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, avs_rt298_driver_ids);
+
 static struct platform_driver avs_rt298_driver = {
 	.probe = avs_rt298_probe,
 	.driver = {
 		.name = "avs_rt298",
 		.pm = &snd_soc_pm_ops,
 	},
+	.id_table = avs_rt298_driver_ids,
 };
 
 module_platform_driver(avs_rt298_driver);
 
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_rt298");
-- 
2.34.1

