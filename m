Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA16AC197A0
	for <linux-sound@archiver.kernel.org>; Thu, 16 Nov 2023 11:22:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345003AbjKPLWn (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 16 Nov 2023 06:22:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbjKPLWj (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Thu, 16 Nov 2023 06:22:39 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EB37A8
        for <linux-sound@vger.kernel.org>; Thu, 16 Nov 2023 03:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700133756; x=1731669756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7Sn7Vlvm+H31slXD2xR054WW/r6iHg6RkCypVi0YYB4=;
  b=Bz7xYdISmAVo3hP1KdZID2vOzG52SZNSzGJl9SYSmaNxASqkcQEIxWoh
   chDO6vzbPel4JjHrqo0EUMr+XQty6mJPF31HOKJURkR8CCnM31hwkPpcN
   ewTL+mtGozpZsyVLOlBsqe3g7KhvSi/m2fP2OzXw/4vdRRYhwMZ0BwIgM
   mFPYlBn5SRphZpz0l8ir8K79KBMpWbbRFjRjQEt7VC30Ssf/mAVHzalZj
   LP0REta4DQYUjKDPGJl9mVBu4AQsP2t2aIwcej8QdEKGDCJrLpNnTABz2
   Hw0nwHbO5sonHdjwtARUGJRnfUOWX3vJeQ/dicr0fWJn/kafAQ8Ci76UN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="457562064"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="457562064"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 03:22:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200"; 
   d="scan'208";a="6698269"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2023 03:22:10 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 14/16] ALSA: hda: Drop snd_hdac_calc_stream_format()
Date:   Thu, 16 Nov 2023 12:22:53 +0100
Message-Id: <20231116112255.1584795-15-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116112255.1584795-1-cezary.rojewski@intel.com>
References: <20231116112255.1584795-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

There are no users of the function.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hdaudio.h |  5 ----
 sound/hda/hdac_device.c | 61 -----------------------------------------
 2 files changed, 66 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 964ccf1d8b5b..2a8a763a3c14 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -145,11 +145,6 @@ unsigned int snd_hdac_stream_format_bps(snd_pcm_format_t format, snd_pcm_subform
 unsigned int snd_hdac_stream_format(unsigned int channels, unsigned int bps, unsigned int rate);
 unsigned int snd_hdac_spdif_stream_format(unsigned int channels, unsigned int bps,
 					  unsigned int rate, unsigned short spdif_ctls);
-unsigned int snd_hdac_calc_stream_format(unsigned int rate,
-					 unsigned int channels,
-					 snd_pcm_format_t format,
-					 unsigned int maxbps,
-					 unsigned short spdif_ctls);
 int snd_hdac_query_supported_pcm(struct hdac_device *codec, hda_nid_t nid,
 				 u32 *ratesp, u64 *formatsp, u32 *subformatsp,
 				 unsigned int *bpsp);
diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index f885724d10b0..bcc4d90201b1 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -849,67 +849,6 @@ unsigned int snd_hdac_spdif_stream_format(unsigned int channels, unsigned int bp
 }
 EXPORT_SYMBOL_GPL(snd_hdac_spdif_stream_format);
 
-/**
- * snd_hdac_calc_stream_format - calculate the format bitset
- * @rate: the sample rate
- * @channels: the number of channels
- * @format: the PCM format (SNDRV_PCM_FORMAT_XXX)
- * @maxbps: the max. bps
- * @spdif_ctls: HD-audio SPDIF status bits (0 if irrelevant)
- *
- * Calculate the format bitset from the given rate, channels and th PCM format.
- *
- * Return zero if invalid.
- */
-unsigned int snd_hdac_calc_stream_format(unsigned int rate,
-					 unsigned int channels,
-					 snd_pcm_format_t format,
-					 unsigned int maxbps,
-					 unsigned short spdif_ctls)
-{
-	int i;
-	unsigned int val = 0;
-
-	for (i = 0; rate_bits[i].hz; i++)
-		if (rate_bits[i].hz == rate) {
-			val = rate_bits[i].hda_fmt;
-			break;
-		}
-	if (!rate_bits[i].hz)
-		return 0;
-
-	if (channels == 0 || channels > 8)
-		return 0;
-	val |= channels - 1;
-
-	switch (snd_pcm_format_width(format)) {
-	case 8:
-		val |= AC_FMT_BITS_8;
-		break;
-	case 16:
-		val |= AC_FMT_BITS_16;
-		break;
-	case 20:
-	case 24:
-	case 32:
-		if (maxbps >= 32 || format == SNDRV_PCM_FORMAT_FLOAT_LE)
-			val |= AC_FMT_BITS_32;
-		else if (maxbps >= 24)
-			val |= AC_FMT_BITS_24;
-		else
-			val |= AC_FMT_BITS_20;
-		break;
-	default:
-		return 0;
-	}
-
-	if (spdif_ctls & AC_DIG1_NONAUDIO)
-		val |= AC_FMT_TYPE_NON_PCM;
-
-	return val;
-}
-EXPORT_SYMBOL_GPL(snd_hdac_calc_stream_format);
-
 static unsigned int query_pcm_param(struct hdac_device *codec, hda_nid_t nid)
 {
 	unsigned int val = 0;
-- 
2.25.1

