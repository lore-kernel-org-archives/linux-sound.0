Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6419C1AB6D4
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 09:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743759211; cv=none; b=d2lQyW8DsPkJnc9rMTcMbxqJV1NsiZ6J44hJ+4+W2y4wLfAJg1d9ChFqf4O7a6jtllsdj2Xngsx4rdkpXHM2L3PU45XySKiNCgm3NnA+eC7Nv9nnc5q1GssffwsNY8ymQMqy40ECGpTizyBgRB68mqcnVkZRJ0wR76KvjKJUK/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743759211; c=relaxed/simple;
	bh=ZcHOhSuxXw4YI9iOeGnLfvG7LYoEEhAXRy1g3iZsNjY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dFn7Jx+TKx+MjD2i55UpSfrBbCI/9wCTts0istbcIxf4ztG4hLP60faG+qM1kmh8DWknBsSpka/vcQH01K+LeE73YroqHnHpmwZIV3TOSzYQvxn6LzRA8WXg3RZF+wdjgdfMQ5EVYFBgp3b8oXtaTPOXOsEY+JA/Q3kbbRJd4Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQKw/b/m; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQKw/b/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743759208; x=1775295208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZcHOhSuxXw4YI9iOeGnLfvG7LYoEEhAXRy1g3iZsNjY=;
  b=kQKw/b/mAbbAwb+H6Nb5vyX20psxUmlIULCY5BCruImf/v6df8yYXrAV
   D3O2/uZY43LjtHfBxKOLmb0fOoUYLL2NgUXLg/2p99bpsIoQczsKpcC4H
   yySZ8i8rcLzv+xAqbpQd3ZmZUvjOcwlV+XI1o0mCG4USh4mT1T/CFkJgf
   e/dqoI/sIS1KiNe4B7ZmiKHfg8fJYLo4seAXWLnznZbE+an2m2eyYZrPL
   O0Nl+JT3qFrQ4TYKjV/2UnW6V5G0Dgk5MdNbVy1ARnVmVlJc1po4Pfh7U
   7ju1FBMfBLWXw50CmfGdeG+qPkEW7+kDJm8h6hXnZmmho4sgTIUof1E4z
   g==;
X-CSE-ConnectionGUID: /1z7CnjzRkCqk7qd57xghQ==
X-CSE-MsgGUID: 2LMHuCGlQPidxuNxuTkirw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="70566373"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="70566373"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 02:33:24 -0700
X-CSE-ConnectionGUID: pcl/bWaBT9u0L3CdnMZFDA==
X-CSE-MsgGUID: +niLBnSvSvC+I7LDyVmlBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="158248642"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2025 02:33:06 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 08/12] ASoC: Intel: avs: PCM operations for LNL-based platforms
Date: Fri,  4 Apr 2025 11:49:49 +0200
Message-Id: <20250404094953.3657679-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250404094953.3657679-1-cezary.rojewski@intel.com>
References: <20250404094953.3657679-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Starting from LNL platform the so-called non-HDAudio transfer types,
e.g.: I2S/DMIC, utilize HDAudio LINK DMA rather than GPDMA for the data
streaming. In essence, all transfer types now utilize HDAudio Link. Most
of the existing code can be reused with the major difference being
HDAudio Link query method:

- fetch the Link by codec.addr in standard HDAudio transfer case
- fetch the Link by LEPTR.ID in non-HDAudio transfer case

To make the unification happen, store pointer to the Link in dma_data
and utilize it in the common code. And to avoid confusion in
transfer-type naming between cAVS-ACE 1.x (SkyLake till MeteorLake) and
ACE 2.0+ architecture (LunarLake onward), use:

- 'hda' for typical HDAudio transfer case
- 'nonhda' for non-HDAudio transfer case, cAVS-ACE 1.x
- 'althda' for non-HDAudio transfer case, ACE 2.0+

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 116 ++++++++++++++++++++++++++++----------
 1 file changed, 85 insertions(+), 31 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index dac463390da1..d7d3c696be28 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -32,6 +32,7 @@ struct avs_dma_data {
 	};
 
 	struct work_struct period_elapsed_work;
