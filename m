Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97B5C4167B
	for <linux-sound@archiver.kernel.org>; Thu,  2 Nov 2023 12:47:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234681AbjKBMre (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 2 Nov 2023 08:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234905AbjKBMrc (ORCPT
        <rfc822;linux-sound@vger.kernel.org>); Thu, 2 Nov 2023 08:47:32 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03719112
        for <linux-sound@vger.kernel.org>; Thu,  2 Nov 2023 05:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929247; x=1730465247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xValfF4gzdEVDSQ3x1QuNQY2nw9XNZbWfDc7OIw4BdA=;
  b=Pc6PfJXXmLbPtWSsF50sjTjqGxOf1f9qmGicPIX53s3suTLrsbK/U5A5
   3Z+BDrOFDaXA/6dNiOKiKppohQ2aGGPg6E/8DNX5Ud4KB0I0V6oBzYMiF
   ydrCcSB84Owkz5ynsPU3RvvCUqUX0ru4FvBYVfv2OPJ0NfOtqR5vlJQiC
   twmNonV1DXMus4PBaPObLYsOJrxiaWAa9QDqU9LzesgNIdkFWP+sX1ztv
   RcU893tUpPPkauijrvJoTXTHyY21q09uesC2V2iLV46WYd7Q2TJAE1eFX
   UjkhdPIRQe1vtXZahRsi1zyc82OJe+9we0z95b/x7wW93lK9oYQLl7eMa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343536"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="7343536"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:47:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454779"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1008454779"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:24 -0700
From:   =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 12/17] ASoC: Intel: avs: rt286: Add proper id_table
Date:   Thu,  2 Nov 2023 13:47:07 +0100
Message-Id: <20231102124712.2549327-13-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/intel/avs/boards/rt286.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index 131237471e3e..28d7d86b1cc9 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -228,15 +228,23 @@ static int avs_rt286_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct platform_device_id avs_rt286_driver_ids[] = {
+	{
+		.name = "avs_rt286",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, avs_rt286_driver_ids);
+
 static struct platform_driver avs_rt286_driver = {
 	.probe = avs_rt286_probe,
 	.driver = {
 		.name = "avs_rt286",
 		.pm = &snd_soc_pm_ops,
 	},
+	.id_table = avs_rt286_driver_ids,
 };
 
 module_platform_driver(avs_rt286_driver);
 
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_rt286");
-- 
2.34.1

