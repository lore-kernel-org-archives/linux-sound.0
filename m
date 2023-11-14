Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C25EC54E5B
	for <linux-sound@archiver.kernel.org>; Tue, 14 Nov 2023 20:11:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233554AbjKNULe (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Tue, 14 Nov 2023 15:11:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233399AbjKNULa (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Tue, 14 Nov 2023 15:11:30 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B469FAD
        for <linux-sound@vger.kernel.org>; Tue, 14 Nov 2023 12:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699992686; x=1731528686;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gf++YdenGyd3yfxolO3j4hJzpYZfWhcotsV4ntNA5nM=;
  b=U3vu2CgNTAJ/YtkNgNLmOoP911ZSj7hCH6U6mRZ3kgrta8zm4kAEAswJ
   iTdXfv3zXc1xG6Fzt2zsIp98HUAr1nephTWErwZ1CZqGnYg2D8+vQeUOT
   x5kE5f1OS/kKbjhUKF3gZJ+OUOX6Rjp+eUs+Gy0XVej+DdNpECduYelFF
   SJtym2eAycCnT6u2aiWgedCt7q9XGjiqEDo70ao9o7XsR0ppTDb3btrEd
   k7hCq66rzxmVBtgbfwhKj+jIGQTikl6s4LhhiLlSGFrpDoWWpdCYzsTxm
   84J2q4xnDhEs0fiTK9VsyK0wlSMMFfdlHGH3SYix0NXCInt0JoWJQtbmP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381134655"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="381134655"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 12:11:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="855422402"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="855422402"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2023 12:11:23 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        linux-sound@vger.kernel.org,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 04/16] ALSA: hda: Upgrade stream-format infrastructure
Date:   Tue, 14 Nov 2023 21:13:05 +0100
Message-Id: <20231114201317.1348066-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231114201317.1348066-1-cezary.rojewski@intel.com>
References: <20231114201317.1348066-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Introduce a set of functions that ultimately facilite SDxFMT-related
calculations in atomic manner:

First, introduce snd_pcm_subformat_width() and snd_pcm_hw_params_bps()
helpers that separate the base functionality from the HDAudio-specific
one.

snd_hdac_format_normalize() - format converter. S20_LE, S24_LE and their
unsigned and BE friends are invalid from HDAudio perspective but still
can be specified as function argument due to compatibility reasons.

snd_hdac_stream_format_bps() - obtain just the bits-per-sample value.
Does not ignore subformat and msbits parameters.

snd_hdac_stream_format() and snd_hdac_spdif_stream_format() - obtain the
SDxFMT value given the audio format parameters. The former is stripped
away of spdif-related information. Useful for users that do not care
about them.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hdaudio.h    |   5 ++
 include/sound/pcm.h        |   1 +
 include/sound/pcm_params.h |   2 +
 sound/core/pcm_lib.c       |  28 +++++++++
 sound/core/pcm_misc.c      |  22 +++++++
 sound/hda/hdac_device.c    | 124 +++++++++++++++++++++++++++++++++++++
 6 files changed, 182 insertions(+)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 7cfea9e7f6e4..964ccf1d8b5b 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -140,6 +140,11 @@ int snd_hdac_get_connections(struct hdac_device *codec, hda_nid_t nid,
 			     hda_nid_t *conn_list, int max_conns);
 int snd_hdac_get_sub_nodes(struct hdac_device *codec, hda_nid_t nid,
 			   hda_nid_t *start_id);
+unsigned int snd_hdac_stream_format_bps(snd_pcm_format_t format, snd_pcm_subformat_t subformat,
+					unsigned int maxbps);
+unsigned int snd_hdac_stream_format(unsigned int channels, unsigned int bps, unsigned int rate);
+unsigned int snd_hdac_spdif_stream_format(unsigned int channels, unsigned int bps,
+					  unsigned int rate, unsigned short spdif_ctls);
 unsigned int snd_hdac_calc_stream_format(unsigned int rate,
 					 unsigned int channels,
 					 snd_pcm_format_t format,
diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index cc175c623dac..40d6257d4353 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1135,6 +1135,7 @@ int snd_pcm_format_physical_width(snd_pcm_format_t format);		/* in bits */
 ssize_t snd_pcm_format_size(snd_pcm_format_t format, size_t samples);
 const unsigned char *snd_pcm_format_silence_64(snd_pcm_format_t format);
 int snd_pcm_format_set_silence(snd_pcm_format_t format, void *buf, unsigned int frames);
+int snd_pcm_subformat_width(snd_pcm_subformat_t subformat);
 
 void snd_pcm_set_ops(struct snd_pcm * pcm, int direction,
 		     const struct snd_pcm_ops *ops);
diff --git a/include/sound/pcm_params.h b/include/sound/pcm_params.h
index ba184f49f7e1..df17c7d3e853 100644
--- a/include/sound/pcm_params.h
+++ b/include/sound/pcm_params.h
@@ -362,6 +362,8 @@ static inline int params_physical_width(const struct snd_pcm_hw_params *p)
 	return snd_pcm_format_physical_width(params_format(p));
 }
 
+int snd_pcm_hw_params_bps(const struct snd_pcm_hw_params *p);
+
 static inline void
 params_set_format(struct snd_pcm_hw_params *p, snd_pcm_format_t fmt)
 {
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index a11cd7d6295f..05f649b0bf00 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1706,6 +1706,34 @@ int snd_pcm_hw_param_last(struct snd_pcm_substream *pcm,
 }
 EXPORT_SYMBOL(snd_pcm_hw_param_last);
 
+/**
+ * snd_pcm_hw_params_bps - Get the number of bits per the sample.
+ * @p: hardware parameters
+ *
+ * Return: The number of bits per sample based on the format,
+ * subformat and msbits the specified hw params has.
+ */
+int snd_pcm_hw_params_bps(const struct snd_pcm_hw_params *p)
+{
+	snd_pcm_subformat_t subformat = params_subformat(p);
+	snd_pcm_format_t format = params_format(p);
+	int width;
+
+	switch (format) {
+	case SNDRV_PCM_FORMAT_S32_LE:
+	case SNDRV_PCM_FORMAT_U32_LE:
+	case SNDRV_PCM_FORMAT_S32_BE:
+	case SNDRV_PCM_FORMAT_U32_BE:
+		width = snd_pcm_subformat_width(subformat);
+		if (width)
+			return width;
+		fallthrough;
+	default:
+		return snd_pcm_format_width(format);
+	}
+}
+EXPORT_SYMBOL(snd_pcm_hw_params_bps);
+
 static int snd_pcm_lib_ioctl_reset(struct snd_pcm_substream *substream,
 				   void *arg)
 {
diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
index 5588b6a1ee8b..62dd18091f54 100644
--- a/sound/core/pcm_misc.c
+++ b/sound/core/pcm_misc.c
@@ -482,6 +482,28 @@ int snd_pcm_format_set_silence(snd_pcm_format_t format, void *data, unsigned int
 }
 EXPORT_SYMBOL(snd_pcm_format_set_silence);
 
+/**
+ * snd_pcm_subformat_width - return the bit-width of the subformat
+ * @subformat: the subformat to check
+ *
+ * Return: The bit-width of the subformat, or 0 if result is dependent
+ * on other parameters in the configuration space.
+ */
+int snd_pcm_subformat_width(snd_pcm_subformat_t subformat)
+{
+	switch (subformat) {
+	case SNDRV_PCM_SUBFORMAT_MSBITS_20:
+		return 20;
+	case SNDRV_PCM_SUBFORMAT_MSBITS_24:
+		return 24;
+	case SNDRV_PCM_SUBFORMAT_MSBITS_MAX:
+	case SNDRV_PCM_SUBFORMAT_STD:
+	default:
+		return 0;
+	}
+}
+EXPORT_SYMBOL(snd_pcm_subformat_width);
+
 /**
  * snd_pcm_hw_limit_rates - determine rate_min/rate_max fields
  * @hw: the pcm hw instance
diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index cde4d5c33771..f885724d10b0 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -13,6 +13,7 @@
 #include <sound/hdaudio.h>
 #include <sound/hda_regmap.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include "local.h"
 
 static void setup_fg_nodes(struct hdac_device *codec);
@@ -725,6 +726,129 @@ static const struct hda_rate_tbl rate_bits[] = {
 	{ 0 } /* terminator */
 };
 
+static snd_pcm_format_t snd_hdac_format_normalize(snd_pcm_format_t format)
+{
+	switch (format) {
+	case SNDRV_PCM_FORMAT_S20_LE:
+	case SNDRV_PCM_FORMAT_S24_LE:
+		return SNDRV_PCM_FORMAT_S32_LE;
+
+	case SNDRV_PCM_FORMAT_U20_LE:
+	case SNDRV_PCM_FORMAT_U24_LE:
+		return SNDRV_PCM_FORMAT_U32_LE;
+
+	case SNDRV_PCM_FORMAT_S20_BE:
+	case SNDRV_PCM_FORMAT_S24_BE:
+		return SNDRV_PCM_FORMAT_S32_BE;
+
+	case SNDRV_PCM_FORMAT_U20_BE:
+	case SNDRV_PCM_FORMAT_U24_BE:
+		return SNDRV_PCM_FORMAT_U32_BE;
+
+	default:
+		return format;
+	}
+}
+
+/**
+ * snd_hdac_stream_format_bps - obtain bits per sample value.
+ * @format:	the PCM format.
+ * @subformat:	the PCM subformat.
+ * @maxbps:	the maximum bits per sample.
+ *
+ * Return: The number of bits per sample.
+ */
+unsigned int snd_hdac_stream_format_bps(snd_pcm_format_t format, snd_pcm_subformat_t subformat,
+					unsigned int maxbps)
+{
+	struct snd_pcm_hw_params params;
+	unsigned int bps;
+
+	memset(&params, 0, sizeof(params));
+
+	params_set_format(&params, snd_hdac_format_normalize(format));
+	snd_mask_set(hw_param_mask(&params, SNDRV_PCM_HW_PARAM_SUBFORMAT),
+		     (__force unsigned int)subformat);
+
+	bps = snd_pcm_hw_params_bps(&params);
+	if (maxbps)
+		return min(bps, maxbps);
+	return bps;
+}
+EXPORT_SYMBOL_GPL(snd_hdac_stream_format_bps);
+
+/**
+ * snd_hdac_stream_format - convert format parameters to SDxFMT value.
+ * @channels:	the number of channels.
+ * @bps:	bits per sample.
+ * @rate:	the sample rate.
+ *
+ * Return: The format bitset or zero if invalid.
+ */
+unsigned int snd_hdac_stream_format(unsigned int channels, unsigned int bps, unsigned int rate)
+{
+	unsigned int val = 0;
+	int i;
+
+	for (i = 0; rate_bits[i].hz; i++) {
+		if (rate_bits[i].hz == rate) {
+			val = rate_bits[i].hda_fmt;
+			break;
+		}
+	}
+
+	if (!rate_bits[i].hz)
+		return 0;
+
+	if (channels == 0 || channels > 8)
+		return 0;
+	val |= channels - 1;
+
+	switch (bps) {
+	case 8:
+		val |= AC_FMT_BITS_8;
+		break;
+	case 16:
+		val |= AC_FMT_BITS_16;
+		break;
+	case 20:
+		val |= AC_FMT_BITS_20;
+		break;
+	case 24:
+		val |= AC_FMT_BITS_24;
+		break;
+	case 32:
+		val |= AC_FMT_BITS_32;
+		break;
+	default:
+		return 0;
+	}
+
+	return val;
+}
+EXPORT_SYMBOL_GPL(snd_hdac_stream_format);
+
+/**
+ * snd_hdac_spdif_stream_format - convert format parameters to SDxFMT value.
+ * @channels:	the number of channels.
+ * @bps:	bits per sample.
+ * @rate:	the sample rate.
+ * @spdif_ctls:	HD-audio SPDIF status bits (0 if irrelevant).
+ *
+ * Return: The format bitset or zero if invalid.
+ */
+unsigned int snd_hdac_spdif_stream_format(unsigned int channels, unsigned int bps,
+					  unsigned int rate, unsigned short spdif_ctls)
+{
+	unsigned int val = snd_hdac_stream_format(channels, bps, rate);
+
+	if (val && spdif_ctls & AC_DIG1_NONAUDIO)
+		val |= AC_FMT_TYPE_NON_PCM;
+
+	return val;
+}
+EXPORT_SYMBOL_GPL(snd_hdac_spdif_stream_format);
+
 /**
  * snd_hdac_calc_stream_format - calculate the format bitset
  * @rate: the sample rate
-- 
2.25.1