+	struct hdac_ext_link *link;
 	struct snd_pcm_substream *substream;
 };
 
@@ -278,32 +279,75 @@ static const struct snd_soc_dai_ops avs_dai_nonhda_be_ops = {
 	.trigger = avs_dai_nonhda_be_trigger,
 };
 
-static int avs_dai_hda_be_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+static int __avs_dai_hda_be_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai,
+				    struct hdac_ext_link *link)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct hdac_ext_stream *link_stream;
 	struct avs_dma_data *data;
-	struct hda_codec *codec;
 	int ret;
 
 	ret = avs_dai_startup(substream, dai);
 	if (ret)
 		return ret;
 
-	codec = dev_to_hda_codec(snd_soc_rtd_to_codec(rtd, 0)->dev);
-	link_stream = snd_hdac_ext_stream_assign(&codec->bus->core, substream,
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	link_stream = snd_hdac_ext_stream_assign(&data->adev->base.core, substream,
 						 HDAC_EXT_STREAM_TYPE_LINK);
 	if (!link_stream) {
 		avs_dai_shutdown(substream, dai);
 		return -EBUSY;
 	}
 
-	data = snd_soc_dai_get_dma_data(dai, substream);
 	data->link_stream = link_stream;
-	substream->runtime->private_data = link_stream;
+	data->link = link;
 	return 0;
 }
 
+static int avs_dai_hda_be_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct hdac_ext_link *link;
+	struct avs_dma_data *data;
+	struct hda_codec *codec;
+	int ret;
+
+	codec = dev_to_hda_codec(snd_soc_rtd_to_codec(rtd, 0)->dev);
+
+	link = snd_hdac_ext_bus_get_hlink_by_addr(&codec->bus->core, codec->core.addr);
+	if (!link)
+		return -EINVAL;
+
+	ret = __avs_dai_hda_be_startup(substream, dai, link);
+	if (!ret) {
+		data = snd_soc_dai_get_dma_data(dai, substream);
+		substream->runtime->private_data = data->link_stream;
+	}
+
+	return ret;
+}
+
+static int avs_dai_i2shda_be_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct avs_dev *adev = to_avs_dev(dai->component->dev);
+	struct hdac_ext_link *link;
+
+	link = snd_hdac_ext_bus_get_hlink_by_id(&adev->base.core, AZX_REG_ML_LEPTR_ID_INTEL_SSP);
+	if (!link)
+		return -EINVAL;
+	return __avs_dai_hda_be_startup(substream, dai, link);
+}
+
+static int avs_dai_dmichda_be_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct avs_dev *adev = to_avs_dev(dai->component->dev);
+	struct hdac_ext_link *link;
+
+	link = snd_hdac_ext_bus_get_hlink_by_id(&adev->base.core, AZX_REG_ML_LEPTR_ID_INTEL_DMIC);
+	if (!link)
+		return -EINVAL;
+	return __avs_dai_hda_be_startup(substream, dai, link);
+}
+
 static void avs_dai_hda_be_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct avs_dma_data *data = snd_soc_dai_get_dma_data(dai, substream);
@@ -313,6 +357,14 @@ static void avs_dai_hda_be_shutdown(struct snd_pcm_substream *substream, struct
 	avs_dai_shutdown(substream, dai);
 }
 
