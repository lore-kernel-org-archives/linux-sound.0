Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC470C072A2
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 12:04:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjKQMEj (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 07:04:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbjKQMEg (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 07:04:36 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35412D5
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 04:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222672; x=1731758672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c3yVrW2yGcgh/DiL8v6XGhzt0QppWTB/iJq5v8b7/QA=;
  b=S1yYWYIpjUjS6aqO6PyDZHRpXj8HB0tvoUM4BdfTYFS3vBxGUOvPlVZ+
   HcFcugBhyLHlVlJoT+cf+BvUu5Sdf3pU5kQJuiIUAI8Ixg+fsLXLO7WrL
   nx9WlqnIaY3EyjU9Br4YaGEXhpRZgx6U8SOKgHXlzLpqOxfMPXHZi7rd+
   Z7Mb0Oucp9dw48NioF5Nl3RiBvdxrNdrItVP3nRnEghW+Nt02/tz/aZuK
   e/e8boTNUZrq1psDn+sD0G5+dr6ZhGwhT1POZmJGf7d1NByzu9veWKkYE
   YYjcveSPa7cIsbNhUXQu8Ia6nswl1AK/9SaYpE1ZWWLgqbuzaMBm0gfhr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381675296"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="381675296"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 04:04:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="883110217"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="883110217"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2023 04:04:29 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v5 13/16] ASoC: Intel: avs: Switch to new stream-format interface
Date:   Fri, 17 Nov 2023 13:06:07 +0100
Message-Id: <20231117120610.1755254-14-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/loader.c |  4 ++--
 sound/soc/intel/avs/path.c   |  2 +-
 sound/soc/intel/avs/pcm.c    | 19 ++++++++++++++-----
 sound/soc/intel/avs/probes.c |  3 +--
 4 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 65dd8f140fc1..e83ce6a35755 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -371,7 +371,7 @@ int avs_hda_load_basefw(struct avs_dev *adev, struct firmware *fw)
 	hstream = hdac_stream(estream);
 
 	/* code loading performed with default format */
-	sdfmt = snd_hdac_calc_stream_format(48000, 1, SNDRV_PCM_FORMAT_S32_LE, 32, 0);
+	sdfmt = snd_hdac_stream_format(1, 32, 48000);
 	ret = snd_hdac_dsp_prepare(hstream, sdfmt, fw->size, &dmab);
 	if (ret < 0)
 		goto release_stream;
@@ -438,7 +438,7 @@ int avs_hda_load_library(struct avs_dev *adev, struct firmware *lib, u32 id)
 	stream = hdac_stream(estream);
 
 	/* code loading performed with default format */
-	sdfmt = snd_hdac_calc_stream_format(48000, 1, SNDRV_PCM_FORMAT_S32_LE, 32, 0);
+	sdfmt = snd_hdac_stream_format(1, 32, 48000);
 	ret = snd_hdac_dsp_prepare(stream, sdfmt, lib->size, &dmab);
 	if (ret < 0)
 		goto release_stream;
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index aa8b50b931c3..3aa16ee8d34c 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -87,7 +87,7 @@ static bool avs_test_hw_params(struct snd_pcm_hw_params *params,
 	return (params_rate(params) == fmt->sampling_freq &&
 		params_channels(params) == fmt->num_channels &&
 		params_physical_width(params) == fmt->bit_depth &&
-		params_width(params) == fmt->valid_bit_depth);
+		snd_pcm_hw_params_bits(params) == fmt->valid_bit_depth);
 }
 
 static struct avs_tplg_path *
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 463dbba18426..f586a804099a 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -335,20 +335,25 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct hdac_ext_stream *link_stream = runtime->private_data;
+	struct snd_soc_pcm_stream *stream_info;
+	struct hdac_ext_stream *link_stream;
 	struct hdac_ext_link *link;
 	struct hda_codec *codec;
 	struct hdac_bus *bus;
 	unsigned int format_val;
+	unsigned int bits;
 	int ret;
 
+	link_stream = runtime->private_data;
 	if (link_stream->link_prepared)
 		return 0;
 
 	codec = dev_to_hda_codec(snd_soc_rtd_to_codec(rtd, 0)->dev);
 	bus = &codec->bus->core;
-	format_val = snd_hdac_calc_stream_format(runtime->rate, runtime->channels, runtime->format,
-						 runtime->sample_bits, 0);
+	stream_info = snd_soc_dai_get_pcm_stream(dai, substream->stream);
+	bits = snd_hdac_stream_format_bits(runtime->format, runtime->subformat,
+					   stream_info->sig_bits);
+	format_val = snd_hdac_stream_format(runtime->channels, bits, runtime->rate);
 
 	snd_hdac_ext_stream_reset(link_stream);
 	snd_hdac_ext_stream_setup(link_stream, format_val);
@@ -600,10 +605,12 @@ static int avs_dai_fe_hw_free(struct snd_pcm_substream *substream, struct snd_so
 static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_stream *stream_info;
 	struct avs_dma_data *data;
 	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct hdac_ext_stream *host_stream;
 	unsigned int format_val;
+	unsigned int bits;
 	int ret;
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
@@ -614,8 +621,10 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 
 	snd_hdac_stream_reset(hdac_stream(host_stream));
 
-	format_val = snd_hdac_calc_stream_format(runtime->rate, runtime->channels, runtime->format,
-						 runtime->sample_bits, 0);
+	stream_info = snd_soc_dai_get_pcm_stream(dai, substream->stream);
+	bits = snd_hdac_stream_format_bits(runtime->format, runtime->subformat,
+					   stream_info->sig_bits);
+	format_val = snd_hdac_stream_format(runtime->channels, bits, runtime->rate);
 
 	ret = snd_hdac_stream_set_params(hdac_stream(host_stream), format_val);
 	if (ret < 0)
diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index bdc6b30dc009..817e543036f2 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -140,8 +140,7 @@ static int avs_probe_compr_set_params(struct snd_compr_stream *cstream,
 	bps = snd_pcm_format_physical_width(format);
 	if (bps < 0)
 		return bps;
-	format_val = snd_hdac_calc_stream_format(params->codec.sample_rate, params->codec.ch_out,
-						 format, bps, 0);
+	format_val = snd_hdac_stream_format(params->codec.ch_out, bps, params->codec.sample_rate);
 	ret = snd_hdac_stream_set_params(hdac_stream(host_stream), format_val);
 	if (ret < 0)
 		return ret;
-- 
2.25.1

