Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D7CDC4167D
	for <linux-sound@archiver.kernel.org>; Thu,  2 Nov 2023 12:47:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbjKBMrW (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 2 Nov 2023 08:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjKBMrV (ORCPT
        <rfc822;linux-sound@vger.kernel.org>); Thu, 2 Nov 2023 08:47:21 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D341112
        for <linux-sound@vger.kernel.org>; Thu,  2 Nov 2023 05:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929235; x=1730465235;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b7iHa1bmVaiw7GzrdFVs42siWNCSN15AK35gzh5sxf4=;
  b=V6h8OGsxgFqcNxYFQUTwN0fbxYHjKqoT2TMPy05QPovuyMhSUQ0dXJbh
   rsL/pgD93CuGVI36EPtkfjplnSZGqoVsETkF63V6GDp4N64CFIx6r2KUT
   4OLt26hY/HA2fIYtlyk237uMhmcdCGDfOl/8SLMsMawfQfAgkLKDyZAP6
   jgs+gAN1ih3iIIPg1508NCxB5tqztBHPmoZ5jmhJcr6jjcbtfyOw+6cd4
   tA15Spw70+Kh7JItcQe1EdELEExBQKNdxJ2abAAxoh8nhfg8cXJNF7hMt
   kkbGZhUaZHIq32L6Jy61EI3OmgfaA7sfml0VcTuy0GtF7q19Xp7eM2Wna
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343497"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="7343497"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:47:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454750"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1008454750"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:12 -0700
From:   =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 06/17] ASoC: Intel: avs: max98357a: Add proper id_table
Date:   Thu,  2 Nov 2023 13:47:01 +0100
Message-Id: <20231102124712.2549327-7-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/intel/avs/boards/max98357a.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index 6ba7b6564279..a83b95f25129 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -135,15 +135,23 @@ static int avs_max98357a_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct platform_device_id avs_max98357a_driver_ids[] = {
+	{
+		.name = "avs_max98357a",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, avs_max98357a_driver_ids);
+
 static struct platform_driver avs_max98357a_driver = {
 	.probe = avs_max98357a_probe,
 	.driver = {
 		.name = "avs_max98357a",
 		.pm = &snd_soc_pm_ops,
 	},
+	.id_table = avs_max98357a_driver_ids,
 };
 
 module_platform_driver(avs_max98357a_driver)
 
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_max98357a");
-- 
2.34.1

