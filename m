Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D72FC197A0
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 12:04:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbjKQMER (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 07:04:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjKQMEQ (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 07:04:16 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E94CE
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 04:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222653; x=1731758653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=no2TM0O3AEn2g6UeUm/R1c/jdkTlCSH/JG52HRR65os=;
  b=lAIyOYW/xpLxrXv6Adt2owxZLck7XG4/rGDnQb/FtdL2cTpfkhj+lTfc
   Xtuq03Ne9+oUpquh6/TWXRFXKJEWbCuE6ik6BQQOI4Ei4MFDfTjyf6hcn
   gNfNjxHjqW5cm03LyajrMsZuAnR2jgK6c5mx0G0T0y6SH42/HaGvyWygg
   8+Piq7EyDLx5G4QXIWOWpVKjlLrBFUa0TzyynPUSfEALkUpRvQO8peuH1
   wrgvnpxZEHDLdDszMiNYzY471Tknyy8cYnp8X6YCJwb/HcjYoD68kvDYs
   AxnHraM0649t8Qnrfh86shRtbWo4F9+h0edeb1FL8CqbDE8lFUBa+dJIK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381675212"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="381675212"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 04:04:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="883110167"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="883110167"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2023 04:04:10 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v5 04/16] ALSA: hda: Upgrade stream-format infrastructure
Date:   Fri, 17 Nov 2023 13:05:58 +0100
Message-Id: <20231117120610.1755254-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117120610.1755254-1-cezary.rojewski@intel.com>
References: <20231117120610.1755254-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Introduce a set of functions that ultimately facilite SDxFMT-related
calculations in atomic manner:

First, introduce snd_pcm_subformat_width() and snd_pcm_hw_params_bits()
helpers that separate the base functionality from the HDAudio-specific
one.

snd_hdac_format_normalize() - format converter. S20_LE, S24_LE and their
unsigned and BE friends are invalid from HDAudio perspective but still
can be specified as function argument due to compatibility reasons.

snd_hdac_stream_format_bits() - obtain just the bits-per-sample value.
Does not ignore subformat and msbits parameters.

snd_hdac_stream_format() and snd_hdac_spdif_stream_format() - obtain the
SDxFMT value given the audio format parameters. The former is stripped
away of spdif-related information. Useful for users that do not care
about them.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hdaudio.h    |   5 ++
 include/sound/pcm_params.h |   2 +
 sound/core/pcm_lib.c       |  34 ++++++++++
 sound/hda/hdac_device.c    | 124 +++++++++++++++++++++++++++++++++++++
 4 files changed, 165 insertions(+)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 7cfea9e7f6e4..b00c631c4053 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -140,6 +140,11 @@ int snd_hdac_get_connections(struct hdac_device *codec, hda_nid_t nid,
 			     hda_nid_t *conn_list, int max_conns);
 int snd_hdac_get_sub_nodes(struct hdac_device *codec, hda_nid_t nid,
 			   hda_nid_t *start_id);
+unsigned int snd_hdac_stream_format_bits(snd_pcm_format_t format, snd_pcm_subformat_t subformat,
+					 unsigned int maxbits);
+unsigned int snd_hdac_stream_format(unsigned int channels, unsigned int bits, unsigned int rate);
+unsigned int snd_hdac_spdif_stream_format(unsigned int channels, unsigned int bits,
+					  unsigned int rate, unsigned short spdif_ctls);
 unsigned int snd_hdac_calc_stream_format(unsigned int rate,
 					 unsigned int channels,
 					 snd_pcm_format_t format,
diff --git a/include/sound/pcm_params.h b/include/sound/pcm_params.h
index ba184f49f7e1..fbf35df6e5cf 100644
--- a/include/sound/pcm_params.h
+++ b/include/sound/pcm_params.h
@@ -362,6 +362,8 @@ static inline int params_physical_width(const struct snd_pcm_hw_params *p)
 	return snd_pcm_format_physical_width(params_format(p));
 }
 
+int snd_pcm_hw_params_bits(const struct snd_pcm_hw_params *p);
+
 static inline void
 params_set_format(struct snd_pcm_hw_params *p, snd_pcm_format_t fmt)
 {
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index a11cd7d6295f..41103e5c43ce 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1706,6 +1706,40 @@ int snd_pcm_hw_param_last(struct snd_pcm_substream *pcm,
 }
 EXPORT_SYMBOL(snd_pcm_hw_param_last);
 
+/**
+ * snd_pcm_hw_params_bits - Get the number of bits per the sample.
+ * @p: hardware parameters
+ *
+ * Return: The number of bits per sample based on the format,
+ * subformat and msbits the specified hw params has.
+ */
+int snd_pcm_hw_params_bits(const struct snd_pcm_hw_params *p)
+{
+	snd_pcm_subformat_t subformat = params_subformat(p);
+	snd_pcm_format_t format = params_format(p);
+
+	switch (format) {
+	case SNDRV_PCM_FORMAT_S32_LE:
+	case SNDRV_PCM_FORMAT_U32_LE:
+	case SNDRV_PCM_FORMAT_S32_BE:
+	case SNDRV_PCM_FORMAT_U32_BE:
+		switch (subformat) {
+		case SNDRV_PCM_SUBFORMAT_MSBITS_20:
+			return 20;
+		case SNDRV_PCM_SUBFORMAT_MSBITS_24:
+			return 24;
+		case SNDRV_PCM_SUBFORMAT_MSBITS_MAX:
+		case SNDRV_PCM_SUBFORMAT_STD:
+		default:
+			break;
+		}
+		fallthrough;
+	default:
+		return snd_pcm_format_width(format);
+	}
+}
+EXPORT_SYMBOL(snd_pcm_hw_params_bits);
+
 static int snd_pcm_lib_ioctl_reset(struct snd_pcm_substream *substream,
 				   void *arg)
 {
diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index cde4d5c33771..556bd24f4014 100644
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
+ * snd_hdac_stream_format_bits - obtain bits per sample value.
+ * @format:	the PCM format.
+ * @subformat:	the PCM subformat.
+ * @maxbits:	the maximum bits per sample.
+ *
+ * Return: The number of bits per sample.
+ */
+unsigned int snd_hdac_stream_format_bits(snd_pcm_format_t format, snd_pcm_subformat_t subformat,
+					 unsigned int maxbits)
+{
+	struct snd_pcm_hw_params params;
+	unsigned int bits;
+
+	memset(&params, 0, sizeof(params));
+
+	params_set_format(&params, snd_hdac_format_normalize(format));
+	snd_mask_set(hw_param_mask(&params, SNDRV_PCM_HW_PARAM_SUBFORMAT),
+		     (__force unsigned int)subformat);
+
+	bits = snd_pcm_hw_params_bits(&params);
+	if (maxbits)
+		return min(bits, maxbits);
+	return bits;
+}
+EXPORT_SYMBOL_GPL(snd_hdac_stream_format_bits);
+
+/**
+ * snd_hdac_stream_format - convert format parameters to SDxFMT value.
+ * @channels:	the number of channels.
+ * @bits:	bits per sample.
+ * @rate:	the sample rate.
+ *
+ * Return: The format bitset or zero if invalid.
+ */
+unsigned int snd_hdac_stream_format(unsigned int channels, unsigned int bits, unsigned int rate)
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
+	switch (bits) {
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
+ * @bits:	bits per sample.
+ * @rate:	the sample rate.
+ * @spdif_ctls:	HD-audio SPDIF status bits (0 if irrelevant).
+ *
+ * Return: The format bitset or zero if invalid.
+ */
+unsigned int snd_hdac_spdif_stream_format(unsigned int channels, unsigned int bits,
+					  unsigned int rate, unsigned short spdif_ctls)
+{
+	unsigned int val = snd_hdac_stream_format(channels, bits, rate);
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

