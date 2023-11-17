Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0450AC47071
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 12:04:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbjKQMEk (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 07:04:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbjKQMEh (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 07:04:37 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50883B9
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 04:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222674; x=1731758674;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tVycMyjfNwGGSB12mYDs36ONemUt/PmVZTgAPE7K/9Q=;
  b=D2K1jzliN5sg2hbDA3jlQysJm80FHpKQi/PoxMqhY32E6Ujg7iUQBPyn
   e2RAv9VgfRMiVfAtn9mjaJMfqLbW7CMTYUAGTDogkgjt3nvRycGLcI0+h
   B4cpmCe6SGuwC7XQmV5mFnrFC7XrCcDgsCmG6AGd20uP/8HOol25PlPHP
   dhTIW62bP/ifhUnpURqw6T16gcNpinF4fkLCcoI1yUi06pW2uZOWrWSO0
   0+aHoInrzkqNGBa+gW9Qr5n67lzZ+/AEwvGKLCqlsxAok5nFTulASzwjJ
   SPRp5qnIpYH2I5HZYbN4DDNmF/TcjUm+9wcgmxe8mjYN7QPKi//dlo3n9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381675302"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="381675302"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 04:04:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="883110224"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="883110224"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2023 04:04:31 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v5 14/16] ALSA: hda: Drop snd_hdac_calc_stream_format()
Date:   Fri, 17 Nov 2023 13:06:08 +0100
Message-Id: <20231117120610.1755254-15-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117120610.1755254-1-cezary.rojewski@intel.com>
References: <20231117120610.1755254-1-cezary.rojewski@intel.com>
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
index b00c631c4053..62a3cd154ff2 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -145,11 +145,6 @@ unsigned int snd_hdac_stream_format_bits(snd_pcm_format_t format, snd_pcm_subfor
 unsigned int snd_hdac_stream_format(unsigned int channels, unsigned int bits, unsigned int rate);
 unsigned int snd_hdac_spdif_stream_format(unsigned int channels, unsigned int bits,
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
index 556bd24f4014..7f7b67fe1b65 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -849,67 +849,6 @@ unsigned int snd_hdac_spdif_stream_format(unsigned int channels, unsigned int bi
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

