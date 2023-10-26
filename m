Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104D6C25B6B
	for <linux-sound@archiver.kernel.org>; Thu, 26 Oct 2023 08:26:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjJZI0D (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 26 Oct 2023 04:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjJZI0C (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Thu, 26 Oct 2023 04:26:02 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F030ACE
        for <linux-sound@vger.kernel.org>; Thu, 26 Oct 2023 01:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698308760; x=1729844760;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iQfH7kjWWSYCdi/ONnIK+4qe1rIwBGf/wYH1iugGS+E=;
  b=i+VnBBBQoSchqtRYD4zQV1X2rxUSvS9OHqEKtn/9DNvad9w9VMP+aPhN
   0NEDre59KmEnfC0GsJHCql/J1beYHFvOX12HBt0R+xllg2G7CrqrCadR0
   bjgJYc/Q31MQRkMCohqflcsajJ6LcGwTRfXO850TVlEbAtIRL5az5JSNb
   thlL6qqGs4xw/c9yRe+8mfhyC9Pt7vlFGNtkJZ0TGeWmIYGSvRqWonsQB
   d1FSadR+ct1UAnVe7hWCGq+u4a64qnLB2kvvOSpfvxUjyx85LlAq1JtPb
   90VMB5/QpapDf8RUvIqpwUPgLDzSgkGGTmrMPztXZTuYGBpgGLFj3MwRa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="367698973"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="367698973"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 01:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="735668748"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="735668748"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga006.jf.intel.com with ESMTP; 26 Oct 2023 01:25:58 -0700
From:   =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ASoC: Intel: Skylake: Fix mem leak when parsing UUIDs fails
Date:   Thu, 26 Oct 2023 10:25:58 +0200
Message-Id: <20231026082558.1864910-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

From: Cezary Rojewski <cezary.rojewski@intel.com>

Error path in snd_skl_parse_uuids() shall free last allocated module if
its instance_id allocation fails.

Fixes: f8e066521192 ("ASoC: Intel: Skylake: Fix uuid_module memory leak in failure case")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/skylake/skl-sst-utils.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/skylake/skl-sst-utils.c b/sound/soc/intel/skylake/skl-sst-utils.c
index 57ea815d3f04..b776c58dcf47 100644
--- a/sound/soc/intel/skylake/skl-sst-utils.c
+++ b/sound/soc/intel/skylake/skl-sst-utils.c
@@ -299,6 +299,7 @@ int snd_skl_parse_uuids(struct sst_dsp *ctx, const struct firmware *fw,
 		module->instance_id = devm_kzalloc(ctx->dev, size, GFP_KERNEL);
 		if (!module->instance_id) {
 			ret = -ENOMEM;
+			kfree(module);
 			goto free_uuid_list;
 		}
 
-- 
2.34.1

