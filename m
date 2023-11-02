Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9724C4332F
	for <linux-sound@archiver.kernel.org>; Thu,  2 Nov 2023 12:47:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbjKBMrN (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 2 Nov 2023 08:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjKBMrN (ORCPT
        <rfc822;linux-sound@vger.kernel.org>); Thu, 2 Nov 2023 08:47:13 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82724121
        for <linux-sound@vger.kernel.org>; Thu,  2 Nov 2023 05:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929228; x=1730465228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CIymP4g4pLFXIZ5O3229NLCZFEilr9Tc3XyWgkrTnhA=;
  b=eca0uIcjZNpajdmWeNjs2hLcFkaKdBBYxz29h/yoRGXyiYDK01FAVzgF
   eRCN7VktFcaVSFXxUciqhWwkyDeTM6W08jSckDLYtdYx4vdvPgua2o5ga
   GSGxbQ13xMY2HIAvcoUyk3DOC7DGM7gZycrdYRtwjpvFVJ1A+kRTWgGHG
   eJxhffkN/RG1B7zABAIxfqImhMVe0fYRyJGn5+D4ACHspzZArfXc8ifR6
   EAzpyjQ7odfaKMgPvE11ttCBdcVeO+eH/RK1X1YDiWVccb1k2d+gvF86E
   UdkL61LgmHpP8QlYx+CuhWtZXG9Vi+9gZ79bBysCjwrau+SVpSQzqnVr3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343475"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="7343475"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:47:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454728"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1008454728"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:04 -0700
From:   =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 02/17] ASoC: Intel: avs: dmic: Add proper id_table
Date:   Thu,  2 Nov 2023 13:46:57 +0100
Message-Id: <20231102124712.2549327-3-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/intel/avs/boards/dmic.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index c270646faf86..ba2bc7f689eb 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -77,15 +77,23 @@ static int avs_dmic_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct platform_device_id avs_dmic_driver_ids[] = {
+	{
+		.name = "avs_dmic",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, avs_dmic_driver_ids);
+
 static struct platform_driver avs_dmic_driver = {
 	.probe = avs_dmic_probe,
 	.driver = {
 		.name = "avs_dmic",
 		.pm = &snd_soc_pm_ops,
 	},
+	.id_table = avs_dmic_driver_ids,
 };
 
 module_platform_driver(avs_dmic_driver);
 
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_dmic");
-- 
2.34.1

