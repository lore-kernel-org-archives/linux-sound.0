Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35AE13FD9B
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 09:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125424; cv=none; b=c1VgrWUOZBKyF9iAWpxJmJB5I0snntCemVbtttNgS8U6Urc8x0PZYVZqCTcf4DteXPQwgTmpaahnlesCXaCx/hKYhqz/GRpWAc9jyNLHPbjaI9FQqVGaQV0ghLCeM+t005JoftTkTXJCOnAjlZYDDFf+vWMlF2XhaY1bgPN3LV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125424; c=relaxed/simple;
	bh=HlGJubqfkIRgU0Aeu+B9moA7xbvwpSC/vQ/7n6B7G14=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m2UjhY+KpDP3/C+wwXKZYYaMxW3tRG2wBxFbCEX6zAFkwTYhC2bToJ6FxLjLrqTibbncvByYpyHAqPrKKwysr+DPr/HYEbLgEYqj1SBpeaHo5ypBVlOA4C/0gVLY4nSyfwjuiD8FYIyngG6HoYJALEgNysHFFN2nKKUbLC1mrpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/WEkcta; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/WEkcta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125423; x=1745661423;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HlGJubqfkIRgU0Aeu+B9moA7xbvwpSC/vQ/7n6B7G14=;
  b=Y/WEkcta3zoELwW4bmPNUJeU2zxPnRJ95fvNHpjx38hYSSMLp4UpdxgD
   18g02Z4GxSBvqBqpe6kwMjH1NogcY6+Iergj9lHe3OyT0H+Hq6VvIYyA5
   WB/Xp///b1fqPs4TiNcAJOyaGdsexThBNd2fFnH2HOBf4vIajdWmJT/0P
   lCU1ltqzZMT7w6RUN4RiMfub4CQgSnxT6kD+ASFGpLMtnWjuDC8tCIQnF
   mI9QbU6YCIKjCvZXK/iCycnd1ytcrkEAA+Dw+MuWXkexf/4sfrbEW7lMU
   08OB/gQUJvaf1UZAj39hr8jEc88brXg4o78Utf9X1IyQaCZi2RaB3xi7k
   g==;
X-CSE-ConnectionGUID: u66NWdxcTTS6RmLGZYvkeQ==
X-CSE-MsgGUID: mSW0bb0jREW2Xk0Ud4mTcg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20409226"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="20409226"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:57:03 -0700
X-CSE-ConnectionGUID: S4q3g+JSQxKtyJq+NaF/mg==
X-CSE-MsgGUID: mkAr/ahCRF+rt2XpJa8naw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25460623"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2024 02:57:00 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 7/8] ASoC: Intel: avs: Store pointer to link_stream in dma_data
Date: Fri, 26 Apr 2024 11:57:32 +0200
Message-Id: <20240426095733.3946951-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426095733.3946951-1-cezary.rojewski@intel.com>
References: <20240426095733.3946951-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While the HDAudio codec driver expectations must be met - store valid
pointer to HDAudio LINK stream in substream->runtime->private_data - the
code is more readable and easier to maintain if dma_data stores pointers
to both HOST and LINK stream.

DAI BE operations can refer to the LINK stream with data->link_stream,
similarly to how DAI FE operations access the HOST stream with
data->host_stream.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 40 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index d4557b7b1c6c..168e16e82116 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -23,13 +23,12 @@ struct avs_dma_data {
 	struct avs_tplg_path_template *template;
 	struct avs_path *path;
 	struct avs_dev *adev;
-	/*
-	 * link stream is stored within substream's runtime
-	 * private_data to fulfill the needs of codec BE path
-	 *
-	 * host stream assigned
-	 */
-	struct hdac_ext_stream *host_stream;
+
+	/* LINK-stream utilized in BE operations while HOST in FE ones. */
+	union {
+		struct hdac_ext_stream *link_stream;
+		struct hdac_ext_stream *host_stream;
+	};
 
 	struct snd_pcm_substream *substream;
 };
@@ -263,6 +262,7 @@ static int avs_dai_hda_be_startup(struct snd_pcm_substream *substream, struct sn
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct hdac_ext_stream *link_stream;
+	struct avs_dma_data *data;
 	struct hda_codec *codec;
 	int ret;
 
@@ -278,18 +278,18 @@ static int avs_dai_hda_be_startup(struct snd_pcm_substream *substream, struct sn
 		return -EBUSY;
 	}
 
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	data->link_stream = link_stream;
 	substream->runtime->private_data = link_stream;
 	return 0;
 }
 
 static void avs_dai_hda_be_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct hdac_ext_stream *link_stream;
+	struct avs_dma_data *data = snd_soc_dai_get_dma_data(dai, substream);
 
-	link_stream = substream->runtime->private_data;
-	snd_hdac_ext_stream_release(link_stream, HDAC_EXT_STREAM_TYPE_LINK);
+	snd_hdac_ext_stream_release(data->link_stream, HDAC_EXT_STREAM_TYPE_LINK);
 	substream->runtime->private_data = NULL;
-
 	avs_dai_shutdown(substream, dai);
 }
 
@@ -297,16 +297,13 @@ static int avs_dai_hda_be_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *hw_params, struct snd_soc_dai *dai)
 {
 	struct avs_dma_data *data;
-	struct hdac_ext_stream *link_stream;
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
 	if (data->path)
 		return 0;
 
-	link_stream = substream->runtime->private_data;
-
 	return avs_dai_be_hw_params(substream, hw_params, dai,
-				    hdac_stream(link_stream)->stream_tag - 1);
+				    hdac_stream(data->link_stream)->stream_tag - 1);
 }
 
 static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
@@ -323,7 +320,7 @@ static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct sn
 	if (!data->path)
 		return 0;
 
-	link_stream = substream->runtime->private_data;
+	link_stream = data->link_stream;
 	link_stream->link_prepared = false;
 	avs_path_free(data->path);
 	data->path = NULL;
@@ -347,13 +344,16 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 	struct snd_soc_pcm_stream *stream_info;
 	struct hdac_ext_stream *link_stream;
 	struct hdac_ext_link *link;
+	struct avs_dma_data *data;
 	struct hda_codec *codec;
 	struct hdac_bus *bus;
 	unsigned int format_val;
 	unsigned int bits;
 	int ret;
 
-	link_stream = runtime->private_data;
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	link_stream = data->link_stream;
+
 	if (link_stream->link_prepared)
 		return 0;
 
@@ -387,14 +387,12 @@ static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 				  struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct hdac_ext_stream *link_stream;
 	struct avs_dma_data *data;
 	int ret = 0;
 
 	dev_dbg(dai->dev, "entry %s cmd=%d\n", __func__, cmd);
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
-	link_stream = substream->runtime->private_data;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -403,7 +401,7 @@ static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		snd_hdac_ext_stream_start(link_stream);
+		snd_hdac_ext_stream_start(data->link_stream);
 
 		ret = avs_path_pause(data->path);
 		if (ret < 0) {
@@ -426,7 +424,7 @@ static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (ret < 0)
 			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
 
-		snd_hdac_ext_stream_clear(link_stream);
+		snd_hdac_ext_stream_clear(data->link_stream);
 
 		ret = avs_path_reset(data->path);
 		if (ret < 0)
-- 
2.25.1

