Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A16C54E5B
	for <linux-sound@archiver.kernel.org>; Tue, 14 Nov 2023 20:11:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232388AbjKNULx (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Tue, 14 Nov 2023 15:11:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233818AbjKNULu (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Tue, 14 Nov 2023 15:11:50 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18634AD
        for <linux-sound@vger.kernel.org>; Tue, 14 Nov 2023 12:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699992707; x=1731528707;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZVd8JR7JWwIAD73tuYOePPRkfmlids1h2RJYmh1LbdI=;
  b=SKkODdOvmrILSjVRw08Dr5MbKoHKYOgqEZmCSp8B7IdHV8LN+jzEm380
   nTfEsE5GuWZJZwQ17X9eHsNgdSr60BgzY/GP5LCfsatSVLVQrgPOq+d7F
   dQoQLLivxFKXfO6S0iKtJAH546EWd0ppvIOzVjVs3t8Yd9EqSbAL5ANb1
   a454CnLsJyyfVh8Attyz4434kwRPjVDBGvhlmfmf0zHSpISR0jv7ZAUFn
   rvoI3jPqHS9cRFLFdfekvwKQl7yetLLW75aG5pbsnRqrySnmbx6RIVQ+C
   G5/Sva+pb8yIU4TbkVoygBhGtA4Kdp1Qpn9G2ZbxsXqyp2kM7cBiONiuX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381134762"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="381134762"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 12:11:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="855422444"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="855422444"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2023 12:11:43 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        linux-sound@vger.kernel.org,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 12/16] ASoC: SOF: Intel: Switch to new stream-format interface
Date:   Tue, 14 Nov 2023 21:13:13 +0100
Message-Id: <20231114201317.1348066-13-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231114201317.1348066-1-cezary.rojewski@intel.com>
References: <20231114201317.1348066-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

To provide option for selecting different bit-per-sample than just the
maximum one, use the new format calculation mechanism.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 87935554b1e4..f46a28b13073 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -208,14 +208,15 @@ static unsigned int hda_calc_stream_format(struct snd_sof_dev *sdev,
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int link_bps;
 	unsigned int format_val;
+	unsigned int bps;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		link_bps = codec_dai->driver->playback.sig_bits;
 	else
 		link_bps = codec_dai->driver->capture.sig_bits;
+	bps = snd_hdac_stream_format_bps(params_format(params), SNDRV_PCM_SUBFORMAT_STD, link_bps);
 
-	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
-						 params_format(params), link_bps, 0);
+	format_val = snd_hdac_stream_format(params_channels(params), bps, params_rate(params));
 
 	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
 		params_rate(params), params_channels(params), params_format(params));
-- 
2.25.1