+static void avs_dai_althda_be_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct avs_dma_data *data = snd_soc_dai_get_dma_data(dai, substream);
+
+	snd_hdac_ext_stream_release(data->link_stream, HDAC_EXT_STREAM_TYPE_LINK);
+	avs_dai_shutdown(substream, dai);
+}
+
 static int avs_dai_hda_be_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *hw_params, struct snd_soc_dai *dai)
 {
@@ -328,13 +380,8 @@ static int avs_dai_hda_be_hw_params(struct snd_pcm_substream *substream,
 
 static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct avs_dma_data *data;
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct hdac_ext_stream *link_stream;
-	struct hdac_ext_link *link;
-	struct hda_codec *codec;
-
-	dev_dbg(dai->dev, "%s: %s\n", __func__, dai->name);
+	struct avs_dma_data *data;
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
 	if (!data->path)
@@ -346,27 +393,19 @@ static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct sn
 	data->path = NULL;
 
 	/* clear link <-> stream mapping */
-	codec = dev_to_hda_codec(snd_soc_rtd_to_codec(rtd, 0)->dev);
-	link = snd_hdac_ext_bus_get_hlink_by_addr(&codec->bus->core, codec->core.addr);
-	if (!link)
-		return -EINVAL;
-
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		snd_hdac_ext_bus_link_clear_stream_id(link, hdac_stream(link_stream)->stream_tag);
+		snd_hdac_ext_bus_link_clear_stream_id(data->link,
+						      hdac_stream(link_stream)->stream_tag);
 
 	return 0;
 }
 
 static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	const struct snd_soc_pcm_stream *stream_info;
 	struct hdac_ext_stream *link_stream;
-	struct hdac_ext_link *link;
 	struct avs_dma_data *data;
-	struct hda_codec *codec;
-	struct hdac_bus *bus;
 	unsigned int format_val;
 	unsigned int bits;
 	int ret;
@@ -377,23 +416,18 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 	if (link_stream->link_prepared)
 		return 0;
 
-	codec = dev_to_hda_codec(snd_soc_rtd_to_codec(rtd, 0)->dev);
-	bus = &codec->bus->core;
 	stream_info = snd_soc_dai_get_pcm_stream(dai, substream->stream);
 	bits = snd_hdac_stream_format_bits(runtime->format, runtime->subformat,
 					   stream_info->sig_bits);
 	format_val = snd_hdac_stream_format(runtime->channels, bits, runtime->rate);
 
-	snd_hdac_ext_stream_decouple(bus, link_stream, true);
+	snd_hdac_ext_stream_decouple(&data->adev->base.core, link_stream, true);
 	snd_hdac_ext_stream_reset(link_stream);
 	snd_hdac_ext_stream_setup(link_stream, format_val);
 
-	link = snd_hdac_ext_bus_get_hlink_by_addr(bus, codec->core.addr);
-	if (!link)
-		return -EINVAL;
-
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		snd_hdac_ext_bus_link_set_stream_id(link, hdac_stream(link_stream)->stream_tag);
+		snd_hdac_ext_bus_link_set_stream_id(data->link,
+						    hdac_stream(link_stream)->stream_tag);
 
 	ret = avs_dai_prepare(substream, dai);
 	if (ret)
@@ -468,6 +502,26 @@ static const struct snd_soc_dai_ops avs_dai_hda_be_ops = {
 	.trigger = avs_dai_hda_be_trigger,
 };
 
+__maybe_unused
+static const struct snd_soc_dai_ops avs_dai_i2shda_be_ops = {
+	.startup = avs_dai_i2shda_be_startup,
+	.shutdown = avs_dai_althda_be_shutdown,
+	.hw_params = avs_dai_hda_be_hw_params,
+	.hw_free = avs_dai_hda_be_hw_free,
+	.prepare = avs_dai_hda_be_prepare,
+	.trigger = avs_dai_hda_be_trigger,
+};
+
+__maybe_unused
+static const struct snd_soc_dai_ops avs_dai_dmichda_be_ops = {
+	.startup = avs_dai_dmichda_be_startup,
+	.shutdown = avs_dai_althda_be_shutdown,
+	.hw_params = avs_dai_hda_be_hw_params,
+	.hw_free = avs_dai_hda_be_hw_free,
+	.prepare = avs_dai_hda_be_prepare,
+	.trigger = avs_dai_hda_be_trigger,
+};
+
 static int hw_rule_param_size(struct snd_pcm_hw_params *params, struct snd_pcm_hw_rule *rule)
 {
 	struct snd_interval *interval = hw_param_interval(params, rule->var);
-- 
2.25.1

