Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246B2C54FB9
	for <linux-sound@archiver.kernel.org>; Thu, 16 Nov 2023 11:22:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbjKPLWj (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 16 Nov 2023 06:22:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbjKPLWi (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Thu, 16 Nov 2023 06:22:38 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA26AA8
        for <linux-sound@vger.kernel.org>; Thu, 16 Nov 2023 03:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700133754; x=1731669754;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=28ZTZt7AMRFjHUJBpQQ17HXdf9w4PqYBZaOJYNga+eQ=;
  b=RC6avLhejOyi84Zq1U85Sxlib4cqCUXPIf5KEGkbzUuNSYHbn/Ys24sX
   xg5D2AJeQ1m/YgW0w7kelxjIXhQMZCIc4doeiA17+gKofICCen4JowNJ0
   m2R140WuUir0O2iiCjoDGqKvFMrDZ2hbQHy/MW9I7+eOchtpafaNqO4BA
   4xAkau8Un+b9bOWS2HanLVMMNzL5yIajM/WED1RHNrVTTx5sbD+JZYYio
   QZKsNtvmjqTSFJfF+mmlUhSeLjhozMu6P/SyNC5+OfpxJLJfHvZ2i5HiQ
   X1URT2ztuR87r3fI73mygKVL8WVTidf6C158F6N1knfr73oC5uVP01qQB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="457562046"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="457562046"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 03:22:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200"; 
   d="scan'208";a="6698261"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2023 03:22:04 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 12/16] ASoC: SOF: Intel: Switch to new stream-format interface
Date:   Thu, 16 Nov 2023 12:22:51 +0100
Message-Id: <20231116112255.1584795-13-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116112255.1584795-1-cezary.rojewski@intel.com>
References: <20231116112255.1584795-1-cezary.rojewski@intel.com>
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
 sound/soc/sof/intel/hda-dai-ops.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 87935554b1e4..94524f0aa1f6 100644
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
@@ -238,11 +239,11 @@ static unsigned int generic_calc_stream_format(struct snd_sof_dev *sdev,
 					       struct snd_pcm_hw_params *params)
 {
 	unsigned int format_val;
+	unsigned int bps;
 
-	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
-						 params_format(params),
-						 params_physical_width(params),
-						 0);
+	bps = snd_hdac_stream_format_bps(params_format(params), SNDRV_PCM_SUBFORMAT_STD,
+					 params_physical_width(params));
+	format_val = snd_hdac_stream_format(params_channels(params), bps, params_rate(params));
 
 	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
 		params_rate(params), params_channels(params), params_format(params));
@@ -258,6 +259,7 @@ static unsigned int dmic_calc_stream_format(struct snd_sof_dev *sdev,
 	snd_pcm_format_t format;
 	unsigned int channels;
 	unsigned int width;
+	unsigned int bps;
 
 	channels = params_channels(params);
 	format = params_format(params);
@@ -269,10 +271,8 @@ static unsigned int dmic_calc_stream_format(struct snd_sof_dev *sdev,
 		width = 32;
 	}
 
-	format_val = snd_hdac_calc_stream_format(params_rate(params), channels,
-						 format,
-						 width,
-						 0);
+	bps = snd_hdac_stream_format_bps(format, SNDRV_PCM_SUBFORMAT_STD, width);
+	format_val = snd_hdac_stream_format(channels, bps, params_rate(params));
 
 	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
 		params_rate(params), channels, format);
-- 
2.25.1

