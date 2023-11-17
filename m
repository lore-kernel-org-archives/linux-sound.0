Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59029C47071
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 12:04:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjKQMEe (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 07:04:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbjKQMEc (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 07:04:32 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A7DCE
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 04:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222669; x=1731758669;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4ttkQ7PIQkKT2/3gCz8weikAO2wQPzi85VUSExLas40=;
  b=kPYFuIJ2Z1oGL73qpLeYcFPzni65j7oIdjbZBzl2F3Ioan4u4oSPSpU5
   NMK9JIzqt8xEiqYkWiC520geZLGRxw4fmAMBSW5p9545YVHjYrx36w5Gr
   UpJ7+TWiZyVJdVYZLNi6oN0DJz9OF0TxLPqEh89mPCZhadCaCh5/CQwfY
   ZOhS3/7v9Cc5hYckR0e7KrxgDMoEtyVY/6zYk22zZPnmt+XsdYcc/BVmG
   lIDOhEORWHNHiEpJtXPWDSv0s2uKNeMXOzmLzUQk2EC2rZ3N9kGu2apS/
   X1EAzJA/ilyBd+cdeDUX5IAhR5jeyv2vcOiyPCW60q9ZlXPocH+mjpeNN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381675288"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="381675288"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 04:04:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="883110210"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="883110210"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2023 04:04:27 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v5 12/16] ASoC: SOF: Intel: Switch to new stream-format interface
Date:   Fri, 17 Nov 2023 13:06:06 +0100
Message-Id: <20231117120610.1755254-13-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117120610.1755254-1-cezary.rojewski@intel.com>
References: <20231117120610.1755254-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

To provide option for selecting different bit-per-sample than just the
maximum one, use the new format calculation mechanism.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 87935554b1e4..55ce75db23e5 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -208,14 +208,16 @@ static unsigned int hda_calc_stream_format(struct snd_sof_dev *sdev,
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int link_bps;
 	unsigned int format_val;
+	unsigned int bits;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		link_bps = codec_dai->driver->playback.sig_bits;
 	else
 		link_bps = codec_dai->driver->capture.sig_bits;
 
-	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
-						 params_format(params), link_bps, 0);
+	bits = snd_hdac_stream_format_bits(params_format(params), SNDRV_PCM_SUBFORMAT_STD,
+					   link_bps);
+	format_val = snd_hdac_stream_format(params_channels(params), bits, params_rate(params));
 
 	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
 		params_rate(params), params_channels(params), params_format(params));
@@ -238,11 +240,11 @@ static unsigned int generic_calc_stream_format(struct snd_sof_dev *sdev,
 					       struct snd_pcm_hw_params *params)
 {
 	unsigned int format_val;
+	unsigned int bits;
 
-	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
-						 params_format(params),
-						 params_physical_width(params),
-						 0);
+	bits = snd_hdac_stream_format_bits(params_format(params), SNDRV_PCM_SUBFORMAT_STD,
+					   params_physical_width(params));
+	format_val = snd_hdac_stream_format(params_channels(params), bits, params_rate(params));
 
 	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
 		params_rate(params), params_channels(params), params_format(params));
@@ -258,6 +260,7 @@ static unsigned int dmic_calc_stream_format(struct snd_sof_dev *sdev,
 	snd_pcm_format_t format;
 	unsigned int channels;
 	unsigned int width;
+	unsigned int bits;
 
 	channels = params_channels(params);
 	format = params_format(params);
@@ -269,10 +272,8 @@ static unsigned int dmic_calc_stream_format(struct snd_sof_dev *sdev,
 		width = 32;
 	}
 
-	format_val = snd_hdac_calc_stream_format(params_rate(params), channels,
-						 format,
-						 width,
-						 0);
+	bits = snd_hdac_stream_format_bits(format, SNDRV_PCM_SUBFORMAT_STD, width);
+	format_val = snd_hdac_stream_format(channels, bits, params_rate(params));
 
 	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
 		params_rate(params), channels, format);
-- 
2.25.1

