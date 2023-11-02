Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBB0C001B2
	for <linux-sound@archiver.kernel.org>; Thu,  2 Nov 2023 12:47:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234905AbjKBMrk (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 2 Nov 2023 08:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234916AbjKBMrj (ORCPT
        <rfc822;linux-sound@vger.kernel.org>); Thu, 2 Nov 2023 08:47:39 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF92C12F
        for <linux-sound@vger.kernel.org>; Thu,  2 Nov 2023 05:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929255; x=1730465255;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7c51H5IdDaauTh0xrCMppktDjKjOltb5wmXvGjkqYXo=;
  b=dl15MZiWF06/ocuw+/rqk1V/kBBUBTxssD4K2Tswff1SdOchny8bSgG3
   aAMpPik5y+6ez443XfZvUYkVCNiX5OyxcTmk/tqFFzK3piXFLTagfhvQG
   44FDujkjfc1E+r4G5KhY59i0J/QtnZ6eNmWwKoIS9v56P8mtBbvJwlPPR
   YX6iXLZH5muQFkToOMASrE39I4Ek+AHtSnmCm1eklb8KapQHjYYsyYlaF
   Vd1OGVbxHGFw82zKqopR/z8CvuyQTyIq6FunfnXgYZnhxL/omVHNS/7RZ
   pu8HW3ZIUvej2WZZ/ZumY799lfWv5QuSusAwvyLd8mibTEMTnZYP2xacK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343575"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="7343575"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:47:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454799"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1008454799"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:32 -0700
From:   =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 16/17] ASoC: Intel: avs: rt5682: Add proper id_table
Date:   Thu,  2 Nov 2023 13:47:11 +0100
Message-Id: <20231102124712.2549327-17-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/intel/avs/boards/rt5682.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 84e850c0b085..243f979fda98 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -322,16 +322,24 @@ static int avs_rt5682_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct platform_device_id avs_rt5682_driver_ids[] = {
+	{
+		.name = "avs_rt5682",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, avs_rt5682_driver_ids);
+
 static struct platform_driver avs_rt5682_driver = {
 	.probe = avs_rt5682_probe,
 	.driver = {
 		.name = "avs_rt5682",
 		.pm = &snd_soc_pm_ops,
 	},
+	.id_table = avs_rt5682_driver_ids,
 };
 
 module_platform_driver(avs_rt5682_driver)
 
 MODULE_AUTHOR("Cezary Rojewski <cezary.rojewski@intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_rt5682");
-- 
2.34.1

