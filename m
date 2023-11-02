Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56400C4167D
	for <linux-sound@archiver.kernel.org>; Thu,  2 Nov 2023 12:47:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbjKBMrQ (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 2 Nov 2023 08:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjKBMrP (ORCPT
        <rfc822;linux-sound@vger.kernel.org>); Thu, 2 Nov 2023 08:47:15 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BFE8125
        for <linux-sound@vger.kernel.org>; Thu,  2 Nov 2023 05:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929229; x=1730465229;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SmW1+mxdDXdxsDvM6/CrA9dDmVY6nBagCWTEsBBjzoI=;
  b=RlPolq3F/GiUVYvC4hINNCf9MujXP4Svobn8NPz1V+HpxT1PN/ifv0QO
   PBTV7lcE1bLe4esn/RQdrb28GxXonO1lHRDxMeu8BkovtDg9TswCnTbmL
   vr1gl6b4ByjjA5O2s9C3qYOlZvpN1++ApTnQTPT7Br5g/tFHmRHt1Rj3W
   ljO35kT7sTpi3q4ldyifyMKvxkeZwV7nH1OLjVUR3NponEBb9sgYEbzvq
   3BFjiaIGMa/HmlVBy92wYOVwITtBU8yYUl0kDHaEFKRpFxNVR3HVC9iTS
   QuLUsWpa9O6IdsmVLuaaJk+3bQwjPu6V3y4Qaox9/bSwWPFNzWTTR3TVO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343481"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="7343481"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:47:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454734"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1008454734"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:07 -0700
From:   =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 03/17] ASoC: Intel: avs: es8336: Add proper id_table
Date:   Thu,  2 Nov 2023 13:46:58 +0100
Message-Id: <20231102124712.2549327-4-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/intel/avs/boards/es8336.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index f972ef64d284..1090082e7d5b 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -307,15 +307,23 @@ static int avs_es8336_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct platform_device_id avs_es8336_driver_ids[] = {
+	{
+		.name = "avs_es8336",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, avs_es8336_driver_ids);
+
 static struct platform_driver avs_es8336_driver = {
 	.probe = avs_es8336_probe,
 	.driver = {
 		.name = "avs_es8336",
 		.pm = &snd_soc_pm_ops,
 	},
+	.id_table = avs_es8336_driver_ids,
 };
 
 module_platform_driver(avs_es8336_driver);
 
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_es8336");
-- 
2.34.1

